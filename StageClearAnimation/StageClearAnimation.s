StageClearAnimation:

    call    .hideAllSprites

    ; set MegaROM page for Stage clear animation sprites data
    ld      a, STAGE_CLEAR_ANIMATION_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a


    ; init variables for this char (S)
    xor     a
    ld      (LevelInitAnimation_Counter), a

    ld      hl, StageClearAnimation_SPRATR.frame_0 
    ld      (StageClearAnimationVars.SPRATR_Address), hl

    ld      hl, StageClear_Patterns_S_factor_5 
    ld      (StageClearAnimationVars.SPRPAT_Address), hl

    ld      hl, StageClear_Colors_factor_5 
    ld      (StageClearAnimationVars.SPRCOL_Address), hl


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
            ; ld      b, 0 + (32 * 4)
            ld      c, PORT_0
            ; ld      hl, StageClearAnimation_SPRATR.frame_0; SPRATR_Buffer
        pop     de, hl
        ; otir
        ; 25 * 4 = 100
        ; 100x outi:
        outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
        outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi
    pop     bc



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
        ; ; 32x outi:
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
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

; ; Inputs:
; ;   IY: SPRPAT size on bytes
; ;   B: SPRCOL size on bytes
; .loadSprites:

;     ; set IX to SPRPAT to be loaded (size in IY)
;     ld      ix, (StageClearAnimationVars.SPRPAT_Address)
;     ;ld      iy, 0 + (StageClear_Patterns_S_factor_5.size) ; all chars have the sime size

;     push    bc
;         ; set SPRPAT_Address var to next frame
;         ld      bc, 0 + (StageClear_Patterns_S_factor_5.size) ; all chars have the sime size
;         call    .updateSPRPAT
;     pop     bc

;     ; set DE to SPRCOL to be loaded (size in B)
;     ld      de, (StageClearAnimationVars.SPRCOL_Address)
;     ; ld      b, StageClear_Colors_factor_5.size

;     push    bc
;         ; set SPRCOL_Address var to next frame
;         ; ld      bc, StageClear_Colors_factor_5.size ; all chars have the sime size
        
;         ; BC = B
;         ld      c, b
;         ld      b, 0

;         call    .updateSPRCOL


;         ; set HL to SPRATR to be loaded
;         ld      hl, (StageClearAnimationVars.SPRATR_Address)
;         push    hl
;             ; set SPRATR_Address var to next frame
;             ld      bc, StageClearAnimation_SPRATR.frame_0_size ; all chars have the sime size
;             call    .updateSPRATR
;             ; ld      hl, (StageClearAnimationVars.SPRATR_Address)
;             ; ld      bc, StageClearAnimation_SPRATR.frame_0_size ; all chars have the sime size
;             ; add     hl, bc
;             ; ld      (StageClearAnimationVars.SPRATR_Address), hl
;         pop     hl
;     pop     bc
    
;     ret

.load_5x5_sprites_maximized:
    call    SetSpritesMaximized

    ; set IX to SPRPAT to be loaded (size in IY)
    ; ld      ix, StageClear_Patterns_S_factor_5
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, 0 + (StageClear_Patterns_S_factor_5.size) ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, 0 + (StageClear_Patterns_S_factor_5.size) ; all chars have the sime size
    call    .nextSPRPAT
    ; ld      hl, (StageClearAnimationVars.SPRPAT_Address)
    ; ld      bc, StageClear_Patterns_S_factor_5.size ; all chars have the sime size
    ; add     hl, bc
    ; ld      (StageClearAnimationVars.SPRPAT_Address), hl


    ; set DE to SPRCOL to be loaded (size in B)
    ; ld      de, StageClear_Colors_factor_5
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      b, StageClear_Colors_factor_5.size

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_5.size ; all chars have the sime size
        call    .nextSPRCOL
        ; ld      hl, (StageClearAnimationVars.SPRCOL_Address)
        ; ld      bc, StageClear_Colors_factor_5.size ; all chars have the sime size
        ; add     hl, bc
        ; ld      (StageClearAnimationVars.SPRCOL_Address), hl


        ; set HL to SPRATR to be loaded
        ; ld      hl, StageClearAnimation_SPRATR.frame_0
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR.frame_0_size ; all chars have the sime size
            call    .nextSPRATR
            ; ld      hl, (StageClearAnimationVars.SPRATR_Address)
            ; ld      bc, StageClearAnimation_SPRATR.frame_0_size ; all chars have the sime size
            ; add     hl, bc
            ; ld      (StageClearAnimationVars.SPRATR_Address), hl
        pop     hl
    pop     bc

    jp      .continue



.load_4x4_sprites_maximized:
    call    SetSpritesMaximized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_4.size ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_4.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      b, StageClear_Colors_factor_4.size

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_4.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR.frame_2_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_3x3_sprites_maximized:

    call    SetSpritesMaximized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_3.size ; all chars have the sime size

    ; THIS one is different from the others, as it is the transition from maximized to normal sprites
    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_5.size + StageClear_Patterns_S_factor_4.size ; all chars have the sime size
    ld      hl, (StageClearAnimationVars.SPRPAT_Address)
    xor     a
    sbc     hl, bc
    ld      (StageClearAnimationVars.SPRPAT_Address), hl


    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      b, StageClear_Colors_factor_3.size

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
            ld      bc, StageClearAnimation_SPRATR.frame_4_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_5x5_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_5.size ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_5.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      b, StageClear_Colors_factor_5.size

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_5.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR.frame_6_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_4x4_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_4.size ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_4.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      b, StageClear_Colors_factor_4.size

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_4.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR.frame_8_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_3x3_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_3.size ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_3.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      b, StageClear_Colors_factor_3.size

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_3.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR.frame_10_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue



.load_2x2_sprites_minimized:

    call    SetSpritesMinimized

    ; set IX to SPRPAT to be loaded (size in IY)
    ld      ix, (StageClearAnimationVars.SPRPAT_Address)
    ld      iy, StageClear_Patterns_S_factor_2.size ; all chars have the sime size

    ; set SPRPAT_Address var to next frame
    ld      bc, StageClear_Patterns_S_factor_2.size ; all chars have the sime size
    call    .nextSPRPAT


    ; set DE to SPRCOL to be loaded (size in B)
    ld      de, (StageClearAnimationVars.SPRCOL_Address)
    ld      b, StageClear_Colors_factor_2.size

    push    bc
        ; set SPRCOL_Address var to next frame
        ld      bc, StageClear_Colors_factor_2.size ; all chars have the sime size
        call    .nextSPRCOL


        ; set HL to SPRATR to be loaded
        ld      hl, (StageClearAnimationVars.SPRATR_Address)
        push    hl
            ; set SPRATR_Address var to next frame
            ld      bc, StageClearAnimation_SPRATR.frame_12_size ; all chars have the sime size
            call    .nextSPRATR
        pop     hl
    pop     bc

    jp      .continue


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