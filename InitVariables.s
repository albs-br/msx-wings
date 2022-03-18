PLAYER_INITIAL_X:               equ 128 - (PLANE_PLAYER_WIDTH/2)
PLAYER_INITIAL_Y:               equ 192 - 32

InitVariables:

    ld      a, PLAYER_INITIAL_X
    ld      (Player_X), a

    ld      a, PLAYER_INITIAL_Y
    ld      (Player_Y), a
    ld      (Player_Y_Static), a

    ld      a, 128
    ld      (Player_SideMovementCounter), a

    ld      a, PLAYER_SPR_PAT_0_NUMBER      ; set sprite pattern for plane still (not moving sideways)
    ld      (Player_SpritePatternNumber), a

    ld      hl, PlayerShot_0_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_1_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_2_Struct
    call    PlayerShot_Reset
    ; ld      hl, PlayerShot_3_Struct
    ; call    PlayerShot_Reset
    ; ld      hl, PlayerShot_4_Struct
    ; call    PlayerShot_Reset
    ; ld      hl, PlayerShot_5_Struct
    ; call    PlayerShot_Reset


    ld      hl, Enemy_0_Struct
    call    Enemy_Reset
    ld      hl, Enemy_1_Struct
    call    Enemy_Reset
    ld      hl, Enemy_2_Struct
    call    Enemy_Reset
    ld      hl, Enemy_3_Struct
    call    Enemy_Reset
    ld      hl, Enemy_4_Struct
    call    Enemy_Reset
    ld      hl, Enemy_5_Struct
    call    Enemy_Reset
    ld      hl, Enemy_6_Struct
    call    Enemy_Reset


    ld      hl, EnemyShot_0_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_1_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_2_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_3_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_4_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_5_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_6_Struct
    call    EnemyShot_Reset


    ; load first shot struct addr
    ld      hl, PlayerShot_0_Struct
    ld      (NextShot_Struct_Addr), hl

    ld      a, 255
    ld      (Player_FramesSinceLastShot), a


    xor     a
    ld      (Screen_Y_Origin), a
    ld      (FramesSkipped), a


    ld      hl, 0
    ld      (LevelCounter), hl


    ; TODO: move this to a "LoadLevel" sub
    ld      hl, Level_1_Data
    ld      (LevelData_CurrentAddr), hl



    call    InitAyFxVariables



    ; copy from initial sprite attributes to buffer
    ld      hl, InitialSpriteAttributes
    ld      de, SPRATR_Buffer
    ld      bc, InitialSpriteAttributes.size
    ldir



    ret