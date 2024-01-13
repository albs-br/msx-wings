GameOverAnimation:

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

    
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      ix, GameOverAnimation_Vars.sprite_0
    call    .animateSprite

    ld      a, 0000 0001 b
    ld      hl, SPRATR + 4
    call    SetVdp_Write
    ld      ix, GameOverAnimation_Vars.sprite_0 + 5
    call    .animateSprite

    ; ld      ix, GameOverAnimation_Vars.sprite_0 + 10
    ; call    .animateSprite

    ; ld      ix, GameOverAnimation_Vars.sprite_0 + 15
    ; call    .animateSprite


    jp      .loopAnimation

    ret

; IX: addr of sprite structure in RAM
.animateSprite:

    ; if (x >= xEnd) ret
    ld      a, (ix + 1) ; x
    cp      (ix + 3) ; xEnd
    ret     nc

    ; if (Counter >= counterStart) cont_0
    ld      a, (GameOverAnimation_Vars.Counter)
    cp      (ix + 2) ; counterStart
    jp      nc, .cont_0

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

.cont_0:

    inc      (ix + 1)    ; x++


    ; ---- update SPRATR table
    ld      c, PORT_0
    
    ld      a, (ix + 0) ; y
    out     (c), a          ; set y
    
    ; CAUTION: on V9938/58 sequential OUT's (or IN's) must be at least 15 cycles apart
    ld      a, (ix + 1) ; x
    out     (c), a          ; set x
    
    ld      a, (ix + 4) ; pattern
    out     (c), a          ; set pattern

    nop
    nop
    nop
    in      a, (c)          ; skip unused atribute


    ret

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

    ; load SPRATR for testing
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, GameOverAnimation_SPRATR_Test.size
    ld      c, PORT_0
    ld      hl, GameOverAnimation_SPRATR_Test
    otir
    jp $ ; debug


    ; load initial SPRATR
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, GameOverAnimation_SPRATR_Init.size
    ld      c, PORT_0
    ld      hl, GameOverAnimation_SPRATR_Init
    otir

    ; load initial sprite structs
    ld      hl, GameOverAnimation_sprite_structs_Init
    ld      de, GameOverAnimation_Vars.sprite_0
    ld      bc, GameOverAnimation_sprite_structs_Init.size
    ldir


    ret


GameOverAnimation_SPRATR_Init:
    db   62     ,  0      ,  0 * 4, 0
    db   62 + 16,  0      ,  1 * 4, 0
    ; db   62     ,  0      ,  2 * 4, 0
    ; db   62 + 16,  0      ,  3 * 4, 0
    db  216 ; hide all other sprites
.size: equ $ - GameOverAnimation_SPRATR_Init

GameOverAnimation_sprite_structs_Init:
    ;       y, x, counterStart, xEnd, pattern number
    db      62     ,   0,   0,  58     ,  0 * 4
    db      62 + 16,   0,  80,  58     ,  1 * 4
    ; db      62     ,   0,  30,  58 + 16,  2 * 4
    ; db      62 + 16,   0,  30,  58 + 16,  3 * 4
.size: equ $ - GameOverAnimation_sprite_structs_Init

GameOverAnimation_SPRATR_Test:

    ; Y top = (192 - (32 + 4 + 32)) / 2 = 62
    ; X left = (256 - (32 + 4 + 32 + 4 + 32 + 4 + 32)) / 2 = 58
    ; X left of last (rightmost) sprite = X left + (32 + 4 + 32 + 4 + 32 + 4) + 16 = 166


    ; G
    db   62     ,  58     , 16 * 4, 0
    db   62 + 16,  58     , 17 * 4, 0
    db   62     ,  58 + 16, 18 * 4, 0
    db   62 + 16,  58 + 16, 19 * 4, 0

    ; A
    db   62     ,  94     , 12 * 4, 0
    db   62 + 16,  94     , 13 * 4, 0
    db   62     ,  94 + 16, 14 * 4, 0
    db   62 + 16,  94 + 16, 15 * 4, 0

    ; M
    db   62     , 130     ,  0 * 4, 0
    db   62 + 16, 130     ,  1 * 4, 0
    db   62     , 130 + 16,  2 * 4, 0
    db   62 + 16, 130 + 16,  3 * 4, 0

    ; E
    db   62     , 166     , 20 * 4, 0
    db   62 + 16, 166     , 21 * 4, 0
    db   62     , 166 + 16, 22 * 4, 0
    db   62 + 16, 166 + 16, 23 * 4, 0

    ; O
    db   98     ,  58     ,  4 * 4, 0
    db   98 + 16,  58     ,  5 * 4, 0
    db   98     ,  58 + 16,  6 * 4, 0
    db   98 + 16,  58 + 16,  7 * 4, 0

    ; V
    db   98     ,  94     ,  8 * 4, 0
    db   98 + 16,  94     ,  9 * 4, 0
    db   98     ,  94 + 16, 10 * 4, 0
    db   98 + 16,  94 + 16, 11 * 4, 0

    ; E
    db   98     , 130     , 20 * 4, 0
    db   98 + 16, 130     , 21 * 4, 0
    db   98     , 130 + 16, 22 * 4, 0
    db   98 + 16, 130 + 16, 23 * 4, 0

    ; R
    db   98     , 166     , 24 * 4, 0
    db   98 + 16, 166     , 25 * 4, 0
    db   98     , 166 + 16, 26 * 4, 0
    db   98 + 16, 166 + 16, 27 * 4, 0

.size: equ $ - GameOverAnimation_SPRATR_Test

; GameOverAnimation_Data:
;     ; first line
;     ;                                   xEnd    counterStart
;     ; 7th sprite: x from 0 to 150       150     0
;     ; 8th sprite: x from 0 to 166       166     0
    
;     db  150,    16
;     db  166,    0