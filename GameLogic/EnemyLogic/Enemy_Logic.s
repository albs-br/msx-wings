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



        ; if enemy data ends, then the enemy life cycle ends
        ld      hl, (Enemy_Temp_Frame_Counter)
        ld      de, EnemyDeltaX_size
        call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
        jp      nc, .enemyReset             ; if (HL >= DE) enemyReset


        ld      a, (Enemy_Temp_Status)      ; get Status
        cp      1
        jp      nz, .doExplosionAnimation   ; if (Status != 1) doExplosionAnimation


        ; --------------------------- load data from enemy data -------------------------

        call    LoadDataFromEnemyData


        ; --------------------------- enemy movement -------------------------

        ; Delta Y
        ; (Delta Y data is always n bytes after Delta X data. n = EnemyDeltaX_size)
        ld      hl, (Enemy_Temp_Data_Current_Addr)
        ld      bc, EnemyDeltaX_size
        add     hl, bc

        ;ld      hl, (Enemy_Temp_Delta_Y_Current_Addr)                 ; Delta Y
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

        ; inc     hl                          ; next Enemy Data addr
        ; ld      (Enemy_Temp_Data_Current_Addr), hl



        ; Delta X
        ld      hl, (Enemy_Temp_Data_Current_Addr)                 ; Delta X
        
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



        ; inc     hl                      ; next Delta X addr
        ; ld      (Enemy_Temp_Delta_X_Current_Addr), hl
        inc     hl                          ; next Enemy Data addr
        ld      (Enemy_Temp_Data_Current_Addr), hl
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
        ; increment Frame Counter
        ld      hl, (Enemy_Temp_Frame_Counter)
        inc     hl
        ld      (Enemy_Temp_Frame_Counter), hl

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



LoadDataFromEnemyData:

    ; ------------------------- patterns ------------------------

    ld      hl, (Enemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ld      bc, EnemyDeltaX_size + EnemyDeltaY_size     ; set HL to current patternNumber
    add     hl, bc

    ld      a, (hl)
    or      a
    ret     z                               ; if (patternNumber == 0) keep previous pattern, offsets and SPRCOL addr

    ld      (Enemy_Temp_Pattern_0), a       ; Pattern 0

    add     4
    ld      (Enemy_Temp_Pattern_1), a       ; Pattern 1

    ; ------------------------- x1 ------------------------

    ld      hl, (Enemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ld      bc, EnemyDeltaX_size + EnemyDeltaY_size + EnemyPatternNumber_size     ; set HL to current offset x1
    add     hl, bc

    ld      a, (Enemy_Temp_X)
    ld      b, (hl)                     ; offset x1
    add     b
    ld      (Enemy_Temp_X1), a          ; 

    ; ------------------------- y1 ------------------------

    ld      hl, (Enemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ld      bc, EnemyDeltaX_size + EnemyDeltaY_size + EnemyPatternNumber_size + EnemyOffset_x1_size     ; set HL to current offset y1
    add     hl, bc

    ld      a, (Enemy_Temp_Y)
    ld      b, (hl)                     ; offset y1
    add     b
    ld      (Enemy_Temp_Y1), a          ; 

    ; -------------------------- colors -----------------------

    ld      hl, (Enemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ld      bc, EnemyDeltaX_size + EnemyDeltaY_size + EnemyPatternNumber_size + EnemyOffset_x1_size + EnemyOffset_y1_size    ; set HL to current offset y1
    add     hl, bc

    ld      bc, (Enemy_Temp_Frame_Counter)              ; this is to duplicate the advance (this data is word, the others are byte)
    ;dec     bc                                          ; adjust because frame counter is inc before this routine is called
    add     hl, bc

    push    hl
        ; Load enemy colors
        ld      a, 0000 0001 b
        ld      hl, (Enemy_Temp_SPRCOL_Addr)
        call    SetVdp_Write
        ;ld      b, SpriteColors_EnemyPlane_0_and_1.size
        ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    pop     hl
    ;ld      hl, testcolors
    ;ld      hl, EnemyData_5 + (128 * 5)
    ld      a, (hl)
    inc     hl
    ld      h, (hl)
    ld      l, a
    ;ld      hl, SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1
    ;ld      hl, SpriteColors_EnemyPlane_Frame_1_Patterns_0_and_1
    ; 32x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi     

    ; ; Load enemy colors
    ; ld      a, 0000 0001 b
    ; ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ; call    SetVdp_Write
    ; ;ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ; ld      hl, testcolors
    ; ; ld      hl, SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1
    ; ;ld      hl, SpriteColors_EnemyPlane_Frame_1_Patterns_0_and_1
    ; ; 32x OUTI
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


    ret

; testcolors: 
;     db 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08
;     db 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08