PLAYER_BOMB_MAX_LIFETIME:   equ 64     ; 64 frames = aprox. 1 second

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
    sub     8
    ld      (Player_Bomb_Y), a

    ; change border color
    ld      a, (BIOS_JIFFY)
    and     0000 0001 b
    jp      z, .setBorderWhite

    ld 		a, 1      	            ; Border color black
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color
    jp      .cont_1
.setBorderWhite:
    ld 		a, 13      	            ; Border color white
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color
.cont_1:

    ; play sfx
    ;ld      a, 100           ; volume
    ld      a, SFX_SHOT     ; number of sfx in the bank
    ld      c, 15            ; sound priority
    call    PlaySfx

    ; TODO
    ; check collision with enemies

    ret

.resetPlayerBomb:
    xor     a
    ld      (Player_BombActive), a

    ; reset border color
    ld 		a, 1      	            ; Border color black
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color

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
    ; (NOT really necessary, as this data is written each frame on enemy shot logic)

    ret