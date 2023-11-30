StageClearAnimation:

    ; restore default palette (one blue color is constantly being changed)
    ld      hl, PaletteData_0
    call    LoadPalette

    xor     a
    ld      (StageClearAnimationVars.CharCounter), a

.loopChars:

    call    .hideAllSprites

    ld      a, (StageClearAnimationVars.CharCounter)
    cp      10
    ret     z

    cp      0   ; char #0 (S)
    jp      z, .initChar_0

    cp      1   ; char #1 (T)
    jp      z, .initChar_1

    cp      2
    jp      z, .initChar_2

    cp      3
    jp      z, .initChar_3

    cp      4
    jp      z, .initChar_4

    cp      5
    jp      z, .initChar_5

    cp      6
    jp      z, .initChar_6

    cp      7
    jp      z, .initChar_7

    cp      8
    jp      z, .initChar_8

    cp      9 ; char #9 (R)
    jp      z, .initChar_9

    ret

.initChar_0:
    ; init variables for first char (S)
    ld      hl, StageClearAnimation_SPRATR_Char_0
    ld      bc, StageClear_Patterns_S_factor_5 
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_S

    jp      .cont_1

.initChar_1:
    ; init variables for first char (T)
    ld      hl, StageClearAnimation_SPRATR_Char_1
    ld      bc, StageClear_Patterns_T_factor_5 
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_T

    jp      .cont_1

.initChar_2:
    ; init variables for first char (A)
    ld      hl, StageClearAnimation_SPRATR_Char_2
    ld      bc, StageClear_Patterns_A_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_A

    jp      .cont_1

.initChar_3:
    ; init variables for first char (G)
    ld      hl, StageClearAnimation_SPRATR_Char_3
    ld      bc, StageClear_Patterns_G_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_G

    jp      .cont_1

.initChar_4:
    ; init variables for first char (E)
    ld      hl, StageClearAnimation_SPRATR_Char_4
    ld      bc, StageClear_Patterns_E_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_E

    jp      .cont_1

.initChar_5:
    ; init variables for first char (C)
    ld      hl, StageClearAnimation_SPRATR_Char_6
    ld      bc, StageClear_Patterns_C_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_C

    jp      .cont_1

.initChar_6:
    ; init variables for first char (L)
    ld      hl, StageClearAnimation_SPRATR_Char_7
    ld      bc, StageClear_Patterns_L_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_L

    jp      .cont_1

.initChar_7:
    ; init variables for first char (E)
    ld      hl, StageClearAnimation_SPRATR_Char_8
    ld      bc, StageClear_Patterns_E_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_E

    jp      .cont_1

.initChar_8:
    ; init variables for first char (A)
    ld      hl, StageClearAnimation_SPRATR_Char_9
    ld      bc, StageClear_Patterns_A_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_A

    jp      .cont_1

.initChar_9:
    ; init variables for first char (R)
    ld      hl, StageClearAnimation_SPRATR_Char_10
    ld      bc, StageClear_Patterns_R_factor_5
    ld      de, LargeFont_Patterns + LARGE_FONT_CHAR_R

    jp      .cont_1


.cont_1:

    ld      (StageClearAnimationVars.SPRATR_Address), hl
    ld      (StageClearAnimationVars.SPRPAT_Address), bc
    ld      (StageClearAnimationVars.FontSprite_16x16_Addr), de

    ; colors are the same for all chars
    ld      hl, StageClear_Colors_factor_5 
    ld      (StageClearAnimationVars.SPRCOL_Address), hl

    xor     a
    ld      (StageClearAnimationVars.FrameCounter), a

.animationLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.animationLoop_waitVBlank:
    cp      (hl)
    jr      z, .animationLoop_waitVBlank


    ; if counter is odd go to next frame
    ld      a, (StageClearAnimationVars.FrameCounter)
    and     0000 0001 b
    jp      nz, .nextFrame

    ld      a, (StageClearAnimationVars.FrameCounter)

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

    cp      14
    jp      z, .load_1x1_sprite_minimized

    ; else .exit
    jp      .exit

.continue:

    ; set MegaROM page for SPRATR Stage clear animation sprites data
    ld      a, STAGE_CLEAR_ANIMATION_DATA_MEGAROM_PAGE_1
    ld	    (Seg_P8000_SW), a

    ; load from HL to SPRATR table (all 32 sprites)
    push    bc, hl, de
            ld      a, 0000 0001 b
            ld      hl, SPRATR
            call    SetVdp_Write
            ld      c, PORT_0
        pop     de, hl
        ; otir
        ; 25 sprites * 4 = 100

        push    de

            ld      a, (VerticalScroll)
            ld      d, a

            ld      e, 25
        .loop_300:
                ; outi ; 18 cycles

                ; get Y coord and adjust to scroll
                ld      a, (hl)
                cp      216
                jp      z, .skip_300
                add     d
            .skip_300:
                ; cp      216 ; TODO (this may be necessary depending on VerticalScroll value + Y)
                out     (PORT_0), a
                inc     hl
                ; outi

                outi outi outi 

            dec     e
            jp      nz, .loop_300

        pop     de

        ; ; 100x outi:
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        outi ; OUTI for Y=216
    pop     bc


    ; set MegaROM page for SPRPAT/SPRCOL Stage clear animation sprites data
    ld      a, STAGE_CLEAR_ANIMATION_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    push    bc, de
        
        ; load from IX to SPRPAT (size in IY - divided by 32)
        ld      a, 0000 0001 b
        ld      hl, SPRPAT
        call    SetVdp_Write
        ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster

        ; HL = IX
        push    ix
        pop     hl

        ; DE = IY
        push    iy
        pop     de
    .loop_10:
        ; outi
        ; 32x outi:
        call    OUTI_x32
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        dec     de
        ld      a, d
        or      e
        jp      nz, .loop_10

    pop     de, bc



    ; load from DE to SPRCOL (factor in C)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      ixh, c          ; number of repetitions (same as factor)
    ; ld      b, c          ; number of repetitions (same as factor)
    ld      ixl, c            ; save factor
    ld      c, PORT_0
    .loop_colors:
        ; HL = DE
        ; push    de ; 23 cycles
        ; pop     hl
        ld      l, e ; 10 cycles
        ld      h, d

        ld      a, ixl
        ; otir
        .innerLoop_colors:
            ; 16x outi
            outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
            dec     a
            jp      nz, .innerLoop_colors

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
    ld      hl, StageClearAnimationVars.FrameCounter
    inc     (hl)

    jp      .animationLoop

.exit:

    call    .hideAllSprites

    ; clear SPRPAT
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Write
    xor     a
    ld      de, 256 * 8
.loop_100:
    out     (PORT_0), a
    dec     e
    jp      nz, .loop_100
    dec     d
    jp      nz, .loop_100

    ; clear SPRCOL
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    xor     a
    ld      de, 32 * 16
.loop_200:
    out     (PORT_0), a
    dec     e
    jp      nz, .loop_200
    dec     d
    jp      nz, .loop_200

    call    SetSpritesMinimized



    ret

; Input: BC: size in bytes
.nextSPRPAT:
    ld      hl, (StageClearAnimationVars.SPRPAT_Address)
    add     hl, bc
    ld      (StageClearAnimationVars.SPRPAT_Address), hl
    ret

; Input: BC: size in bytes
.nextSPRCOL:
    ld      hl, (StageClearAnimationVars.SPRCOL_Address)
    add     hl, bc
    ld      (StageClearAnimationVars.SPRCOL_Address), hl
    ret

; Input: BC: size in bytes
.nextSPRATR:
    ld      hl, (StageClearAnimationVars.SPRATR_Address)
    add     hl, bc
    ld      (StageClearAnimationVars.SPRATR_Address), hl
    ret

.load_5x5_sprites_maximized:
    call    SetSpritesMaximized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, 0 + (StageClear_Patterns_S_factor_5.size / 32) ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, 0 + (StageClear_Patterns_S_factor_5.size) ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (factor in C)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      c, 5

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_5.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR_Char_0.frame_0_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_4x4_sprites_maximized:
    call    SetSpritesMaximized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_4.size / 32 ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_4.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (factor in C)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      c, 4

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_4.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR_Char_0.frame_2_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_3x3_sprites_maximized:

    call    SetSpritesMaximized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_3.size / 32 ; all chars have the sime size

    ; THIS one is different from the others, as it is the transition from maximized to normal sprites
    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_5.size + StageClear_Patterns_S_factor_4.size ; all chars have the sime size
    ld      hl, (StageClearAnimationVars.SPRPAT_Address)
    xor     a
    sbc     hl, bc
    ld      (StageClearAnimationVars.SPRPAT_Address), hl


    ; set DE to SPRCOL to be loaded (factor in C)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      c, 3

    push    bc
        ; THIS one is different from the others, as it is the transition from maximized to normal sprites
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_5.size + StageClear_Colors_factor_4.size ; all chars have the sime size
        ld      hl, (StageClearAnimationVars.SPRCOL_Address)
        xor     a
        sbc     hl, bc
        ld      (StageClearAnimationVars.SPRCOL_Address), hl


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR_Char_0.frame_4_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_5x5_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_5.size / 32 ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_5.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (factor in C)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      c, 5

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_5.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR_Char_0.frame_6_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_4x4_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_4.size / 32 ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_4.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (factor in C)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      c, 4

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_4.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR_Char_0.frame_8_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_3x3_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_3.size / 32 ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_3.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (factor in C)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      c, 3

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_3.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR_Char_0.frame_10_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_2x2_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_2.size / 32 ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_2.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (factor in CB)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      c, 2

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_2.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR_Char_0.frame_12_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue

.load_1x1_sprite_minimized:

    call    .hideAllSprites

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; 8 left pixels of the chars
    ld      hl, (StageClearAnimationVars.FontSprite_16x16_Addr)
    ld      ix, LargeFont_Colors
    ld      de, ConvertMsx2SpritesToSc11_Output
    ld      b, 16
;   HL: pointer to sprite patterns on RAM (32 bytes for pattern 0, 32 bytes for pattern 1)
;   IX: pointer to sprite colors on RAM (16 bytes for color 0, 16 bytes for color 1)
;   DE: destiny addr on RAM
;   B:  font height in pixels
    call    ConvertMsx2SpritesToSc11

    ; 8 right pixels of the chars
    ld      hl, (StageClearAnimationVars.FontSprite_16x16_Addr)
    ld      bc, 16
    add     hl, bc
    ld      ix, LargeFont_Colors
    ld      de, ConvertMsx2SpritesToSc11_Output + 8
    ld      b, 16
;   HL: pointer to sprite patterns on RAM (32 bytes for pattern 0, 32 bytes for pattern 1)
;   IX: pointer to sprite colors on RAM (16 bytes for color 0, 16 bytes for color 1)
;   DE: destiny addr on RAM
;   B:  font height in pixels
    call    ConvertMsx2SpritesToSc11

    ld      hl, NAMTBL

    ; set MegaROM page for SPRATR Stage clear animation sprites data
    ld      a, STAGE_CLEAR_ANIMATION_DATA_MEGAROM_PAGE_1
    ld	    (Seg_P8000_SW), a

    ; adjust HL to sprite y position
    ld      de, 256
    ld      ix, (StageClearAnimationVars.SPRATR_Address)
    ld      b, (ix + 0) ; Y position

    ld      a, (VerticalScroll) ; adjust to scroll
    add     b
    ld      b, a
.loop_30:
    add     hl, de
    djnz    .loop_30

    ; adjust HL to sprite x position
    ld      d, 0
    ld      e, (ix + 1) ; X position
    add     hl, de

    ld      de, ConvertMsx2SpritesToSc11_Output
    call    Copy16x16ImageFromRAMToVRAM

    ; next char
    ld      hl, StageClearAnimationVars.CharCounter
    inc     (hl)

    jp      .loopChars

.hideAllSprites:
    ; hide all sprites (set Y=216 for all 32 sprites on SPRATR)
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, 32
.loop_2:

    ; on v9938/57 OUTs must be 15 cycles apart outside of vblank

    ld      a, 216  ; Y
    nop
    nop
    out     (PORT_0), a

    ld      a, 255  ; X
    nop
    nop
    out     (PORT_0), a

    xor     a       ; pattern
    nop
    nop
    out     (PORT_0), a

    xor     a       ; not used
    nop
    nop
    out     (PORT_0), a

    djnz    .loop_2

    ret