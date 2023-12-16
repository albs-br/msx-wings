;NUMBER_OF_PLAYER_SHOTS:         equ 6

GameLogic:

    ld      hl, PlayerShot_0_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_1_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_2_Struct
    call    PlayerShot_Logic
    ; ld      hl, PlayerShot_3_Struct
    ; call    PlayerShot_Logic
    ; ld      hl, PlayerShot_4_Struct
    ; call    PlayerShot_Logic
    ; ld      hl, PlayerShot_5_Struct
    ; call    PlayerShot_Logic


    call    PlayerSprite
    call    PlayerEngineAnimation



    call    PlayerBombLogic
    

    ; -------------------------------------------

    call    ItemAnimation

    ; -------------------------------------------

    ; if (EnemyMode == ENEMY_MODE_SMALL_ENEMIES) {
    ld      a, (EnemyMode)
    cp      ENEMY_MODE_SMALL_ENEMIES
    jp      nz, .enemyMode_BigEnemies

    ld      hl, Enemy_0_Struct
    call    Enemy_Logic
    ld      hl, Enemy_1_Struct
    call    Enemy_Logic
    ld      hl, Enemy_2_Struct
    call    Enemy_Logic
    ld      hl, Enemy_3_Struct
    call    Enemy_Logic
    ld      hl, Enemy_4_Struct
    call    Enemy_Logic
    ld      hl, Enemy_5_Struct
    call    Enemy_Logic
    ld      hl, Enemy_6_Struct
    call    Enemy_Logic

    jp      .cont_0

    ; } else {
.enemyMode_BigEnemies:

    ; update big enemies patterns only once (both uses the same animation frame)
    call    UpdateBigEnemiesPatterns

    ld      hl, BigEnemy_0_Struct
    call    BigEnemy_Logic
    ld      hl, BigEnemy_1_Struct
    call    BigEnemy_Logic

    ; }

.cont_0:

    ; -------------------------------------------

    ld      hl, EnemyShot_0_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_1_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_2_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_3_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_4_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_5_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_6_Struct
    call    EnemyShot_Logic

    ; -------------------------------------------

    ; reset ground target sprite
    ld      a, 255
    ld      (GroundTarget_Sprite.X), a

    ld      a, (Screen_Y_Origin)
    add     212                             ; out of visible screen
    ld      (GroundTarget_Sprite.Y), a

    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a



    ld      hl, GroundTarget_0_Struct
    call    GroundTarget_Logic
    ld      hl, GroundTarget_1_Struct
    call    GroundTarget_Logic
    ld      hl, GroundTarget_2_Struct
    call    GroundTarget_Logic
    ld      hl, GroundTarget_3_Struct
    call    GroundTarget_Logic
    ld      hl, GroundTarget_4_Struct
    call    GroundTarget_Logic
    ld      hl, GroundTarget_5_Struct
    call    GroundTarget_Logic

    ; -------------------------------------------

    ; call    Boss_Logic

    ; -------------------------------------------

    ld      hl, (LevelCounter)
    inc     hl
    ld      (LevelCounter), hl


    ; set MegaROM page for Level 1 data
    ld      a, LEVEL_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a


    ;ld      hl, Level_1_Data
    ld      hl, (LevelData_CurrentAddr)
    ld      de, (LevelCounter)
.loop:
    push    hl      ; CAUTION: these two PUSHes are POPed in two different places!
        push    de
            ; HL = level data of current position
            ld      a, (hl)
            inc     hl
            ld      h, (hl)
            ld      l, a

            ; if (LevelData == 0x0000) exit
            or      h
            jp      z, .endOfLevelData

            ; DE = level counter
            call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
        pop     de
    pop     hl

    ld      (LevelData_CurrentAddr), hl
    jp      z, .executeLevelData
    jp      nc, .exitLevelData           ; if (HL > DE)

    ; next LevelData
    ld      bc, LevelData_Temp_Struct.size
    add     hl, bc
    jp      .loop

.endOfLevelData:
        pop     de                  ; not a good practice :P
    pop     hl
    jp      .exitLevelData

.executeLevelData:

    ld      de, (LevelData_CurrentAddr)
    ld      b, d
    ld      c, e
    inc     bc
    inc     bc
    ld      a, (bc)         ; switch (LevelData_Temp_EnemyType)
    
    cp      ENEMY_TYPE_1
    call    z, Enemy_Init
    
    cp      BIG_ENEMY_TYPE_CHOPPER
    call    z, BigEnemy_Init
    cp      BIG_ENEMY_TYPE_TANK
    call    z, BigEnemy_Init
    cp      BIG_ENEMY_TYPE_HOVERCRAFT
    call    z, BigEnemy_Init
    
    cp      ENEMY_SHOT_TYPE_1
    call    z, EnemyShot_Init

    cp      GROUND_TARGET
    call    z, GroundTarget_Init

.exitLevelData:





    ; -------------------------------------------

    ; if (Player_FramesSinceLastShot == 255) ret
    ld      a, (Player_FramesSinceLastShot)
    inc     a
    ret     z
    ; else Player_FramesSinceLastShot ++ 
    ld      (Player_FramesSinceLastShot), a


    ret



