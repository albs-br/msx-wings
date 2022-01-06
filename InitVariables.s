InitVariables:

    ld      a, 100
    ld      (Player_X), a

    ld      a, 90
    ld      (Player_Y), a
    ld      (Player_Y_Static), a


    ld      hl, PlayerShot_0_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_1_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_2_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_3_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_4_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_5_Struct
    call    PlayerShot_Reset




    ; copy from initial sprite attributes to buffer
    ld      hl, InitialSpriteAttributes
    ld      de, SpriteAttrTableBuffer
    ld      bc, InitialSpriteAttributes.size
    ldir



    ret