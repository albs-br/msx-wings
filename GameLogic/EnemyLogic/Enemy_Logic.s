ENEMY_PIXELS_PER_MOV:    equ 3







; Input
;   HL: addr of enemy struct
Enemy_Logic:

    ; check status before copying to temp vars to save cycles when disabled
    ld      a, (hl)     ; get Status
    or      a
    ret     z           ; if (Status == 0) ret

    push    hl

        ; Copy enemy struct to temp enemy struct
        ;ld      hl, ?                                          ; source
        ld      de, Enemy_Temp_Struct                           ; destiny
        ld      bc, Enemy_Temp_Struct.size                      ; size
        ldir                                                    ; Copy BC bytes from HL to DE


        
        ; ld      a, (Enemy_Temp_Status)      ; get Status
        ; or      a
        ; jp      z, .return                  ; if (Status == 0) ret

        ld      a, (Enemy_Temp_Status)      ; get Status
        cp      1
        jp      nz, .doExplosionAnimation   ; if (Status != 1) doExplosionAnimation


        ; --------------------------- enemy movement -------------------------

        ; Delta Y
        ld      hl, (Enemy_Temp_Delta_Y_Current_Addr)                 ; Delta Y
        ld      b, (hl)                     ; get delta Y value

        ld      a, (Enemy_Temp_Y_Static)    ; Y static
        cp      192
        jp      nc, .enemyReset             ; if (Y >= 192) enemyReset
        add     a, b                        ; add to delta Y
        ld      (Enemy_Temp_Y_Static), a

        ; TODO: test if Y is bellow 0? (Delta Y may be negative)


        ld      a, (Enemy_Temp_Y)           ; Y
        add     a, b                        ; add to delta Y
        ld      (Enemy_Temp_Y), a
        ld      a, (Enemy_Temp_Y1)          ; Y1
        add     a, b                        ; add to delta Y
        ld      (Enemy_Temp_Y1), a

        inc     hl                          ; next Delta Y addr
        ld      (Enemy_Temp_Delta_Y_Current_Addr), hl



        ; Delta X
        ld      hl, (Enemy_Temp_Delta_X_Current_Addr)                 ; Delta X
        
        ; TODO: this probably is not necessary anymore (Delta X now is a mandatory field)
        ld      a, l
        or      h                       ; if (Delta X addr == 0)
        jp      z, .ignoreDeltaX
        
        ld      b, (hl)                 ; get delta X value
        ld      a, (Enemy_Temp_X)       ; get current X value
        add     a, b                    ; add to delta X
        ; test if sides of screen were reached
        cp      3
        jp      c, .enemyReset          ; if (X < 3) enemyReset
        cp      254
        jp      nc, .enemyReset         ; if (X >= 254) enemyReset
        ld      (Enemy_Temp_X), a       ; save X

        ;ld      b, (hl)                 ; get delta X value
        ld      a, (Enemy_Temp_X1)      ; get current X1 value
        add     a, b                    ; add to delta X
        ld      (Enemy_Temp_X1), a      ; save X1



        inc     hl                      ; next Delta X addr
        ld      (Enemy_Temp_Delta_X_Current_Addr), hl
    .ignoreDeltaX:

        ; --------------------------- check collision (enemy x player shots) -------------------------

        ld      a, (Enemy_Temp_X)
        ld      b, a
        ld      a, (Enemy_Temp_Y_Static)
        ld      c, a

        push    bc
                ; check col. between current enemy and shot 0
                ld      hl, PlayerShot_0_Struct
                call    CheckCol_Enemy_PlayerShot
        pop     bc
        push    bc
                ; check col. between current enemy and shot 1
                ld      hl, PlayerShot_1_Struct
                call    CheckCol_Enemy_PlayerShot
        pop     bc
        push    bc
                ; check col. between current enemy and shot 2
                ld      hl, PlayerShot_2_Struct
                call    CheckCol_Enemy_PlayerShot
        pop     bc

        ; --------------------------- check collision (enemy x player plane) -------------------------

        ; ld      a, (Enemy_Temp_X)
        ; ld      b, a
        ; ld      a, (Enemy_Temp_Y_Static)
        ; ld      c, a

        ; check col. between current enemy and plane
        ld      a, (Player_X)
        add     2                           ; adjust the 16x16 collision box to the center of the plane
        ld      d, a
        ld      a, (Player_Y_Static)
        add     12                          ; adjust the 16x16 collision box to the body of the plane
        ld      e, a
        call    CheckCol_Enemy_PlayerPlane



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


.doExplosionAnimation:

    ld      a, (Enemy_Temp_Status)      ; get Status
    inc     a
    ld      (Enemy_Temp_Status), a
    cp      20
    ld      hl, Enemy_Temp_Struct
    call    z, Enemy_Reset


    ld      a, (Enemy_Temp_Status)      ; get Status
    cp      3 ; first frame of explosion (don't change it)
    jp      z, .loadExplosionFrame_0
    cp      7
    jp      z, .loadExplosionFrame_1
    cp      11
    jp      z, .loadExplosionFrame_2
    cp      15
    jp      z, .loadExplosionFrame_3
    jp      .return

.loadExplosionFrame_0:
    ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ld      (Enemy_Temp_Pattern_0), a
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (Enemy_Temp_Pattern_1), a
    
    ; load explosion colors (first sprite)
    ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ld      a, 0000 0001 b
    call    SetVdp_Write
    ld      c, PORT_0
    ld      hl, SpriteColors_Explosion_Frames_0_to_2
    ; 16x OUTI
    outi outi outi outi
    outi outi outi outi
    outi outi outi outi
    outi outi outi outi 

    ; load explosion colors (second sprite)
    ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ld      bc, 16
    add     hl, bc
    ld      a, 0000 0001 b
    call    SetVdp_Write
    ld      c, PORT_0
    ld      hl, SpriteColors_Explosion_Frames_0_to_2 + 16
    ; 16x OUTI
    outi outi outi outi
    outi outi outi outi
    outi outi outi outi
    outi outi outi outi 

    jp      .return

.loadExplosionFrame_1:
    ld      a, EXPLOSION_SPR_PAT_1_NUMBER
    ld      (Enemy_Temp_Pattern_0), a
    ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ld      (Enemy_Temp_Pattern_1), a

    ; ; load explosion colors (first sprite)
    ; ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ; ld      a, 0000 0001 b
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      hl, SpriteColors_Explosion_Frames_0_to_2 + 16
    ; ; 16x OUTI
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi 

    ; ; load explosion colors (second sprite)
    ; ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ; ld      bc, 16
    ; add     hl, bc
    ; ld      a, 0000 0001 b
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      hl, SpriteColors_Explosion_Frames_0_to_2 + 16
    ; ; 16x OUTI
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi 

    jp      .return

.loadExplosionFrame_2:
    ld      a, EXPLOSION_SPR_PAT_2_NUMBER
    ld      (Enemy_Temp_Pattern_0), a
    ld      a, EXPLOSION_SPR_PAT_1_NUMBER
    ld      (Enemy_Temp_Pattern_1), a

    ; ; load explosion colors (first sprite)
    ; ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ; ; ld      a, (Enemy_Temp_SPRCOL_Addr)         ; low byte
    ; ; ld      l, a
    ; ; ld      a, (Enemy_Temp_SPRCOL_Addr + 1)     ; high byte
    ; ; ld      h, a
    ; ld      a, 0000 0001 b
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      hl, SpriteColors_Explosion_Frames_0_to_2 + 32
    ; ; 16x OUTI
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi 

    jp      .return

.loadExplosionFrame_3:
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (Enemy_Temp_Pattern_0), a
    ld      a, EXPLOSION_SPR_PAT_2_NUMBER
    ld      (Enemy_Temp_Pattern_1), a

    ; ; load explosion colors (first sprite)
    ; ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ; ; ld      a, (Enemy_Temp_SPRCOL_Addr)         ; low byte
    ; ; ld      l, a
    ; ; ld      a, (Enemy_Temp_SPRCOL_Addr + 1)     ; high byte
    ; ; ld      h, a
    ; ld      a, 0000 0001 b
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      hl, SpriteColors_Explosion_Frames_0_to_2 + 32
    ; ; 16x OUTI
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi 

    jp      .return

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
        call    StartExplosionAnimation

        ret

; Inputs:
;   BC: X and Y of enemy
;   DE: X and Y of player plane
CheckCol_Enemy_PlayerPlane:
        ;ld      a, (Player_Status)    ; Status
        ;or      a
        ;ret     z                  ; if (Player status == 0) skip Check Col.

        call    CheckCollision_16x16_16x16
        jp      c, .collision
        ret
        ;     .skipCheckColShot_0:
        ;         ret
    .collision:
        ; ld      b, 30       ; 1/2 second
        ; call    Wait_B_Vblanks

        ld      hl, Enemy_Temp_Struct
        call    StartExplosionAnimation

        ret


StartExplosionAnimation:
    ld      a, 2
    ld      (hl), a                         ; status

    inc     hl
    ld      a, (hl)                         ; x
    sub     a, 6
    ld      b, a
    ld      (hl), a

    inc     hl
    ld      a, (hl)                         ; Y
    sub     a, 6
    ld      c, a
    ld      (hl), a

    inc     hl
    inc     hl
    ; ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ; ld      (hl), a                         ; pattern 0

    inc     hl
    ; ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ; ld      (hl), a                         ; pattern 1

    inc     hl
    inc     hl
    inc     hl
    inc     hl
    inc     hl
    ld      a, b
    add     a, 12
    ld      (hl), a                         ; X1
    
    inc     hl
    ld      a, c
    add     a, 12
    ld      (hl), a                         ; Y1

    ret
