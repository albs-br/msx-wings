ENEMY_PIXELS_PER_MOV:    equ 3


; Input
;   HL: addr of enemy struct
;   DE: addr of level data struct
Enemy_Init:

    ; init enemy / load some data from Level Data Struct to Enemy Struct

    ; get enemy number from Level Data struct and point HL to the corresponding Enemy Struct
    push    de
        inc     de
        inc     de
        inc     de
        inc     de
        inc     de
        inc     de
        ld      a, (de)
        or      a
        jp      z, .enemy_0
        dec     a
        jp      z, .enemy_1
        dec     a
        jp      z, .enemy_2
        dec     a
        jp      z, .enemy_3
        dec     a
        jp      z, .enemy_4
        dec     a
        jp      z, .enemy_5
.enemy_0:
        ld      hl, Enemy_0_Struct
        ld      bc, ENEMY_0_SPRCOL_ADDR
        jp      .endEnemyNumber
.enemy_1:
        ld      hl, Enemy_1_Struct
        ld      bc, ENEMY_1_SPRCOL_ADDR
        jp      .endEnemyNumber
.enemy_2:
        ld      hl, Enemy_2_Struct
        ld      bc, ENEMY_2_SPRCOL_ADDR
        jp      .endEnemyNumber
.enemy_3:
        ld      hl, Enemy_3_Struct
        ld      bc, ENEMY_3_SPRCOL_ADDR
        jp      .endEnemyNumber
.enemy_4:
        ld      hl, Enemy_4_Struct
        ld      bc, ENEMY_4_SPRCOL_ADDR
        jp      .endEnemyNumber
.enemy_5:
        ld      hl, Enemy_5_Struct
        ld      bc, ENEMY_5_SPRCOL_ADDR
        jp      .endEnemyNumber
.endEnemyNumber:
    pop     de


    ; Load enemy colors
    push    bc
        push    hl
            ld      a, 0000 0001 b
            ld      h, b
            ld      l, c
            call    SetVdp_Write
            ;ld      b, SpriteColors_EnemyPlane_0_and_1.size
            ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
            ld      hl, SpriteColors_EnemyPlane_0_and_1
            ;otir
            ; 32x OUTI
            outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
            outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        pop     hl

        ld      a, 1
        ld      (hl), a     ; Status

        inc     hl
        ;ld      a, 128
        ; get initial X coord from level data struct
        inc     de
        inc     de
        inc     de
        ld      a, (de)
        ld      (hl), a     ; X

        inc     hl
        ld      a, (Screen_Y_Origin)
        ld      (hl), a     ; Y

        inc     hl
        xor     a
        ld      (hl), a     ; Y static

        inc     hl
        ld      a, ENEMY_SPR_PAT_0_NUMBER
        ld      (hl), a     ; Pattern 0

        inc     hl
        ld      a, ENEMY_SPR_PAT_1_NUMBER
        ld      (hl), a     ; Pattern 1

        inc     hl
        ; get  Delta X Initial Addr from level data struct
        inc     de
        ld      a, (de)
        ld      (hl), a     ; Delta X Current Addr (low byte)

        inc     hl
        inc     de
        ld      a, (de)
        ld      (hl), a     ; Delta X Current Addr (high byte)
    pop     bc

    inc     hl
    ld      (hl), c     ; SPRCOL Addr (low byte)

    inc     hl
    ld      (hl), b     ; SPRCOL Addr (high byte)

    ret



; Input
;   HL: addr of enemy struct
Enemy_Reset:
    xor     a
    ld      (hl), a     ; Status

    inc     hl
    ld      a, 255
    ld      (hl), a     ; X

    inc     hl
    ;ld      (hl), a     ; Y

    inc     hl
    ld      a, 192
    ld      (hl), a     ; Y static

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; Pattern 0

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; Pattern 1

    ret



; Input
;   HL: addr of enemy struct
Enemy_Logic:

    push    hl

        ; Copy enemy struct to temp enemy struct
        ;ld      hl, ?                                          ; source
        ld      de, Enemy_Temp_Struct                           ; destiny
        ld      bc, Enemy_Temp_Struct.size                      ; size
        ldir                                                    ; Copy BC bytes from HL to DE


        
        ld      a, (Enemy_Temp_Status)      ; get Status
        or      a
        jp      z, .return                  ; if (Status == 0) ret

        ; --------------------------- enemy movement -------------------------

        ld      a, (Enemy_Temp_Y_Static)    ; Y static
        cp      192
        jp      nc, .enemyReset             ; if (Y >= 192) enemyReset
        add     ENEMY_PIXELS_PER_MOV
        ld      (Enemy_Temp_Y_Static), a


        ld      a, (Enemy_Temp_Y)           ; Y
        add     ENEMY_PIXELS_PER_MOV
        ld      (Enemy_Temp_Y), a


        ; Delta X
        ld      hl, (Enemy_Temp_Delta_X_Current_Addr)                 ; Delta X
        ld      a, l
        or      h                       ; if (Delta X addr == 0)
        jp      z, .ignoreDeltaX
        
        ld      b, (hl)                 ; get delta X value
        ld      a, (Enemy_Temp_X)       ; get current X value
        add     a, b                    ; add to delta X
        ; TODO: test if sides of screen were reached
        ld      (Enemy_Temp_X), a       ; save it

        inc     hl                      ; next Delta X addr
        inc     hl
        ld      (Enemy_Temp_Delta_X_Current_Addr), hl
    .ignoreDeltaX:

        ; --------------------------- check collision  -------------------------

        ; check col. between current enemy and shot 0
        ld      a, (Enemy_Temp_X)
        ld      b, a
        ld      a, (Enemy_Temp_Y_Static)
        ld      c, a

        push    bc
                ld      hl, PlayerShot_0_Struct
                call    CheckCol_Enemy_PlayerShot
        pop     bc
        push    bc
                ld      hl, PlayerShot_1_Struct
                call    CheckCol_Enemy_PlayerShot
        pop     bc
        push    bc
                ld      hl, PlayerShot_2_Struct
                call    CheckCol_Enemy_PlayerShot
        pop     bc

;         ld      a, (PlayerShot_0_Struct)    ; Status
;         or      a
;         jp      z, .skipCheckColShot_0      ; if (Shot status == 0) skip Check Col.

;         ld      a, (PlayerShot_0_Struct + 1)    ; X
;         ld      d, a
;         ld      a, (PlayerShot_0_Struct + 3)    ; Y static
;         ld      e, a
;         call    CheckCollision_16x16_16x16
;         jp      c, .enemyReset
;     .skipCheckColShot_0:

        jp      .return

    .enemyReset:
        ld      hl, Enemy_Temp_Struct
        call    Enemy_Reset
        jp      .return
    

.return:
        ld      hl, Enemy_Temp_Struct                       ; source
    pop     de                                              ; destiny
    ld      bc, Enemy_Temp_Struct.size                      ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ret



; Inputs:
;   BC: X and Y of enemy
;   HL: PlayerShot struct addr
CheckCol_Enemy_PlayerShot:
        ld      a, (hl)    ; Status
        or      a
        ret     z ; jp      z, .skipCheckColShot_0      ; if (Shot status == 0) skip Check Col.

        push    hl
                inc     hl
                ld      a, (hl)    ; X
                ld      d, a

                inc     hl
                inc     hl
                ld      a, (hl)    ; Y static
                ld      e, a
                call    CheckCollision_16x16_16x16
        pop     hl
        jp      c, .collision
        ret
        ;     .skipCheckColShot_0:
        ;         ret
        .collision:
        call    PlayerShot_Reset
        ld      hl, Enemy_Temp_Struct
        call    Enemy_Reset
        ret
