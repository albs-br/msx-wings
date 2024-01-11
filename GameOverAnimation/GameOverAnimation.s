GameOverAnimation:

    call    Wait_Vblank         ; VBlank sync


    ld      a, (GameOverAnimation_Counter)

    ; GameOverAnimation_Counter++
    ld      hl, GameOverAnimation_Counter
    inc     (hl)

    ; if(GameOverAnimation_Counter == 0) ; testing value BEFORE increment
    or      a
    jp      z, .initGameOverAnimation



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
    ld      b, GameOverAnimation_Data_SPRATR_Test.size
    ld      c, PORT_0
    ld      hl, GameOverAnimation_Data_SPRATR_Test
    otir


    ret


GameOverAnimation_Data_SPRATR_Test:

    ; Y top = (192 - (32 + 8 + 32)) / 2 = 60
    ; X left = (256 - (32 + 8 + 32 + 8 + 32 + 8 + 32)) / 2 = 52

    db   60     ,  52     ,  0 * 4, 0
    db   60 + 16,  52     ,  1 * 4, 0
    db   60     ,  52 + 16,  2 * 4, 0
    db   60 + 16,  52 + 16,  3 * 4, 0

    db   60     ,  92     ,  4 * 4, 0
    db   60 + 16,  92     ,  5 * 4, 0
    db   60     ,  92 + 16,  6 * 4, 0
    db   60 + 16,  92 + 16,  7 * 4, 0

    db   60     , 132     ,  8 * 4, 0
    db   60 + 16, 132     ,  9 * 4, 0
    db   60     , 132 + 16, 10 * 4, 0
    db   60 + 16, 132 + 16, 11 * 4, 0

.size: equ $ - GameOverAnimation_Data_SPRATR_Test