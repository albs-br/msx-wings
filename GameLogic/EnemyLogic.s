ENEMY_PIXELS_PER_MOV:    equ 3


; Input
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
        
        ; HL = EnemyStruct_Addr
        ld      a, (de)
        ld      l, a
        inc     de
        ld      a, (de)
        ld      h, a

        inc     de

        ; BC = SPRCOL_Addr
        ld      a, (de)
        ld      c, a
        inc     de
        ld      a, (de)
        ld      b, a

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
        ld      ixh, a
        ld      (hl), a     ; X

        inc     hl
        ld      a, (Screen_Y_Origin)
        ld      ixl, a
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

    inc     hl
    ld      a, ixh
    ld      (hl), a     ; X1

    inc     hl
    ld      a, ixl
    ld      (hl), a     ; Y1

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

    ; TODO: should other fields be reset too?

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

        cp      1
        jp      nz, .doExplosionAnimation   ; if (Status != 1) doExplosionAnimation


        ; --------------------------- enemy movement -------------------------

        ld      a, (Enemy_Temp_Y_Static)    ; Y static
        cp      192
        jp      nc, .enemyReset             ; if (Y >= 192) enemyReset
        add     ENEMY_PIXELS_PER_MOV
        ld      (Enemy_Temp_Y_Static), a


        ld      a, (Enemy_Temp_Y)           ; Y
        add     ENEMY_PIXELS_PER_MOV
        ld      (Enemy_Temp_Y), a
        ld      a, (Enemy_Temp_Y1)          ; Y1
        add     ENEMY_PIXELS_PER_MOV
        ld      (Enemy_Temp_Y1), a



        ; Delta X
        ld      hl, (Enemy_Temp_Delta_X_Current_Addr)                 ; Delta X
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
        ;inc     hl
        ld      (Enemy_Temp_Delta_X_Current_Addr), hl
    .ignoreDeltaX:

        ; --------------------------- check collision  -------------------------

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
    jp      z, .loadExplosionFrame_0    ; animation counter between 3 and 7
    cp      9
    jp      z, .loadExplosionFrame_1    ; animation counter between 8 and 11
    cp      15
    jp      z, .loadExplosionFrame_2    ; animation counter between 12 and 15
    jp      .return

.loadExplosionFrame_0:
    ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ld      (Enemy_Temp_Pattern_0), a
    ;ld      a, EXPLOSION_SPR_PAT_0_NUMBER
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
    ;ld      a, EXPLOSION_SPR_PAT_1_NUMBER
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
    ;ld      a, EXPLOSION_SPR_PAT_2_NUMBER
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

        ;call    Enemy_Reset

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