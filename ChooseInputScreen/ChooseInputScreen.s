ChooseInputScreen:

    ; change to screen 5
    ld      a, 5
    call    BIOS_CHGMOD


    ld 		a, 1      	            ; Foreground color
    ld 		(BIOS_FORCLR), a    
    ld 		a, 1  		            ; Background color
    ld 		(BIOS_BAKCLR), a     
    ld 		a, 1      	            ; Border color
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color


    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToTransparent

    ; disable sprites to improve VDP commands speed
    call    DisableSprites


    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a


    ld      hl, PlaneRotating_Palette
    call    LoadPalette

    call    BIOS_ENASCR

.init:

    xor     a
    ld      (CurrentVRAMpage), a

    ld      hl, PlaneRotating_Data
    ;ld      hl, PlaneRotating_Images.frame_0; debug
    ld      (PlaneRotating_Data_CurrentFrame_Addr), hl

    ; TODO: clear UncompressedData RAM area

    ; --------------------------------------

.loop:




    call    Wait_Vblank

    ; TODO:
    ; VDP fill command to clear top screen area (no need to wait it ends)

    ; unpack next frame using zx0 standard decompressor
    ; ld      hl, PlaneRotating_Images.frame_0
    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      a, (hl)
    ld      e, a
    inc     hl
    ld      a, (hl)
    ld      d, a
    ex      de, hl
    ld      de, UncompressedData
    call    dzx0_standard

    ld      a, (CurrentVRAMpage)
    or      a
    jp      nz, .showPage_1

.showPage_0:
    ; --- set current NAMTBL to page 0 (0x00000)
    ; bits:    16 15        7
    ;           | |         |
    ; 0x00000 = 0 0000 0000 0000 0000
    ; R#2 : 0 a16 a15 1 1 1 1 1
    ld      b, 0001 1111 b  ; data
    ld      c, 2            ; register #
    call    BIOS_WRTVDP

    ; put Uncompressed image on page 1 NAMTBL (inactive page)
    ld      de, SC5_NAMTBL_PAGE_1
    call    ChooseInputScreen_DrawImage

    ld      a, 1
    ld      (CurrentVRAMpage), a

    jp      .continue


.showPage_1:
    ; --- set current NAMTBL to page 1 (0x00000)
    ; bits:    16 15        7
    ;           | |         |
    ; 0x00000 = 0 0000 0000 0000 0000
    ; R#2 : 0 a16 a15 1 1 1 1 1
    ld      b, 0011 1111 b  ; data
    ld      c, 2            ; register #
    call    BIOS_WRTVDP

    ; put Uncompressed image on page 0 NAMTBL (inactive page)
    ld      de, SC5_NAMTBL_PAGE_0
    call    ChooseInputScreen_DrawImage

    ld      a, 0
    ld      (CurrentVRAMpage), a

    ; jp      .continue

.continue:

    ; go to next PlaneRotating_Data
    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      bc, PLANE_ROTATING_DATA_STRUCT_SIZE
    add     hl, bc
    ld      (PlaneRotating_Data_CurrentFrame_Addr), hl


    ; if (PlaneRotating_Data_CurrentFrame_Addr >= PlaneRotating_Data.end) { jp .init; }
    ld      de, PlaneRotating_Data.end
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp      nc, .init


    jp      .loop

    ; -------------------




    ret


; Inputs:
;   DE: VRAM destiny addr (lowest 16 bits)
ChooseInputScreen_DrawImage:
    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    inc     hl
    inc     hl
    ld      a, (hl)
    ld      ixh, a      ;   IXH: image width in bytes
    inc     hl
    ld      b, (hl)     ;   B: image height in pixels


    ; put image horizontally centralized
    ; DE += ((128/2) - IXh/2)
    push    bc
        ld      a, 64
        ld      c, ixh
        srl     c                 ; shift right C
        sub     c
        ld      c, a
        ld      b, 0
        ex      de, hl
        add     hl, bc
        ex      de, hl
    pop     bc


    ld		hl, UncompressedData   				    ; RAM address (source)
    ; ld		de, SC5_NAMTBL_PAGE_0                   ; VRAM address (destiny)
    ; ld      b, 71 ; height
.loop:
    push    bc
        push    de
            ; write to VRAM bitmap area
            ld      a, 0000 0000 b                      ; highest bit of VRAM addr (bit 16)
            ex      de, hl
                call    SetVdp_Write
            ex      de, hl
            ; ld      b, 52                       ; width in bytes
            ld      b, ixh
            ld      c, PORT_0
            otir
        pop     de
        
        ; DE += 128
        push    hl
            ex      de, hl
                ld      bc, 128         ; next sc5 line
                add     hl, bc
            ex      de, hl
        pop     hl

    pop     bc

    djnz    .loop
    ret