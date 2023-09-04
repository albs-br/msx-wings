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


    ; if counter is odd go to next frame
    ld      a, (LevelInitAnimation_Counter)
    and     0000 0001 b
    jp      nz, .nextFrame

    ld      a, (LevelInitAnimation_Counter)

    ; if (counter == 0)
    cp      0
    jp      z, .load_5x5_sprites_maximized

    ; else if (counter == 2)
    cp      2
    jp      z, .load_4x4_sprites_maximized

    ; else if (counter == 4)
    cp      4
    jp      z, .load_3x3_sprites_maximized

    ; else if (counter == 6)
    cp      6
    jp      z, .load_5x5_sprites_minimized

    cp      8
    jp      z, .load_4x4_sprites_minimized

    cp      10
    jp      z, .load_3x3_sprites_minimized

    cp      12
    jp      z, .load_2x2_sprites_minimized

    ; else .exit
    jp      .exit

.continue:

    ; load from HL to SPRATR table (all 32 sprites)
    push    bc, hl, de
        ld      a, 0000 0001 b
        ld      hl, SPRATR
        call    SetVdp_Write
        ; ld      bc, 0 + ((32 * 4) * 256) + PORT_0
        ld      b, 0 + (32 * 4)
        ld      c, PORT_0
        ; ld      hl, StageClearAnimation_SPRATR.frame_0; SPRATR_Buffer
    pop     de, hl
    otir
    pop     bc

    ; ; 4x OUTI
    ; outi outi outi outi 



    push    bc, de
        
        ; load from IX to SPRPAT (size in IY)
        ld      a, 0000 0001 b
        ld      hl, SPRPAT
        call    SetVdp_Write
        ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
        ; ld      hl, StageClear_Patterns_S_factor_5

        ; HL = IX
        push    ix
        pop     hl

        ; ld      de, StageClear_Patterns_S_factor_5.size
        ; DE = IY
        push    iy
        pop     de
    .loop_10:
        outi
        dec     de
        ld      a, d
        or      e
        jp      nz, .loop_10

    pop     de, bc



    ; load from DE to SPRCOL (size in B)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      ixh, 5          ; number of repetitions (same as factor)
    ld      a, b ; save B
    .loop_colors:
        ; HL = DE
        push    de
        pop     hl

        ld      b, a
        ; ld      hl, StageClear_Colors_factor_5
        ; ld      b, StageClear_Colors_factor_5.size
        otir
    dec     ixh
    jp      nz, .loop_Colors

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



.nextFrame:

    ; LevelInitAnimation_Counter ++
    ld      hl, LevelInitAnimation_Counter
    inc     (hl)

; .debug:
; CALL BIOS_BEEP
; JP .debug

    jp      .animationLoop

.exit:
    call    SetSpritesMinimized



    ret

.load_5x5_sprites_maximized:

    call    SetSpritesMaximized

;     ; load sprite patterns
;     ld      a, 0000 0001 b
;     ld      hl, SPRPAT
;     call    SetVdp_Write
;     ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
;     ld      hl, StageClear_Patterns_S_factor_5
;     ld      de, StageClear_Patterns_S_factor_5.size
; .loop_10:
;     outi
;     dec     de
;     ld      a, d
;     or      e
;     jp      nz, .loop_10

    ; ; load sprite colors
    ; ld      a, 0000 0001 b
    ; ld      hl, SPRCOL
    ; call    SetVdp_Write
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ; ld      d, 5          ; number of repetitions (same as factor)
    ; .loop_colors:
    ;     ld      hl, StageClear_Colors_factor_5
    ;     ld      b, StageClear_Colors_factor_5.size
    ;     otir
    ; dec     d
    ; jp      nz, .loop_Colors


    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_0

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, StageClear_Patterns_S_factor_5
    ld      iy, StageClear_Patterns_S_factor_5.size

    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, StageClear_Colors_factor_5
    ld      b, StageClear_Colors_factor_5.size

    jp      .continue



.load_4x4_sprites_maximized:
    call    SetSpritesMaximized

    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_2

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, StageClear_Patterns_S_factor_4
    ld      iy, StageClear_Patterns_S_factor_4.size

    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, StageClear_Colors_factor_4
    ld      b, StageClear_Colors_factor_4.size

    jp      .continue



.load_3x3_sprites_maximized:
    call    SetSpritesMaximized

    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_4

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, StageClear_Patterns_S_factor_3
    ld      iy, StageClear_Patterns_S_factor_3.size

    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, StageClear_Colors_factor_3
    ld      b, StageClear_Colors_factor_3.size

    jp      .continue



.load_5x5_sprites_minimized:
    call    SetSpritesMinimized

    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_6

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, StageClear_Patterns_S_factor_5
    ld      iy, StageClear_Patterns_S_factor_5.size

    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, StageClear_Colors_factor_5
    ld      b, StageClear_Colors_factor_5.size

    jp      .continue



.load_4x4_sprites_minimized:
    call    SetSpritesMinimized

    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_8

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, StageClear_Patterns_S_factor_4
    ld      iy, StageClear_Patterns_S_factor_4.size

    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, StageClear_Colors_factor_4
    ld      b, StageClear_Colors_factor_4.size

    jp      .continue



.load_3x3_sprites_minimized:
    call    SetSpritesMinimized

    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_10

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, StageClear_Patterns_S_factor_3
    ld      iy, StageClear_Patterns_S_factor_3.size

    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, StageClear_Colors_factor_3
    ld      b, StageClear_Colors_factor_3.size

    jp      .continue



.load_2x2_sprites_minimized:
    call    SetSpritesMinimized

    ; set HL to SPRATR to be loaded
    ld      hl, StageClearAnimation_SPRATR.frame_12

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, StageClear_Patterns_S_factor_2
    ld      iy, StageClear_Patterns_S_factor_2.size

    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, StageClear_Colors_factor_2
    ld      b, StageClear_Colors_factor_2.size

    jp      .continue



