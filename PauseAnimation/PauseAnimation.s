LARGE_FONT_CHAR_P:          equ (64 * (9 + 16))


; END_PAUSE_ANIMATION_STEP_1:     equ ?
; END_PAUSE_ANIMATION_STEP_2:     equ ?

PauseAnimation:

    call    Wait_Vblank         ; VBlank sync


    ; if(PauseAnimation_Counter == 0)
    ld      a, (PauseAnimation_Counter)
    or      a
    jp      z, .initPauseAnimation

    ; if(PauseAnimation_Counter > 0 && PauseAnimation_Counter < END_PAUSE_ANIMATION_STEP_1)
    
    ; if(PauseAnimation_Counter == END_PAUSE_ANIMATION_STEP_2)

    ; PauseAnimation_Counter++
    ld      hl, PauseAnimation_Counter
    inc     (hl)

    ret

.initPauseAnimation:
    ; save SPRATR table
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Read
    ld      b, PauseAnimation_SPRATR_Bkp.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, PauseAnimation_SPRATR_Bkp
    inir



    ; ---------- hide all sprites
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster

    ld      b, 32           ; 32 sprites on SPRATR
.loop_HideAllSprites:
    ld      a, 216
    nop
    nop
    out     (c), a          ; set Y to 216 hides all sprites from here onwards

    ld      a, 255
    nop
    nop
    out     (c), a          ; X

    ld      a, EMPTY_SPR_PAT_NUMBER
    nop
    nop
    out     (c), a          ; pattern

    xor     a
    nop
    nop
    out     (c), a          ; not used

    djnz    .loop_HideAllSprites



    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; --------------- load PAUSE string sprite patterns and colors
    
    ; ; load sprite for char P at position 0
    ; ld      hl, SPRPAT
    ; ld      de, SPRCOL
    ; ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_P
    ; call    .loadSpritePatternsAndColors

    ; load screen top sprite patterns and colors (lifes, bombs and score)

    ; PauseAnimation_Counter++
    ld      hl, PauseAnimation_Counter
    inc     (hl)

    ret



EndPauseAnimation:
    xor     a
    ld      (PauseAnimation_Counter), a

    ; restore SPRATR table
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, PauseAnimation_SPRATR_Bkp.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, PauseAnimation_SPRATR_Bkp
    otir

    ret

; data for PAUSE string x values
    ; 'P'
    db  120, 118, 117, 116, 115, 114, 113, 112, 111, 110, 108, 107, 106, 105, 104, 103, 102, 101, 100, 99, 97, 96, 95, 94, 93, 92, 91, 90, 89, 88

    ; 'A'
    db  120, 119, 118, 118, 117, 117, 116, 116, 115, 115, 114, 113, 113, 112, 112, 111, 111, 110, 110, 109, 108, 108, 107, 107, 106, 106, 105, 105, 104, 104

    ; 'S'
    db  120, 120, 121, 121, 122, 122, 123, 123, 124, 124, 125, 126, 126, 127, 127, 128, 128, 129, 129, 130, 131, 131, 132, 132, 133, 133, 134, 134, 135, 136 

    ; 'U'
    db  120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 142, 143, 144, 145, 146, 147, 148, 149, 150, 152
