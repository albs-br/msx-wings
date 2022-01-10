InitVram:

    ; disable keyboard click
    ld 		a, 0
    ld 		(BIOS_CLIKSW), a     ; Key Press Click Switch 0:Off 1:On (1B/RW)

    ; define screen colors
    ld 		a, 1      	            ; Foregoung color
    ld 		(BIOS_FORCLR), a    
    ld 		a, 1  		            ; Backgroung color
    ld 		(BIOS_BAKCLR), a     
    ld 		a, 1      	            ; Border color
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color

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
    ; 0x1fa00 = 1 1111 1010 0000 0000
    ; low bits (aaaaa111: bits 14 to 10)
    ld      b, 1111 0111 b  ; data          ; In sprite mode 2 the least significant three bits in register 5 should be 1 otherwise mirroring will occur. ; https://www.msx.org/forum/msx-talk/development/strange-behaviour-bug-on-spratr-base-addr-register-on-v993858
    ld      c, 5            ; register #
    call    BIOS_WRTVDP
    ; high bits (000000aa: bits 16 to 15)
    ld      b, 0000 0011 b  ; data
    ld      c, 11           ; register #
    call    BIOS_WRTVDP

; ---- set SPRPAT to 0x1f000
    ; bits:    16     11
    ;           |      |
    ; 0x1f000 = 1 1111 0000 0000 0000
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



; --------- Load sprite patterns

    ; Spr 0 and 1 patterns
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Write
    ld      b, SpritePattern_PlayerPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpritePattern_PlayerPlane_0_and_1
    otir

    ; Spr 2 and 3 patterns
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + 64
    call    SetVdp_Write
    ld      b, SpritePattern_PlayerPlane_2_and_3.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpritePattern_PlayerPlane_2_and_3
    otir

    ; Spr 4 patterns
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + 128
    call    SetVdp_Write
    ld      b, SpritePattern_PlayerShot.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpritePattern_PlayerShot
    otir

    ; Spr 5 and 6 patterns
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + 128 + SpritePattern_PlayerShot.size
    call    SetVdp_Write
    ld      b, SpritePattern_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpritePattern_EnemyPlane_0_and_1
    otir


; --------- Load sprite colors

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      b, SpriteColors_PlayerPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_PlayerPlane_0_and_1
    otir

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ld      b, SpriteColors_PlayerPlane_2_and_3.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_PlayerPlane_2_and_3
    otir

    ; Spr 4 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64
    call    SetVdp_Write
    ld      b, SpriteColors_PlayerShot.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_PlayerShot
    otir

    ; Spr 5 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 16
    call    SetVdp_Write
    ld      b, SpriteColors_PlayerShot.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_PlayerShot
    otir

    ; Spr 6 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 32
    call    SetVdp_Write
    ld      b, SpriteColors_PlayerShot.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_PlayerShot
    otir

    ; TODO: this should be loaded on EnemyInit
    
    ; Spr 7 and 8 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 32 + 16 + (SpriteColors_EnemyPlane_0_and_1.size * 0)
    call    SetVdp_Write
    ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyPlane_0_and_1
    otir

    ; Spr 9 and 10 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 32 + 16 + (SpriteColors_EnemyPlane_0_and_1.size * 1)
    call    SetVdp_Write
    ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyPlane_0_and_1
    otir

    ; Spr 11 and 12 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 32 + 16 + (SpriteColors_EnemyPlane_0_and_1.size * 2)
    call    SetVdp_Write
    ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyPlane_0_and_1
    otir

    ; Spr 13 and 14 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 32 + 16 + (SpriteColors_EnemyPlane_0_and_1.size * 3)
    call    SetVdp_Write
    ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyPlane_0_and_1
    otir

    ; Spr 15 and 16 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 32 + 16 + (SpriteColors_EnemyPlane_0_and_1.size * 4)
    call    SetVdp_Write
    ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyPlane_0_and_1
    otir

    ; Spr 17 and 18 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 64 + 32 + 16 + (SpriteColors_EnemyPlane_0_and_1.size * 5)
    call    SetVdp_Write
    ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyPlane_0_and_1
    otir





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

    ;call    BIOS_ENASCR




    ret

;TEST_1:     db 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08