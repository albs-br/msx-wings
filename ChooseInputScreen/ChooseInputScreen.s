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
    ; call    DisableSprites


    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0
    ld	    (Seg_P8000_SW), a


    ld      hl, PlaneRotating_Palette
    call    LoadPalette


    ; ------------------------------------------------------------------------

    ; test sprite chars

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; load "JOYSTICK" and "KEYBOARD" 8x8 char patterns to SPRATR
    ld      a, 0000 0000 b
    ld      hl, SC5_SPRPAT
    call    SetVdp_Write
    ld      c, PORT_0
    ; ld      hl, SpritePattern_PlayerPlane_0_and_1
    ld      a, 'J' ; ASCII code 
    call    Get_MediumFont_PatternAddr
    ld      b, 16;SpritePattern_PlayerPlane_0_and_1.size
    otir

    ld      c, PORT_0
    ; ld      hl, SpritePattern_PlayerPlane_0_and_1
    ld      a, 'O' ; ASCII code 
    call    Get_MediumFont_PatternAddr
    ld      b, 16;SpritePattern_PlayerPlane_0_and_1.size
    otir

    ; set SPRCOL
    ld      a, 0000 0000 b
    ld      hl, SC5_SPRCOL
    call    SetVdp_Write
    ld      c, PORT_0
    ld      b, 0 ; 0=256
.loop_1: ; iterate 256 times
        ld      a, 0x0d ; color
        out     (c), a
    djnz    .loop_1
.loop_2: ; iterate 256 times
        ld      a, 0x0d ; color
        out     (c), a
    djnz    .loop_2

    ;show sprite #0
    ld      a, 0000 0000 b
    ld      hl, SC5_SPRATR
    call    SetVdp_Write
    ld      b, TEST_SPRATR.size
    ld      c, PORT_0
    ld      hl, TEST_SPRATR
    otir
    ; ------------------------------------------------------------------------


    call    BIOS_ENASCR


    ; clear UncompressedData RAM area
    ld      hl, UncompressedData            ; source
    xor     a
    ld      (hl), a                         ; clear first byte
    ld      de, UncompressedData + 1        ; destiny
    ld      bc, UncompressedData.size - 1   ; size
    ldir                                    ; Copy BC bytes from HL to DE

; ---- plane animation

    xor     a
    ld      (CurrentVRAMpage), a

.init:

    ld      a, -1 ; must be started at -1 (because of the double buffering, the frame current shown is actually the previous processed)
    ld      (CurrentFrameNumber), a


    ; ; ---- debug

    ; ld      a, 0000 0000 b                      ; highest bit of VRAM addr (bit 16)
    ; ld      hl, 0x0000 + 64
    ; call    SetVdp_Write
    ; ld      b, 16
    ; ld      c, PORT_0
    ; ld      hl, TEST_PIXELS
    ; otir

    ; ld      a, 0000 0000 b                      ; highest bit of VRAM addr (bit 16)
    ; ld      hl, 0x8000 + 64
    ; call    SetVdp_Write
    ; ld      b, 16
    ; ld      c, PORT_0
    ; ld      hl, TEST_PIXELS
    ; otir
    ; ; ---- debug


    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0
    ld	    (Seg_P8000_SW), a

    ld      hl, PlaneRotating_Data
    ld      (PlaneRotating_Data_CurrentFrame_Addr), hl

    ; --------------------------------------

.loop:




    call    Wait_Vblank

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

    ; clear page 1 top area
    ; VDP fill command to clear top screen area (no need to wait it ends)
    ld      hl, ClearTopScreenArea_Page_1_HMMV_Parameters
    call    Execute_VDP_HMMV        ; High speed move VDP to VRAM (fills an area with one single color)

    call    .unpackFrame

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

    ; clear page 0 top area
    ; VDP fill command to clear top screen area (no need to wait it ends)
    ld      hl, ClearTopScreenArea_Page_0_HMMV_Parameters
    call    Execute_VDP_HMMV        ; High speed move VDP to VRAM (fills an area with one single color)

    call    .unpackFrame

    ; put Uncompressed image on page 0 NAMTBL (inactive page)
    ld      de, SC5_NAMTBL_PAGE_0
    call    ChooseInputScreen_DrawImage

    ld      a, 0
    ld      (CurrentVRAMpage), a

    ; jp      .continue

.continue:

    ld      hl, CurrentFrameNumber
    inc     (hl)

    ; go to next PlaneRotating_Data
    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      bc, PLANE_ROTATING_DATA_STRUCT_SIZE
    add     hl, bc
    ld      (PlaneRotating_Data_CurrentFrame_Addr), hl

    ; if (PlaneRotating_Data_CurrentFrame_Addr >= PlaneRotating_Data.end) { jp .init; }
    ; ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      de, PlaneRotating_Data.end
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp      nc, .init



    jp      .loop

    ; -------------------
    ret

; .setInitFlag:
;     ld      (InitFlag)

.unpackFrame:

    ; unpack next frame using zx0 standard decompressor
    ; ld      hl, PlaneRotating_Images.frame_0
    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      b, (hl) ; get MegaRom page

    inc     hl
    ld      a, (hl) ; get address low byte
    ld      e, a
    inc     hl
    ld      a, (hl) ; get address high byte
    ld      d, a
    ex      de, hl  
    ld      de, UncompressedData

    ; set MegaROM page for current frame data
    ld      a, b
    ld	    (Seg_P8000_SW), a

    call    dzx0_standard

    ret



; Inputs:
;   DE: VRAM destiny addr (lowest 16 bits)
ChooseInputScreen_DrawImage:

    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0
    ld	    (Seg_P8000_SW), a

    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)

    inc     hl          ; skip packed frame data MegaROM page 

    inc     hl
    inc     hl          ; skip packed frame data address 

    ld      a, (hl)
    ld      ixh, a      ;   IXH: image width in bytes
    inc     hl
    ld      b, (hl)     ;   B: image height in pixels

    inc     hl
    ld      a, (hl)
    ld      iyl, a      ;   IYl: delta x to centralize image (low byte)
    inc     hl
    ld      a, (hl)
    ld      iyh, a      ;   IYh: delta x to centralize image (high byte)

    ; adjust image vertically
    ; DE += "lines at top of screen before image"
    push    bc
        inc     hl
        ld      c, (hl)
        inc     hl
        ld      b, (hl)     ; BC = lines at top of screen before image (word)
        ex      de, hl
            add     hl, bc
        ex      de, hl
    pop     bc

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

    ;DE += IY
    push    bc
        push    iy
        pop     bc
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
            ld      b, ixh                       ; width in bytes
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

; ; ---- debug
; TEST_PIXELS: 
;     db 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0
;     db 0xe0, 0xe0, 0xe0, 0xe0, 0xe0, 0xe0, 0xe0, 0xe0

TEST_SPRATR:
    db 160, 40, 0, 0
    db 160, 40+16, 0, 0
.size: equ $ - TEST_SPRATR

STRING_JOYSTICK:    db 'JOYSTICK', 0
STRING_KEYBOARD:    db 'KEYBOARD', 0