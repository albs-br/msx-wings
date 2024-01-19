GameOverAnimation:

    call    HideAllSprites

    call    Wait_Vblank         ; VBlank sync

    xor     a
    ld      (GameOverAnimation_Vars.Counter), a

    call    .initGameOverAnimation

.loopAnimation:

    call    Wait_Vblank         ; VBlank sync

    ; GameOverAnimation_Counter++
    ld      hl, GameOverAnimation_Vars.Counter
    inc     (hl)

    ld      a, (GameOverAnimation_Vars.Counter)
    cp      255
    jp      z, $ ; debug

    
    ld      hl, SPRATR
    ld      ix, GameOverAnimation_Vars.sprite_0
    ld      b, 8 * 4 ; number of sprites (number of chars * 4)
.loop_10:
        push    bc
            push    hl
                push    ix
    
                    call    .animateSprite
                
                pop     ix
                ld      bc, 7 ; size of sprite struct
                add     ix, bc

            pop     hl
            ld      bc, 4 ; next sprite on SPRATR table
            add     hl, bc

        pop     bc

    djnz    .loop_10


    ; ld      hl, SPRATR + 0
    ; ld      ix, GameOverAnimation_Vars.sprite_0
    ; call    .animateSprite

    ; ld      hl, SPRATR + 4
    ; ld      ix, GameOverAnimation_Vars.sprite_0 + 7
    ; call    .animateSprite

    ; ld      hl, SPRATR + 8
    ; ld      ix, GameOverAnimation_Vars.sprite_0 + 14
    ; call    .animateSprite

    ; ld      hl, SPRATR + 12
    ; ld      ix, GameOverAnimation_Vars.sprite_0 + 21
    ; call    .animateSprite


    jp      .loopAnimation

    ret

; HL: SPRATR addr
; IX: addr of sprite structure in RAM
.animateSprite:

    ld      a, 0000 0001 b
    call    SetVdp_Write

    ; get look up table addr
    ld      l, (ix + 5)
    ld      h, (ix + 6)

    ; get Y from look up table
    ld      a, (hl)
    
    ; if (Y == 217) ret
    cp      217
    ret     z


    ; if (Counter >= counterStart) cont_0
    ld      a, (GameOverAnimation_Vars.Counter)
    cp      (ix + 2) ; counterStart
    jp      nc, .cont_2

    ; ---- hide sprite
    ld      c, PORT_0

    ld      a, 192
    out     (c), a          ; set Y offscreen

    nop                                            ; CAUTION: on V9938/58 sequential OUT's (or IN's) must be at least 15 cycles apart
    nop
    nop
    in      a, (c)          ; skip X

    nop
    nop
    ld      a, 63 * 4
    out     (c), a          ; set empty sprite pattern

    nop
    nop
    nop
    in      a, (c)          ; skip unused atribute

    ret


.cont_2:

    ld      c, PORT_0

    ; get Y from look up table
    ld      a, (hl)

    ; y += yEnd - 83
    add     (ix + 0) ; yEnd
    sub     83 ; last y value on look up table


    out     (c), a          ; set Y

    ; get X from look up table
    inc     hl
    ld      a, (hl)

    ; x += xEnd - 72
    add     (ix + 3) ; xEnd
    sub     72 ; last x value on look up table

    out     (c), a          ; set X

    ld      a, (ix + 4) ; pattern
    out     (c), a          ; set pattern

    nop
    nop
    nop
    in      a, (c)          ; skip unused atribute


    ; update look up table addr
    ld      l, (ix + 5)
    ld      h, (ix + 6)
    inc     hl
    inc     hl
    ld      (ix + 5), l
    ld      (ix + 6), h

    ret

; ; HL: SPRATR addr
; ; IX: addr of sprite structure in RAM
; .animateSprite_old:

;     ld      a, 0000 0001 b
;     call    SetVdp_Write

;     ; if (x >= xEnd) ret
;     ld      a, (ix + 1) ; x
;     cp      (ix + 3) ; xEnd
;     ret     nc

;     ; if (Counter >= counterStart) cont_0
;     ld      a, (GameOverAnimation_Vars.Counter)
;     cp      (ix + 2) ; counterStart
;     jp      nc, .cont_0

;     ; ---- hide sprite
;     ld      c, PORT_0

;     ld      a, 192
;     out     (c), a          ; set Y offscreen

;     nop                                            ; CAUTION: on V9938/58 sequential OUT's (or IN's) must be at least 15 cycles apart
;     nop
;     nop
;     in      a, (c)          ; skip X

;     nop
;     nop
;     ld      a, 63 * 4
;     out     (c), a          ; set empty sprite pattern

;     nop
;     nop
;     nop
;     in      a, (c)          ; skip unused atribute

;     ret

; .cont_0:

;     inc      (ix + 1)    ; x++
;     inc      (ix + 1)    ; x++


;     ; ---- update SPRATR table
;     ld      c, PORT_0
    
;     ld      a, (ix + 0) ; y
;     out     (c), a          ; set y
    
;     ; CAUTION: on V9938/58 sequential OUT's (or IN's) must be at least 15 cycles apart
;     ld      a, (ix + 1) ; x
;     out     (c), a          ; set x
    
;     ld      a, (ix + 4) ; pattern
;     out     (c), a          ; set pattern

;     nop
;     nop
;     nop
;     in      a, (c)          ; skip unused atribute


;     ret

.initGameOverAnimation:


    ; --------------- load GAME OVER string sprite patterns and colors
    
    ; set MegaROM page for GAME OVER animation sprite patterns
    ld      a, GAMEOVER_ANIMATION_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; load sprite patterns for chars M, O and V starting at position 0
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Write
    ld      hl, GameOverAnimation_Data
    ld      d, 3 ; number of chars
    .loop_0:
        ld      b, 4 * 32 ; each char is 4 16x16 sprites (32 bytes for pattern)
        ld      c, PORT_0
        otir
    dec     d
    jp      nz, .loop_0


    ; set MegaROM page for STAGE CLEAR animation sprite colors (some chars will be reused)
    ld      a, STAGE_CLEAR_ANIMATION_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; load sprite patterns for char A
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + ((4 * 32) * 3)
    call    SetVdp_Write
    ld      b, 4 * 32 ; each char is 4 16x16 sprites (32 bytes for pattern)
    ld      c, PORT_0
    ld      hl, StageClear_Patterns_A_factor_2
    otir

    ; load sprite patterns for char G
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + ((4 * 32) * 4)
    call    SetVdp_Write
    ld      b, 4 * 32 ; each char is 4 16x16 sprites (32 bytes for pattern)
    ld      c, PORT_0
    ld      hl, StageClear_Patterns_G_factor_2
    otir

    ; load sprite patterns for char E
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + ((4 * 32) * 5)
    call    SetVdp_Write
    ld      b, 4 * 32 ; each char is 4 16x16 sprites (32 bytes for pattern)
    ld      c, PORT_0
    ld      hl, StageClear_Patterns_E_factor_2
    otir

    ; load sprite patterns for char R
    ld      a, 0000 0001 b
    ld      hl, SPRPAT + ((4 * 32) * 6)
    call    SetVdp_Write
    ld      b, 4 * 32 ; each char is 4 16x16 sprites (32 bytes for pattern)
    ld      c, PORT_0
    ld      hl, StageClear_Patterns_R_factor_2
    otir


    ; set MegaROM page for GAME OVER animation sprite colors
    ld      a, STAGE_CLEAR_ANIMATION_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; load colors for all 32 sprites
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    
    ld      d, 2 * 8        ; 8 chars, each uses 2x 32 bytes of colors
    .loop_1:
        ld      b, 32 ; each char is 32 pixels tall (32 bytes for colors)
        ld      c, PORT_0
        ld      hl, StageClear_Colors_factor_2
        otir
    dec     d
    jp      nz, .loop_1

    ; ; load SPRATR for testing
    ; ld      a, 0000 0001 b
    ; ld      hl, SPRATR
    ; call    SetVdp_Write
    ; ld      b, GameOverAnimation_SPRATR_Test.size
    ; ld      c, PORT_0
    ; ld      hl, GameOverAnimation_SPRATR_Test
    ; otir
    ; jp $ ; debug


    ; load initial SPRATR
    ld      a, 0000 0001 b
    call    SetVdp_Write
    ld      hl, SPRATR
    ld      b, 32 ; 32 sprites
.loop_3:
        push    bc
            ld      b, GameOverAnimation_SPRATR_Init.size
            ld      c, PORT_0
            ld      hl, GameOverAnimation_SPRATR_Init
            otir
        pop     bc

    djnz    .loop_3

    ; load initial sprite structs
    ld      hl, GameOverAnimation_sprite_structs_Init
    ld      de, GameOverAnimation_Vars.sprite_0
    ld      bc, GameOverAnimation_sprite_structs_Init.size
    ldir


    ret


GameOverAnimation_SPRATR_Init:
    db  192, 0, 0, 0
    ;db  216 ; hide all other sprites
.size: equ $ - GameOverAnimation_SPRATR_Init

GameOverAnimation_sprite_structs_Init:

; (*) unused

    ;          yEnd, (*), counterStart,     xEnd, pattern number
    
    ; G
    db      62     ,   0,            0,  58     , 16 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,           20,  58     , 17 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,   0,        0 + 4,  58 + 16, 18 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,       20 + 4,  58 + 16, 19 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
     
    ; A     
    db      62     ,   0,            4,  94     , 12 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,           24,  94     , 13 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,   0,        4 + 4,  94 + 16, 14 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,       24 + 4,  94 + 16, 15 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
     
    ; M     
    db      62     ,   0,            8, 130     ,  0 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,           28, 130     ,  1 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,   0,        8 + 4, 130 + 16,  2 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,       28 + 4, 130 + 16,  3 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
     
    ; E     
    db      62     ,   0,           12, 166     , 20 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,           32, 166     , 21 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,   0,       12 + 4, 166 + 16, 22 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,   0,       32 + 4, 166 + 16, 23 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; O
    db      98     ,   0,           16,  58     ,  4 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,           36,  58     ,  5 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,   0,       16 + 4,  58 + 16,  6 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,       36 + 4,  58 + 16,  7 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; V
    db      98     ,   0,           20,  94     ,  8 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,           40,  94     ,  9 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,   0,       20 + 4,  94 + 16, 10 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,       40 + 4,  94 + 16, 11 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; E
    db      98     ,   0,           24, 130     , 20 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,           44, 130     , 21 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,   0,       24 + 4, 130 + 16, 22 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,       44 + 4, 130 + 16, 23 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; R
    db      98     ,   0,           28, 166     , 24 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,           48, 166     , 25 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,   0,       28 + 4, 166 + 16, 26 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,   0,       48 + 4, 166 + 16, 27 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

.size: equ $ - GameOverAnimation_sprite_structs_Init

; GameOverAnimation_SPRATR_Test:

;     ; Y top = (192 - (32 + 4 + 32)) / 2 = 62
;     ; X left = (256 - (32 + 4 + 32 + 4 + 32 + 4 + 32)) / 2 = 58
;     ; X left of last (rightmost) sprite = X left + (32 + 4 + 32 + 4 + 32 + 4) + 16 = 166


;     ; G
;     db   62     ,  58     , 16 * 4, 0
;     db   62 + 16,  58     , 17 * 4, 0
;     db   62     ,  58 + 16, 18 * 4, 0
;     db   62 + 16,  58 + 16, 19 * 4, 0

;     ; A
;     db   62     ,  94     , 12 * 4, 0
;     db   62 + 16,  94     , 13 * 4, 0
;     db   62     ,  94 + 16, 14 * 4, 0
;     db   62 + 16,  94 + 16, 15 * 4, 0

;     ; M
;     db   62     , 130     ,  0 * 4, 0
;     db   62 + 16, 130     ,  1 * 4, 0
;     db   62     , 130 + 16,  2 * 4, 0
;     db   62 + 16, 130 + 16,  3 * 4, 0

;     ; E
;     db   62     , 166     , 20 * 4, 0
;     db   62 + 16, 166     , 21 * 4, 0
;     db   62     , 166 + 16, 22 * 4, 0
;     db   62 + 16, 166 + 16, 23 * 4, 0

;     ; O
;     db   98     ,  58     ,  4 * 4, 0
;     db   98 + 16,  58     ,  5 * 4, 0
;     db   98     ,  58 + 16,  6 * 4, 0
;     db   98 + 16,  58 + 16,  7 * 4, 0

;     ; V
;     db   98     ,  94     ,  8 * 4, 0
;     db   98 + 16,  94     ,  9 * 4, 0
;     db   98     ,  94 + 16, 10 * 4, 0
;     db   98 + 16,  94 + 16, 11 * 4, 0

;     ; E
;     db   98     , 130     , 20 * 4, 0
;     db   98 + 16, 130     , 21 * 4, 0
;     db   98     , 130 + 16, 22 * 4, 0
;     db   98 + 16, 130 + 16, 23 * 4, 0

;     ; R
;     db   98     , 166     , 24 * 4, 0
;     db   98 + 16, 166     , 25 * 4, 0
;     db   98     , 166 + 16, 26 * 4, 0
;     db   98 + 16, 166 + 16, 27 * 4, 0

; .size: equ $ - GameOverAnimation_SPRATR_Test

; GameOverAnimation_Data:
;     ; first line
;     ;                                   xEnd    counterStart
;     ; 7th sprite: x from 0 to 150       150     0
;     ; 8th sprite: x from 0 to 166       166     0
    
;     db  150,    16
;     db  166,    0