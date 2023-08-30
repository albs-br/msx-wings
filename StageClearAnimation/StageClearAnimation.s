StageClearAnimation:

    push    af
        ; hide all sprites (set Y=216 for all 32 sprites on SPRATR)
        ld      de, 4
        ld      a, 216
        ld      hl, SPRATR_Buffer
        ld      b, 32
    .loop_2:
        ld      (hl), a
        add     hl, de
        djnz    .loop_2

        ; set MegaROM page for ??? data
        ld      a, ????_MEGAROM_PAGE
        ld	    (Seg_P8000_SW), a
    pop     af


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

    ; else if (counter < 4)
    cp      4
    jp      c, .load_4x4_sprites_maximized

    ; TODO: other ifs

    ; else .exit
    jp      .exit

.continue:



    ; load SPRATR buffer from HL addr
    ld      de, SPRATR_Buffer
.SPRATR_Buffer_loop:
    ld      a, (hl)

    ldi ; Y

    cp      216 ; if (Y==216) end
    jp      z, .SPRATR_Buffer_loop_end

    ldi ; X
    ldi ; pattern
    ldi ; not used

.SPRATR_Buffer_loop_end:



    ; load from SPRATR_Buffer to SPRATR table (all 32 sprites)
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      bc, 0 + ((32 * 4) * 256) + PORT_0
    ld      hl, SPRATR_Buffer
    otir
    ; ; 4x OUTI
    ; outi outi outi outi 

    jp      .animationLoop

.exit:
    call    SetSpritesMinimized



    ret

.load_5x5_sprites_maximized:

    call    SetSpritesMaximized

    ; load sprite patterns
    
    ; load sprite colors

    ; set HL to SPRATR to be loaded
    ld      hl, ????

    jp      .continue