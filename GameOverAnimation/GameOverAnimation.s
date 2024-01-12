GameOverAnimation:

    call    Wait_Vblank         ; VBlank sync

    xor     a
    ld      (GameOverAnimation_Vars.Counter), a

    call    .initGameOverAnimation

.loopAnimation:

    ; GameOverAnimation_Counter++
    ld      hl, GameOverAnimation_Vars.Counter
    inc     (hl)


    
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write

    ld      ix, GameOverAnimation_Vars.sprite_0
    call    .animateSprite


    jp      .loopAnimation

    ret

; IX: addr of sprite structure in RAM
.animateSprite:

    ; if (Counter >= counterStart)
    ld      a, (GameOverAnimation_Vars.Counter)
    ld      b, (ix + 2) ; counterStart
    cp      b
    jp      nc, .cont_0

    ; ---- hide sprite
    ld      c, PORT_0

    in      a, (c)          ; skip Y

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
    ; if (x >= xEnd) ret
    ld      a, (ix + 1) ; x
    ld      b, (ix + 3) ; xEnd
    cp      b
    ret     nc

    inc     a           ; x++
    ld      (ix + 1), a


    ; ---- update SPRATR table
    ld      c, PORT_0
    
    in      b, (c)          ; skip Y
    
    nop                                            ; CAUTION: on V9938/58 sequential OUT's (or IN's) must be at least 15 cycles apart
    nop
    nop
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

    ; load sprite for chars M, O and V starting at position 0
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

    ; TODO
    ; load initial sprite structs


    ret


GameOverAnimation_SPRATR_Test:

    ; Y top = (192 - (32 + 4 + 32)) / 2 = 62
    ; X left = (256 - (32 + 4 + 32 + 4 + 32 + 4 + 32)) / 2 = 58
    ; X left of last (rightmost) sprite = X left + (32 + 4 + 32 + 4 + 32 + 4) + 16 = 166



    db   62     ,  58     ,  0 * 4, 0
    db   62 + 16,  58     ,  1 * 4, 0
    db   62     ,  58 + 16,  2 * 4, 0
    db   62 + 16,  58 + 16,  3 * 4, 0

    db   62     ,  94     ,  4 * 4, 0
    db   62 + 16,  94     ,  5 * 4, 0
    db   62     ,  94 + 16,  6 * 4, 0
    db   62 + 16,  94 + 16,  7 * 4, 0

    db   62     , 130     ,  8 * 4, 0
    db   62 + 16, 130     ,  9 * 4, 0
    db   62     , 130 + 16, 10 * 4, 0
    db   62 + 16, 130 + 16, 11 * 4, 0

.size: equ $ - GameOverAnimation_SPRATR_Test

GameOverAnimation_SPRATR_Data:
    ; first line
    ;                                   xEnd    counterStart
    ; 7th sprite: x from 0 to 150       150     0
    ; 8th sprite: x from 0 to 166       166     0
    
    db  150,    16
    db  166,    0