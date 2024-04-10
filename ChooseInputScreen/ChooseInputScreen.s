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

    ; -------------------


    ; unpack frame 0 using zx0 standard decompressor
    ld      hl, PlaneRotating_Images.frame_0
    ld      de, UncompressedData
    call    dzx0_standard


    ; put it on page 0 NAMTBL
    ld      ixh, 52
    ld      b, 71
    ld      de, SC5_NAMTBL_PAGE_0
    call    DrawImage




    ; -------------------



    jp      $

    ret


; Inputs:
;   IXH: image width in bytes
;   B: image height in pixels
;   DE: VRAM destiny addr (lowest 16 bits)
DrawImage:
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