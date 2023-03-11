PLAYER_BOMB_MAX_LIFETIME:   equ 240     ; 240 frames = 4 seconds

PlayerBombLogic:

    ; if(Player_BombActive != 0) return;
    ld      a, (Player_BombActive)
    or      a
    ret     z

    ; Player_BombActive++
    inc     a
    cp      PLAYER_BOMB_MAX_LIFETIME
    jp      z, .resetPlayerBomb

    ld      (Player_BombActive), a

    ; do bomb animation
    ; TODO

    ret

.resetPlayerBomb:
    xor     a
    ld      (Player_BombActive), a
    ret