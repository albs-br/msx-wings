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

    ; ---- reset SPRPAT data for enemy shots sprite

    ; set MegaROM page for Sprite Patterns data
    ld      a, SPRITE_PATTERNS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ld      a, 0000 0001 b
    ld      hl, SPRPAT + (32 * 10) ; Sprite pattern #10
    call    SetVdp_Write
    ld      c, PORT_0
    ld      hl, SpritePattern_EnemyShot_0_and_1
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


    ; ---- reset SPRCOL data for enemy shots (sprites #24 to #30 of SPRATR)
    ; (NOT really necesary, as this data is written each fram on enemy shot logic)

    ret