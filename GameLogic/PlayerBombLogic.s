PLAYER_BOMB_MAX_LIFETIME:   equ 128     ; 128 frames = aprox. 2 seconds

PlayerBombLogic:

    ; if(Player_BombActive == 0) return;
    ld      a, (Player_BombActive)
    or      a
    ret     z

    ; Player_BombActive++; if(Player_BombActive == PLAYER_BOMB_MAX_LIFETIME) return;
    inc     a
    cp      PLAYER_BOMB_MAX_LIFETIME
    jp      z, .resetPlayerBomb

    ld      (Player_BombActive), a

    ; do bomb animation
    ld      a, (Player_Bomb_Y)
    sub     2
    ld      (Player_Bomb_Y), a

    ; TODO
    ; check collision with enemies

    ret

.resetPlayerBomb:
    xor     a
    ld      (Player_BombActive), a

    ; reset SPRCOL data for enemy shots (sprites #24 to #30 of SPRATR)

    ret