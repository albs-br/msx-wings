LARGE_FONT_CHAR_L:          equ (64 * (9 + 12))
LARGE_FONT_CHAR_E:          equ (64 * (9 + 5))
LARGE_FONT_CHAR_V:          equ (64 * (9 + 22))


; Input:
;   A: level number (1-8)
LevelInitAnimation:

    push    af
        ; hide all sprites
        ld      de, 4
        ld      a, 216
        ld      hl, SPRATR_Buffer
        ld      b, 32
    .loop_2:
        ld      (hl), a
        add     hl, de
        djnz    .loop_2

        ; set MegaROM page for Fonts data
        ld      a, FONTS_DATA_MEGAROM_PAGE
        ld	    (Seg_P8000_SW), a
    pop     af



    ; load sprite for level number char  at position 5
    ld      hl, LargeFont_Patterns ; + LARGE_FONT_CHAR_E
    ld      de, 64
    ld      b, a
.loop_1:
    add     hl, de
    djnz    .loop_1
    
    ; IX = HL
    ld      a, h
    ld      ixh, a
    ld      a, l
    ld      ixl, a

    ld      hl, SPRPAT + (32 * 5)
    ld      de, SPRCOL + (16 * 5)
    
    call    .loadSpritePatternsAndColors



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

    ; load sprite for char E at position 3
    ld      hl, SPRPAT + (32 * 3)
    ld      de, SPRCOL + (16 * 3)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_E
    call    .loadSpritePatternsAndColors

    ; load sprite for char L at position 4
    ld      hl, SPRPAT + (32 * 4)
    ld      de, SPRCOL + (16 * 4)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_L
    call    .loadSpritePatternsAndColors



    ; init vars
    ld      hl, LOOKUP_TABLE_CIRCLE_MOV
    ld      (LevelInitAnimation_Char_1_LookupTable_Addr), hl
    ld      (LevelInitAnimation_Char_2_LookupTable_Addr), hl
    ld      (LevelInitAnimation_Char_3_LookupTable_Addr), hl
    ld      (LevelInitAnimation_Char_4_LookupTable_Addr), hl
    ld      (LevelInitAnimation_Char_5_LookupTable_Addr), hl
    ld      (LevelInitAnimation_Char_6_LookupTable_Addr), hl
    xor     a
    ld      (LevelInitAnimation_Counter), a


.circleLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.circleLoop_waitVBlank:
    cp      (hl)
    jr      z, .circleLoop_waitVBlank



    call    .animateChar_1

    ; if(Counter >= 10) animate_Char_2
    ld      a, (LevelInitAnimation_Counter)
    cp      10
    call    nc, .animateChar_2

    ; if(Counter >= 20) animate_Char_3
    ld      a, (LevelInitAnimation_Counter)
    cp      20
    call    nc, .animateChar_3

    ; if(Counter >= 30) animate_Char_4
    ld      a, (LevelInitAnimation_Counter)
    cp      30
    call    nc, .animateChar_4

    ; if(Counter >= 40) animate_Char_5
    ld      a, (LevelInitAnimation_Counter)
    cp      40
    call    nc, .animateChar_5

    ; if(Counter >= 50) animate_Char_6
    ld      a, (LevelInitAnimation_Counter)
    cp      50
    call    nc, .animateChar_6
    ; ----------------

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


    ld      a, (LevelInitAnimation_Counter)
    cp      255
    jp      z, ResetCircleLoopTest

    inc     a
    ld      (LevelInitAnimation_Counter), a

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
    ; HL = IX
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

; TODO: make routine to avoid this code repetition
.animateChar_1:
    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer + (4 * 0)     ; (4 * number_of_sprite_position)
    ld      ix, (LevelInitAnimation_Char_1_LookupTable_Addr)
    
    ld      a, (ix)

    cp      217             ; if (y == 217) ret
    ret     z
    
    ; ----------------
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix + 1)
    ;add     16 * 0          ; 16 * char_number
    ld      (hl), a         ; x

    inc     hl
    ld      a, 4 * 0        ; 4 * sprite_pattern_number
    ld      (hl), a         ; pattern number


    inc     ix              ; next position on lookup table
    inc     ix
    ld      (LevelInitAnimation_Char_1_LookupTable_Addr), ix

    ret

.animateChar_2:
    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer + (4 * 1)     ; (4 * number_of_sprite_position)
    ld      ix, (LevelInitAnimation_Char_2_LookupTable_Addr)
    
    ld      a, (ix)

    cp      217             ; if (y == 217) ret
    ret     z
    
    ; ----------------
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix + 1)
    add     16 * 1          ; 16 * char_number
    ld      (hl), a         ; x

    inc     hl
    ld      a, 4 * 1        ; 4 * sprite_pattern_number
    ld      (hl), a         ; pattern number


    inc     ix              ; next position on lookup table
    inc     ix
    ld      (LevelInitAnimation_Char_2_LookupTable_Addr), ix

    ret

.animateChar_3:
    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer + (4 * 2)     ; (4 * number_of_sprite_position)
    ld      ix, (LevelInitAnimation_Char_3_LookupTable_Addr)
    
    ld      a, (ix)

    cp      217             ; if (y == 217) ret
    ret     z
    
    ; ----------------
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix + 1)
    add     16 * 2          ; 16 * char_number
    ld      (hl), a         ; x

    inc     hl
    ld      a, 4 * 2        ; 4 * sprite_pattern_number
    ld      (hl), a         ; pattern number


    inc     ix              ; next position on lookup table
    inc     ix
    ld      (LevelInitAnimation_Char_3_LookupTable_Addr), ix

    ret

.animateChar_4:
    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer + (4 * 3)     ; (4 * number_of_sprite_position)
    ld      ix, (LevelInitAnimation_Char_4_LookupTable_Addr)
    
    ld      a, (ix)

    cp      217             ; if (y == 217) ret
    ret     z
    
    ; ----------------
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix + 1)
    add     16 * 3          ; 16 * char_number
    ld      (hl), a         ; x

    inc     hl
    ld      a, 4 * 3        ; 4 * sprite_pattern_number
    ld      (hl), a         ; pattern number


    inc     ix              ; next position on lookup table
    inc     ix
    ld      (LevelInitAnimation_Char_4_LookupTable_Addr), ix

    ret

.animateChar_5:
    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer + (4 * 4)     ; (4 * number_of_sprite_position)
    ld      ix, (LevelInitAnimation_Char_5_LookupTable_Addr)
    
    ld      a, (ix)

    cp      217             ; if (y == 217) ret
    ret     z
    
    ; ----------------
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix + 1)
    add     16 * 4          ; 16 * char_number
    ld      (hl), a         ; x

    inc     hl
    ld      a, 4 * 4        ; 4 * sprite_pattern_number
    ld      (hl), a         ; pattern number


    inc     ix              ; next position on lookup table
    inc     ix
    ld      (LevelInitAnimation_Char_5_LookupTable_Addr), ix

    ret

.animateChar_6:
    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer + (4 * 5)     ; (4 * number_of_sprite_position)
    ld      ix, (LevelInitAnimation_Char_6_LookupTable_Addr)
    
    ld      a, (ix)

    cp      217             ; if (y == 217) ret
    ret     z
    
    ; ----------------
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix + 1)
    add     16 * 5          ; 16 * char_number
    add     16              ; add one space
    ld      (hl), a         ; x

    inc     hl
    ld      a, 4 * 5        ; 4 * sprite_pattern_number
    ld      (hl), a         ; pattern number


    inc     ix              ; next position on lookup table
    inc     ix
    ld      (LevelInitAnimation_Char_6_LookupTable_Addr), ix

    ret

LOOKUP_TABLE_CIRCLE_MOV:
        db       -16, 104
        db       -14, 95
        db       -10, 87
        db       -6, 79
        db       -1, 72
        db       4, 65
        db       9, 58
        db       16, 54
        db       22, 49
        db       29, 45
        db       35, 41
        db       42, 38
        db       49, 37
        db       56, 36
        db       63, 35
        db       70, 35
        db       76, 37
        db       82, 38
        db       88, 40
        db       96, 41
        db       103, 45
        db       110, 48
        db       116, 52
        db       121, 56
        db       125, 62
        db       130, 68
        db       133, 74
        db       134, 80
        db       136, 87
        db       137, 93
        db       137, 99
        db       135, 105
        db       134, 110
        db       131, 116
        db       129, 120
        db       125, 124
        db       121, 128
        db       117, 131
        db       112, 133
        db       108, 135
        db       104, 136
        db       99, 137
        db       95, 136
        db       91, 136
        db       87, 136
        db       82, 135
        db       77, 134
        db       72, 131
        db       67, 128
        db       63, 124
        db       60, 120
        db       58, 114
        db       56, 109
        db       56, 103
        db       57, 98
        db       58, 93
        db       61, 88
        db       64, 83
        db       68, 79
        db       72, 76
        db       78, 74
        db       83, 72        

    db       217        ; end of data
