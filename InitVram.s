InitVram:

    call    Screen11

    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToTransparent

    ; set Video RAM active (instead of Expansion RAM)
    ; ld      b, 0000 0000 b  ; data
    ; ld      c, 45            ; register #
    ; call    BIOS_WRTVDP



; ---- set SPRATR to 0x1fa00 (SPRCOL is automatically set 512 bytes before SPRATR, so 0x1f800)
    ; bits:    16 14        7
    ;           |  |        |
    ; 0x1fa00 = 1 1111 1010 1000 0000
    ; low bits (aaaaaaaa: bits 14 to 7)
    ld      b, 1111 0101 b  ; data
    ld      c, 5            ; register #
    call    BIOS_WRTVDP
    ; high bits (000000aa: bits 16 to 15)
    ld      b, 0000 0011 b  ; data
    ld      c, 11           ; register #
    call    BIOS_WRTVDP

; ---- set SPRPAT to 0x1f000
    ; bits:    16     11
    ;           |      |
    ; 0x1fa00 = 1 1111 0000 0000 0000
    ; high bits (00aaaaaa: bits 16 to 11)
    ld      b, 0011 1110 b  ; data
    ld      c, 6            ; register #
    call    BIOS_WRTVDP

NAMTBL:     equ 0x0000
SPRPAT:     equ 0xf000 ; actually 0x1f000, but 17 bits address are not accepted
SPRCOL:     equ 0xf800
SPRATR:     equ 0xfa00




    ld      hl, PaletteData
    call    LoadPalette



; --------- Load sprites

    ; Spr 0 and 1 patterns
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Write
    ld      b, SpritePattern_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpritePattern_0_and_1
    otir

    ; Spr 2 and 3 patterns
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + 64
    call    SetVdp_Write
    ld      b, SpritePattern_2_and_3.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpritePattern_2_and_3
    otir


    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      b, SpriteColors_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_0_and_1
    otir

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ld      b, SpriteColors_2_and_3.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_2_and_3
    otir



    ; copy from initial sprite attributes to buffer
    ld      hl, InitialSpriteAttributes
    ld      de, SpriteAttrTableBuffer
    ld      bc, InitialSpriteAttributes.size
    ldir



    ; ; Atributes of all sprites
    ; ld      a, 0000 0001 b
    ; ld      hl, SPRATR
    ; call    SetVdp_Write
    ; ld      b, InitialSpriteAttributes.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ; ld      hl, InitialSpriteAttributes
    ; otir

; -----------

    ; Load test bg image
    ; ld		hl, ImageData_1        			        ; RAM address (source)
    ; ld      a, 0                                    ; VRAM address (destiny, bit 16)
    ; ld		de, NAMTBL + (1 * (256 * 64))           ; VRAM address (destiny, bits 15-0)
    ; ld		c, 0 + (ImageData_1.size / 256)         ; Block length * 256
    ; call    LDIRVM_MSX2

    call    BIOS_ENASCR




    ret