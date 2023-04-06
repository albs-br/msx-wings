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



    call    HideAllSprites


    call    Wait_Vblank         ; VBlank sync

    ; --------------- save to RAM patterns and colors of current sprites on screen
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Read
    ld      b, 0 ; PauseAnimation_SPRPAT_Bkp.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, PauseAnimation_SPRPAT_Bkp
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes

    call    Wait_Vblank         ; VBlank sync

    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Read
    ld      b, 0 ;PauseAnimation_SPRCOL_Bkp.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, PauseAnimation_SPRCOL_Bkp
    inir    ; transfer 256 bytes
    inir    ; transfer 256 bytes



    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; --------------- load PAUSE string sprite patterns and colors
    
    ; load sprite for char P at position 0
    ld      hl, SPRPAT + (32 * 0)
    ld      de, SPRCOL + (16 * 0)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_P
    call    LargeFont_loadSpritePatternsAndColors
    
    ; load sprite for char A at position 1
    ld      hl, SPRPAT + (32 * 1)
    ld      de, SPRCOL + (16 * 1)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_A
    call    LargeFont_loadSpritePatternsAndColors

    ; load sprite for char U at position 2
    ld      hl, SPRPAT + (32 * 2)
    ld      de, SPRCOL + (16 * 2)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_U
    call    LargeFont_loadSpritePatternsAndColors

    ; load sprite for char S at position 3
    ld      hl, SPRPAT + (32 * 3)
    ld      de, SPRCOL + (16 * 3)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_S
    call    LargeFont_loadSpritePatternsAndColors

    ; load sprite for char E at position 4
    ld      hl, SPRPAT + (32 * 4)
    ld      de, SPRCOL + (16 * 4)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_E
    call    LargeFont_loadSpritePatternsAndColors


    ; load SPRATR table for PAUSE string
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, PauseAnimation_SPRATR.size
    ld      c, PORT_0
    ld      hl, PauseAnimation_SPRATR
    otir


    ; TODO: loop to adjust all 5 sprites
    ; adjust Y coord of sprites to compensate scroll
    ld      hl, SPRATR

    ld      b , 5       ; number of sprites
.loop_AdjustSpritesY:
    push    bc
        push    hl
            push    hl
                ld      a, 0000 0001 b
                call    SetVdp_Read
                ld      c, PORT_0
                in      d, (c)          ; read current Y value
                ld      a, (VerticalScroll)
                add     d
                ld      d, a
            pop     hl
            ld      a, 0000 0001 b
            call    SetVdp_Write
            ld      c, PORT_0
            out     (c), d              ; set new Y value
        pop     hl
        ld      bc, 4
        add     hl, bc  ; go to next sprite
    pop     bc
    djnz    .loop_AdjustSpritesY


    ; load screen top sprite patterns and colors (lifes, bombs and score)

    ; PauseAnimation_Counter++
    ld      hl, PauseAnimation_Counter
    inc     (hl)

    ret



EndPauseAnimation:
    call    Wait_Vblank         ; VBlank sync

    xor     a
    ld      (PauseAnimation_Counter), a

    call    HideAllSprites

    ; restore SPRPAT and SPRCOL tables
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Write
    ld      b, 0; PauseAnimation_SPRPAT_Bkp.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, PauseAnimation_SPRPAT_Bkp
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes

    call    Wait_Vblank         ; VBlank sync

    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      b, 0 ; PauseAnimation_SPRCOL_Bkp.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, PauseAnimation_SPRCOL_Bkp
    otir    ; transfer 256 bytes
    otir    ; transfer 256 bytes

    ; restore SPRATR table
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, PauseAnimation_SPRATR_Bkp.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, PauseAnimation_SPRATR_Bkp
    otir

    ret



HideAllSprites:
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

    ret



; data for PAUSE string x values
    ; 'P'
    db  120, 118, 117, 116, 115, 114, 113, 112, 111, 110, 108, 107, 106, 105, 104, 103, 102, 101, 100, 99, 97, 96, 95, 94, 93, 92, 91, 90, 89, 88

    ; 'A'
    db  120, 119, 118, 118, 117, 117, 116, 116, 115, 115, 114, 113, 113, 112, 112, 111, 111, 110, 110, 109, 108, 108, 107, 107, 106, 106, 105, 105, 104, 104

    ; 'U' is fixed at center

    ; 'S'
    db  120, 120, 121, 121, 122, 122, 123, 123, 124, 124, 125, 126, 126, 127, 127, 128, 128, 129, 129, 130, 131, 131, 132, 132, 133, 133, 134, 134, 135, 136 

    ; 'E'
    db  120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 142, 143, 144, 145, 146, 147, 148, 149, 150, 152

PauseAnimation_SPRATR:
    db  (192/2) - 8, (256/2) - 8 - 32, 0 * 4, 0
    db  (192/2) - 8, (256/2) - 8 - 16, 1 * 4, 0
    db  (192/2) - 8, (256/2) - 8 - 0,  2 * 4, 0
    db  (192/2) - 8, (256/2) - 8 + 16, 3 * 4, 0
    db  (192/2) - 8, (256/2) - 8 + 32, 4 * 4, 0
.size:  equ $ - PauseAnimation_SPRATR

