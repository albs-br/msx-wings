PLAYER_BOMB_MAX_LIFETIME:   equ 32     ; 32 frames = aprox. half second

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

    ld      a, (Player_Bomb_Y_Static)
    sub     8
    ld      (Player_Bomb_Y_Static), a

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

    ; ---- check collision with enemies (only Y axis)
    ld      ix, Enemy_0_Struct
    call    .checkCollision_PlayerBomb_Enemy
    call    c, .collision

    ld      ix, Enemy_1_Struct
    call    .checkCollision_PlayerBomb_Enemy
    call    c, .collision

    ld      ix, Enemy_2_Struct
    call    .checkCollision_PlayerBomb_Enemy
    call    c, .collision

    ld      ix, Enemy_3_Struct
    call    .checkCollision_PlayerBomb_Enemy
    call    c, .collision

    ld      ix, Enemy_4_Struct
    call    .checkCollision_PlayerBomb_Enemy
    call    c, .collision

    ld      ix, Enemy_5_Struct
    call    .checkCollision_PlayerBomb_Enemy
    call    c, .collision

    ld      ix, Enemy_6_Struct
    call    .checkCollision_PlayerBomb_Enemy
    call    c, .collision


    ret

.collision:
    ; call    PlayerShot_Reset
    push    ix ; HL = IX
    pop     hl
    ; ld      hl, Enemy_Temp_Struct
    call    Enemy_StartExplosionAnimation
    
    ret

;  Calculates whether a collision occurs between player bomb and enemy (only Y axis)
; IN: 
;    HL: enemy struct addr
; OUT: Carry set if collision
; CHANGES: AF
.checkCollision_PlayerBomb_Enemy:
    ld      a, (ix)         ; get enemy status
    ; or      a
    ; ret     z               ; if (Status == 0) ret
    ; cp      255             ; if (Status == 255) ret (means that this enemy was turned into item)
    ; ret     z
    cp      1       ; check collision only if enemy is alive (status = 1)
    scf         ; set carry flag
    ccf         ; complement carry flag
    ret     nz

    ; get enemy Y static
    ld      c, (ix + 3)

    ld      a, (Player_Bomb_Y_Static)   ; get y2
    sub     c                           ; calculate y2 - y1
    jr      c, .y1IsLarger              ; jump if y2 < y1
    sub     16                          ; compare with size 1
    ret                                 ; return collision or no collision
.y1IsLarger:
    neg                                 ; use negative value (Z80)

    sub     16                          ; compare with size 2
    ret                                 ; return collision or no collision

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
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


    ; ---- reset SPRCOL data for enemy shots (sprites #24 to #30 of SPRATR)
    ; (NOT really necessary, as this data is written each frame on enemy shot logic)

    ret