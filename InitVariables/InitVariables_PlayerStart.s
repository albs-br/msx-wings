InitVariables_PlayerStart:

    ld      a, 1 ; set status = alive

    jp      InitVariables_continue

InitVariables_PlayerRespawn:

    ld      a, 21 ; set status = respawn

InitVariables_continue:
    ld      (Player_Status), a

    ld      a, PLAYER_INITIAL_X
    ld      (Player_X), a

    ld      a, PLAYER_INITIAL_Y
    ld      (Player_Y_Static), a
    ld      b, a
    ld      a, (VerticalScroll) ; adjust to scroll
    add     b
    ld      (Player_Y), a

    ld      a, 0
    ld      (Player_Shot_Level), a

    ld      a, PLAYER_SHOT_WIDTH_SINGLE
    ld      (Player_Shot_Width), a

    ld      a, 128
    ld      (Player_SideMovementCounter), a

    ld      a, PLAYER_SPR_PAT_0_NUMBER      ; set sprite pattern for plane still (not moving sideways)
    ld      (Player_SpritePatternNumber), a

    ld      a, 1
    ld      (Player_Controls_Enabled), a

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



    xor     a
    ld      (Player_BombActive), a


    ; load first shot struct addr
    ld      hl, PlayerShot_0_Struct
    ld      (NextShot_Struct_Addr), hl

    ld      a, 255
    ld      (Player_FramesSinceLastShot), a


    ret