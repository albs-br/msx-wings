LARGE_FONT_CHAR_L:          equ (64 * (9 + 12))
LARGE_FONT_CHAR_E:          equ (64 * (9 + 5))
LARGE_FONT_CHAR_V:          equ (64 * (9 + 22))


; Input:
;   A: level number (1-8)
LevelTitleAnimation:

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



    ; load sprite for level number char at position 5
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
    ld      (LevelInitAnimation_Counter_1), a


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

    ; ; if(Counter >= n)
    ; ld      a, (LevelInitAnimation_Counter)
    ; cp      220
    ; call    nc, .animateShineChars

    ; ; if(Counter >= n)
    ; ld      a, (LevelInitAnimation_Counter)
    ; cp      220
    ; call    nc, .animateEndingChars

    ; ----------------

    ; load SPRATR table (only 8 first positions)
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      bc, 0 + ((8 * 4) * 256) + PORT_0
    ld      hl, SPRATR_Buffer
    otir
    ; ; 4x OUTI
    ; outi outi outi outi 


    ;call    Wait


    ; End level title animation
    ld      a, (LevelInitAnimation_Counter)
    cp      150 ; 255
    ;jp      z, DEBUG_ResetCircleLoopTest
    ;ret     z
    jp      z, .exit

    inc     a
    ld      (LevelInitAnimation_Counter), a

    jp      .circleLoop

.exit:
    ; set Y of first sprite to 216, hiding all sprites
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write

    ld      a, 216  ; Y value that hides the sprite and all sprites after
    out     (PORT_0), a

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

; .animateShineChars:

;     ld      bc, (LevelInitAnimation_Counter_1)

;     ; load 3x lines in each char pattern used on title
;     ; load sprite for char L at position 0
;     ld      hl, SPRCOL
;     add     hl, bc
;     call    .loadLinesOnSpriteColors

;     ; LevelInitAnimation_Counter_1 ++
;     ld      hl, LevelInitAnimation_Counter_1
;     inc     (hl)

;     ret

; .animateEndingChars:

;     ; move each char X position to screen center
;     ld      de, 4
;     ld      hl, SPRATR_Buffer + 1 ; X of first sprite
;     ld      b, 8
; .loop_animateEndingChars:
;     ld      a, (hl)

;     cp      0 + (128) - 8   ; middle of screen
;     jp      z, .next_animateEndingChars

;     jp      c, .inc_X

; ;.dec_X:
;     sub 2; dec     a
;     jp      .next_animateEndingChars

; .inc_X:
;     add 2; inc     a

; .next_animateEndingChars:
;     ld      (hl), a
;     add     hl, de
;     djnz    .loop_animateEndingChars

;     ret

; ; Input:
; ;   HL: SPRCOL addr
; ;   IX: source sprite pattern addr on RAM
; .loadLinesOnSpriteColors:

;     ; load sprite colors
;     ld      a, 0000 0001 b
;     ;ld      hl, SPRCOL
;     call    SetVdp_Write
;     ld      bc, 0 + (3 * 256) + PORT_0
;     ld      hl, .fontShineColors
;     otir

;     ret

; .fontShineColors:
; 	db	0x05    ; blue
; 	db	0x05
; 	db	0x0f    ; medium gray
; 	db	0x0f
; 	db	0x09    ; light blue
; 	db	0x09
; 	db	0x0d    ; white
; 	db	0x0d
