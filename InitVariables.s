PLAYER_INITIAL_X:               equ 128 - (PLANE_PLAYER_WIDTH/2)
PLAYER_INITIAL_Y:               equ 192 - 32

InitVariables:

    ld      a, PLAYER_INITIAL_X
    ld      (Player_X), a

    ld      a, PLAYER_INITIAL_Y
    ld      (Player_Y), a
    ld      (Player_Y_Static), a


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


    ; load first shot struct addr
    ld      hl, PlayerShot_0_Struct
    ld      (NextShot_Struct_Addr), hl

    ld      a, 255
    ld      (Player_FramesSinceLastShot), a


    ld      hl, 0
    ld      (LevelCounter), hl


    ; copy from initial sprite attributes to buffer
    ld      hl, InitialSpriteAttributes
    ld      de, SpriteAttrTableBuffer
    ld      bc, InitialSpriteAttributes.size
    ldir



    ret