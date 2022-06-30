LARGE_FONT_CHAR_L:          equ (64 * (9 + 12))
LARGE_FONT_CHAR_E:          equ (64 * (9 + 5))
LARGE_FONT_CHAR_V:          equ (64 * (9 + 22))


; Input:
;   DE: char number (x 64)
;       0-9:  numbers
;       10: char 'A'

LevelInitAnimation:

    ; hide all unused sprites
    ld      hl, SPRATR_Buffer + (4 * 3) ; (4 * number_of_first_sprite_to_be_hidden)
    ld      a, 216
    ld      (hl), a



    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a



    ; load sprite for char L at position 0
    ld      hl, SPRPAT
    ld      de, SPRCOL
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_L
    call    .loadSpritePatternsAndColors

    ; load sprite for char E at position 1
    ld      hl, SPRPAT + (32 * 1)
    ld      de, SPRCOL + (16 * 1)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_E
    call    .loadSpritePatternsAndColors

    ; load sprite for char V at position 2
    ld      hl, SPRPAT + (32 * 2)
    ld      de, SPRCOL + (16 * 2)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_V
    call    .loadSpritePatternsAndColors



    ; init vars
    ld      ix, LOOKUP_TABLE_CIRCLE_MOV

.circleLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.circleLoop_waitVBlank:
    cp      (hl)
    jr      z, .circleLoop_waitVBlank

    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer
    ld      a, (ix)
    
    cp      217             ; if (y == 217) reset
    ret     z
    ; jp      z, ResetCircleLoopTest
    
    ; ----------------
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix + 1)
    ld      (hl), a         ; x

    inc     hl
    ld      a, 4
    ld      (hl), a         ; pattern number

    inc     hl
    inc     hl

    ; ----------------
    ld  a, 10
    ld      (hl), a         ; y

    inc     hl
    ;ld      a, (ix + 1)
    ld  a, 10
    ld      (hl), a         ; x

    inc     hl
    ld      a, 8
    ld      (hl), a         ; pattern number

    inc     hl
    inc     hl

    ; ----------------

    inc     ix              ; next addr on lookup table
    inc     ix

    ; load SPRATR table
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ; ld      b, SpriteAttrTableBuffer.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + ((SpriteAttrTableBuffer.size * 256) + PORT_0)
    ld      bc, 0 + (32 * 256) + PORT_0
    ld      hl, SPRATR_Buffer
    otir
    ; ; 4x OUTI
    ; outi outi outi outi 


    ;call    Wait

    jp      .circleLoop

    ret

; Input:
;   HL: SPRPAT addr
;   DE: SPRCOL addr
;   IX: source sprite pattern addr on RAM
.loadSpritePatternsAndColors:

    ; load sprite patterns
    ld      a, 0000 0001 b
    ;ld      hl, SPRPAT
    call    SetVdp_Write
    ; ld      b, 32
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      bc, 0 + (32 * 256) + PORT_0
    ;ld      hl, LargeFont_Patterns
    ld      a, ixh
    ld      h, a
    ld      a, ixl
    ld      l, a
    
    ;ld hl, LargeFont_Patterns + LARGE_FONT_CHAR_E ; debug
    
    otir

    ex      de, hl

    ; load sprite colors
    ld      a, 0000 0001 b
    ;ld      hl, SPRCOL
    call    SetVdp_Write
    ; ld      b, 16
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      bc, 0 + (16 * 256) + PORT_0
    ld      hl, LargeFont_Colors
    otir

    ret

LOOKUP_TABLE_CIRCLE_MOV:
    db       -16, 128
    db       -14, 119
    db       -10, 111
    db       -6, 103
    db       -1, 96
    db       4, 89
    db       9, 82
    db       16, 78
    db       22, 73
    db       29, 69
    db       35, 65
    db       42, 62
    db       49, 61
    db       56, 60
    db       63, 59
    db       70, 59
    db       76, 61
    db       82, 62
    db       88, 64
    db       96, 65
    db       103, 69
    db       110, 72
    db       116, 76
    db       121, 80
    db       125, 86
    db       130, 92
    db       133, 98
    db       134, 104
    db       136, 111
    db       137, 117
    db       137, 123
    db       135, 129
    db       134, 134
    db       131, 140
    db       129, 144
    db       125, 148
    db       121, 152
    db       117, 155
    db       112, 157
    db       108, 159
    db       104, 160
    db       99, 161
    db       95, 160
    db       91, 160
    db       87, 160
    db       82, 159
    db       77, 158
    db       72, 155
    db       67, 152
    db       63, 148
    db       60, 144
    db       58, 138
    db       56, 133
    db       56, 127
    db       57, 122
    db       58, 117
    db       61, 112
    db       64, 107
    db       68, 103
    db       72, 100
    db       78, 98
    db       83, 96

    db       217        ; end of data
