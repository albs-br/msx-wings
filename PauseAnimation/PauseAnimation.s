END_PAUSE_ANIMATION_STEP_1:     equ 31
END_PAUSE_ANIMATION_STEP_2:     equ 255

PauseAnimation:

    call    Wait_Vblank         ; VBlank sync


    ld      a, (PauseAnimation_Counter)

    ; PauseAnimation_Counter++
    ld      hl, PauseAnimation_Counter
    inc     (hl)

    ; if(PauseAnimation_Counter == 0) ; testing value BEFORE increment
    or      a
    jp      z, .initPauseAnimation

    ; if(PauseAnimation_Counter > 0 && PauseAnimation_Counter < END_PAUSE_ANIMATION_STEP_1)
    cp      END_PAUSE_ANIMATION_STEP_1
    jp      c, .animationStep_1
    
    ; if(PauseAnimation_Counter == END_PAUSE_ANIMATION_STEP_2)
    cp      END_PAUSE_ANIMATION_STEP_2
    jp      z, .animationStep_2

    ret



.initPauseAnimation:

    ; TODO: use specific sfx for pause
    ld      a, SFX_GET_ITEM  ; number of sfx in the bank
    ld      c, 15            ; sound priority
    call    PlaySfx

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



    ; --------------- load Bomb number string sprite patterns and colors

    ; load sprite for char B at position 5
    ld      hl, SPRPAT + (32 * 5)
    ld      de, SPRCOL + (16 * 5)
    ld      ix, LargeFont_Patterns + LARGE_FONT_CHAR_B
    call    LargeFont_loadSpritePatternsAndColors



    ; load SPRATR table for PAUSE string and top screen sprites
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, PauseAnimation_SPRATR.size
    ld      c, PORT_0
    ld      hl, PauseAnimation_SPRATR
    otir


    ; loop to adjust Y coord of all 5 sprites to compensate scroll
    ld      hl, SPRATR

    ld      b , 6       ; number of sprites
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

    ; set first value of PAUSE string X lookup table
    ld      ix, PauseAnimation_X_values_LookUpTable
    ld      (PauseAnimation_TempAddr), ix



    ; load screen top sprite patterns and colors (lifes, bombs and score)



    ret



.animationStep_1:

    ; set MegaROM page for Pause Animation data
    ld      a, PAUSE_ANIMATION_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a


    ; TODO:
    ld      ix, (PauseAnimation_TempAddr)
    ld      hl, SPRATR + 1  ; initial VRAM addr (X coord of first sprite)
    ld      b, 4            ; number of sprites
.animationStep_1_loop:
    push    hl
        ld      a, 0000 0001 b
        call    SetVdp_Write

        ld      a, (ix)
        out     (PORT_0), a

        ld      de, PauseAnimation_X_values_LookUpTable.size
        add     ix, de ; addr of X value for next sprite on source table
    pop     hl
    ld      de, 4
    add     hl, de  ; X value for next sprite on SPRATR table

    djnz    .animationStep_1_loop


    ; if (Counter >= 24) endTopScreenAnimation
    ld      a, (PauseAnimation_Counter)
    cp      16 + 8 ; 24 frames, started in -16, it will stop when Y = 8
    jp      nc, .endTopScreenAnimation

    ; Read Y coord of Bombs number sprite (sprite #5), increment and save it
    ld      a, 0000 0001 b
    ld      hl, SPRATR + (4 * 5)
    call    SetVdp_Read
    in      a, (PORT_0)
    inc     a
    ld      b, a
    ld      a, 0000 0001 b
    ld      hl, SPRATR + (4 * 5)
    call    SetVdp_Write
    ld      a, b
    out     (PORT_0), a
    
.endTopScreenAnimation:

    ; set PauseAnimation_TempAddr to next frame of animation
    ; PauseAnimation_TempAddr++
    ld      ix, (PauseAnimation_TempAddr)
    inc     ix
    ld      (PauseAnimation_TempAddr), ix

    ret



.animationStep_2:

    ; PauseAnimation_Counter = END_PAUSE_ANIMATION_STEP_1 + 1
    ld      a, END_PAUSE_ANIMATION_STEP_1 + 1
    ld      (PauseAnimation_Counter), a

    ret


EndPauseAnimation:

    ; TODO: use specific sfx for pause
    ld      a, SFX_GET_ITEM  ; number of sfx in the bank
    ld      c, 15            ; sound priority
    call    PlaySfx

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



PauseAnimation_SPRATR:
    db  (192/2) - 8, (256/2) - 8, 0 * 4, 0 ; P
    db  (192/2) - 8, (256/2) - 8, 1 * 4, 0 ; A
    db  (192/2) - 8, (256/2) - 8, 3 * 4, 0 ; S
    db  (192/2) - 8, (256/2) - 8, 4 * 4, 0 ; E
    db  (192/2) - 8, (256/2) - 8, 2 * 4, 0 ; U (this one doe not move,)

    db  -16, 8, 5 * 4, 0 ; Bombs number
.size:  equ $ - PauseAnimation_SPRATR

