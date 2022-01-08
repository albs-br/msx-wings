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




    ld      hl, (LevelCounter)
    inc     hl
    ld      (LevelCounter), hl


    ; if (Player_FramesSinceLastShot == 255) ret
    ld      a, (Player_FramesSinceLastShot)
    inc     a
    ret     z
    ; else Player_FramesSinceLastShot ++ 
    ld      (Player_FramesSinceLastShot), a


    ret
