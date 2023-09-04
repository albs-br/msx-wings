StageClearAnimation:

    ; hide all sprites (set Y=216 for all 32 sprites on SPRATR)
    ld      de, 4
    ld      a, 216
    ld      hl, SPRATR
    ld      b, 32
    ld      c, PORT_0
.loop_2:
    call    SetVdp_Write
    out     (c), a
    add     hl, de
    djnz    .loop_2

    ; set MegaROM page for Stage clear animation sprites data
    ld      a, STAGE_CLEAR_ANIMATION_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a


    ; init variables
    xor     a
    ld      (LevelInitAnimation_Counter), a


.animationLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.animationLoop_waitVBlank:
    cp      (hl)
    jr      z, .animationLoop_waitVBlank



    ld      a, (LevelInitAnimation_Counter)

    ; if (counter < 2)
    cp      2
    jp      c, .load_5x5_sprites_maximized

    ; ; else if (counter < 4)
    ; cp      4
    ; jp      c, .load_4x4_sprites_maximized

    ; TODO: other ifs

    ; else .exit
    jp      .exit

.continue:



;     ; load SPRATR buffer from HL addr
;     ld      de, SPRATR_Buffer
; .SPRATR_Buffer_loop:
;     ld      a, (hl)

;     ldi ; Y

;     cp      216 ; if (Y==216) end
;     jp      z, .SPRATR_Buffer_loop_end

;     ldi ; X
;     ldi ; pattern
;     ldi ; not used

; .SPRATR_Buffer_loop_end:



    ; load from HL to SPRATR table (all 32 sprites)
    push    hl
        ld      a, 0000 0001 b
        ld      hl, SPRATR
        call    SetVdp_Write
        ; ld      bc, 0 + ((32 * 4) * 256) + PORT_0
        ld      b, 0 + (32 * 4)
        ld      c, PORT_0
        ; ld      hl, StageClearAnimation_SPRATR.frame_0; SPRATR_Buffer
    pop     hl
    otir
    ; ; 4x OUTI
    ; outi outi outi outi 

    ; LevelInitAnimation_Counter ++
    ld      hl, LevelInitAnimation_Counter
    inc     (hl)

.debug:
CALL BIOS_BEEP
JP .debug

    jp      .animationLoop

.exit:
    call    SetSpritesMinimized



    ret

.load_5x5_sprites_maximized:

    call    SetSpritesMaximized

    ; load sprite patterns
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Write
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, StageClear_Patterns_S_factor_5
    ld      de, StageClear_Patterns_S_factor_5.size
.loop_10:
    outi
    dec     de
    ld      a, d
    or      e
    jp      nz, .loop_10

    ; load sprite colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      d, 5          ; number of repetitions (same as factor)
    .loop_colors:
        ld      hl, StageClear_Colors_factor_5
        ld      b, StageClear_Colors_factor_5.size
        otir
    dec     d
    jp      nz, .loop_Colors


    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_0

    jp      .continue