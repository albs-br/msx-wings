UpdateBigEnemiesPatterns:

    ; if both enemies are dead (status == 0) return
    ld      a, (BigEnemy_0_Struct)  ; get big enemy 0 status
    ld      b, a
    ld      a, (BigEnemy_1_Struct)  ; get big enemy 1 status
    or      b
    ret     z



    ; switch(BigEnemy_Type)
    ld      a, (BigEnemy_Type)
    cp      BIG_ENEMY_TYPE_CHOPPER
    jp      z, UpdateBigEnemiesPatterns_BigEnemyTypeChopper
    cp      BIG_ENEMY_TYPE_HOVERCRAFT
    jp      z, UpdateBigEnemiesPatterns_BigEnemyTypeHovercraft
    jp      UpdateBigEnemiesPatterns_BigEnemyTypeTank




; ----------------------------------------

UpdateBigEnemiesPatterns_BigEnemyTypeChopper:

    ; switch (Animation_Counter)
    ld      a, (BigEnemy_Animation_Counter)
    
    cp      2
    jp      c, .loadFrame_1 ; counter 0 or 1
    cp      4
    jp      c, .loadFrame_2 ; counter 2 or 3


; .loadFrame_0: ; counter 4 or 5
    ld      hl, SpritePattern_EnemyChopper_Frame_0_TopLeft
    ld      de, SpriteColors_EnemyChopper_Frame_0_TopLeft
    jp      .continue

.loadFrame_1:
    ld      hl, SpritePattern_EnemyChopper_Frame_1_TopLeft
    ld      de, SpriteColors_EnemyChopper_Frame_1_TopLeft
    jp      .continue

.loadFrame_2:
    ld      hl, SpritePattern_EnemyChopper_Frame_2_TopLeft
    ld      de, SpriteColors_EnemyChopper_Frame_2_TopLeft
    ; jp      .continue

.continue:
    inc     a
    cp      6
    jp      nz, .dontReset
    xor     a
.dontReset:
    ld      (BigEnemy_Animation_Counter), a

    jp      UpdateBigEnemiesPatterns_cont_1



; ----------------------------------------

UpdateBigEnemiesPatterns_BigEnemyTypeHovercraft:

    ; switch (Animation_Counter)
    ld      a, (BigEnemy_Animation_Counter)
    
    cp      20
    jp      c, .loadFrame_1 ; counter 0 to 19
 

; .loadFrame_0: ; counter 20 to 39
    ld      hl, SpritePattern_EnemyHovercraft_Frame_0_TopLeft
    ld      de, SpriteColors_EnemyHovercraft_Frame_0_TopLeft
    jp      .continue

.loadFrame_1:
    ld      hl, SpritePattern_EnemyHovercraft_Frame_1_TopLeft
    ld      de, SpriteColors_EnemyHovercraft_Frame_1_TopLeft
    ; jp      .continue

.continue:
    inc     a
    cp      40
    jp      nz, .dontReset
    xor     a
.dontReset:
    ld      (BigEnemy_Animation_Counter), a

    jp      UpdateBigEnemiesPatterns_cont_1



; ----------------------------------------

UpdateBigEnemiesPatterns_BigEnemyTypeTank:

    ; TODO: no need to update SPRPAT and SPRCOL each frame...
    ; nor on other Big Enemies

    ; tank has no animation
    ld      hl, SpritePattern_EnemyTank_Frame_0_TopLeft
    ld      de, SpriteColors_EnemyTank_Frame_0_TopLeft

    ; jp      .UpdateBigEnemiesPatterns_cont_1

; ----------------------------------------

UpdateBigEnemiesPatterns_cont_1:
    push    de
        push    hl

            ; set MegaROM page for Big Enemy sprite patterns data
            ld      a, SPRITE_PATTERNS_DATA_MEGAROM_PAGE
            ; ld	    (Seg_P8000_SW), a
            call    Set_and_Save_MegaROM_Page

            ; load patterns
            ld      a, 0000 0001 b
            ld      hl, SPRPAT + ((BIG_ENEMY_SPR_PAT_0_NUMBER / 4) * 32)
            call    SetVdp_Write
            ; ld      b, xxxxx.size
            ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
        ; ld      hl, SpritePattern_EnemyChopper_Frame_0_TopLeft
        pop     hl
        ; 7 x 32 OUTI
        ld      a, 14
    .loop_a:
        outi outi outi outi outi outi outi outi
        outi outi outi outi outi outi outi outi 
        dec     a
        jp      nz, .loop_a


    pop     hl

    ; set MegaROM page for Big Enemy sprite colors data
    ld      a, SPRITE_COLORS_CONT_DATA_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page


    ; ld      hl, SpriteColors_EnemyChopper_Frame_2_TopLeft
    ld      de, SPRCOL + (10 * 16)
    push    hl
        ld      ix, BigEnemy_0_Struct
        ; ld      a, (BigEnemy_0_Struct)  ; get enemy status
        ; cp      1                       ; check if enemy is alive
        ; ld      a, (BigEnemy_0_Struct + 30)  ; get enemy hit flag
        call    .loadColorsForBigEnemy
    pop     hl

    ld      de, SPRCOL + (17 * 16)
    ld      ix, BigEnemy_1_Struct
    ; ld      a, (BigEnemy_1_Struct)  ; get enemy status
    ; cp      1                       ; check if enemy is alive
    ; ld      a, (BigEnemy_1_Struct + 30)  ; get enemy hit flag
    call    .loadColorsForBigEnemy

    ret

; Input
;   HL: addr source for sprite colors (7 x 16 bytes)
;   DE: VRAM addr of SPRCOL
;   IX: big enemy struct addr
.loadColorsForBigEnemy:

    ld      a, (ix + 0)  ; get enemy status
    cp      1            ; check if enemy is alive
    ret     nz
    
    push    hl
        ex      de, hl ; HL = DE
        ld      a, 0000 0001 b
        ; ld      hl, SPRCOL + (10 * 16)
        call    SetVdp_Write
        ; ld      b, xxxxx.size
        ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    pop     hl

    ld      a, (ix + 30)  ; get enemy hit flag
    or      a
    jp      nz, .enemyColorWhite

    ld      a, 7
.loop_b:
    outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi 
    dec     a
    jp      nz, .loop_b

    ret

.enemyColorWhite:

    xor     a
    ld      (ix + 30), a  ; reset enemy hit flag

    ; all colors white to show visual feedback
    ; ld      c, PORT_0
    ld      a, 13 ; white color
    ld      b, 7 * 16 ; 7 sprites
.loop_setColors:
    out     (c), a
    nop
    djnz    .loop_setColors

    ret