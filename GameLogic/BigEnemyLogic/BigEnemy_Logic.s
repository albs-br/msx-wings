; Input
;   HL: addr of big enemy struct
BigEnemy_Logic:

    ; check status before copying to temp vars to save cycles when disabled
    ld      a, (hl)         ; get Status
    or      a
    ret     z               ; if (Status == 0) ret

    ; set MegaROM page for Enemy data
    ld      a, ENEMY_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    push    hl

        ; Copy big enemy struct to temp big enemy struct
        ;ld      hl, ?                                          ; source
        ld      de, BigEnemy_Temp_Struct                           ; destiny
        ld      bc, BigEnemy_Temp_Struct.size                      ; size
        ldir                                                    ; Copy BC bytes from HL to DE



        ; if big enemy data ends, then the big enemy life cycle ends
        ld      hl, (BigEnemy_Temp_Frame_Counter)
        ld      de, BigEnemyDeltaX_size
        call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
        jp      nc, .bigEnemyReset             ; if (HL >= DE) bigEnemyReset


        ld      a, (BigEnemy_Temp_Status)      ; get Status
        cp      1
        jp      nz, .doExplosionAnimation   ; if (Status != 1) doExplosionAnimation


        ; --------------------------- load data from big enemy data -------------------------

        ; call    BigEnemy_LoadDataFromEnemyData


        ; --------------------------- big enemy movement -------------------------

        ; Delta Y
        ; (Delta Y data is always n bytes after Delta X data. n = BigEnemyDeltaX_size)
        ld      hl, (BigEnemy_Temp_Data_Current_Addr)
        ld      bc, BigEnemyDeltaX_size
        add     hl, bc

        ;ld      hl, (Enemy_Temp_Delta_Y_Current_Addr)                 ; Delta Y
        ld      b, (hl)                     ; get delta Y value

        ld      a, (BigEnemy_Temp_Y_Static)    ; Y static
        cp      224 ; = -32
        jp      nc, .isOffScreen               ; if (Y_Static >= -32) isOffScreen
        cp      192
        jp      nc, .bigEnemyReset             ; if (Y_Static >= 192) enemyReset
.isOffScreen:
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y_Static), a

        ; TODO: test if Y is bellow 0? (Delta Y may be negative)


        ld      a, (BigEnemy_Temp_Y)        ; Y
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y), a
        
        ld      a, (BigEnemy_Temp_Y1)       ; Y1
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y1), a
        
        ld      a, (BigEnemy_Temp_Y2)       ; Y2
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y2), a
        
        ld      a, (BigEnemy_Temp_Y3)       ; Y3
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y3), a
        
        ld      a, (BigEnemy_Temp_Y4)       ; Y4
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y4), a
        
        ld      a, (BigEnemy_Temp_Y5)       ; Y5
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y5), a
        
        ld      a, (BigEnemy_Temp_Y6)       ; Y6
        add     a, b                        ; add to delta Y
        ld      (BigEnemy_Temp_Y6), a

        ; inc     hl                          ; next Enemy Data addr
        ; ld      (Enemy_Temp_Data_Current_Addr), hl



        ; Delta X
        ld      hl, (BigEnemy_Temp_Data_Current_Addr)                 ; Delta X
        
        ; TODO: this probably is not necessary anymore (Delta X now is a mandatory field)
        ld      a, l
        or      h                       ; if (Delta X addr == 0)
        jp      z, .ignoreDeltaX
        
        ld      b, (hl)                 ; get delta X value
        ld      a, (BigEnemy_Temp_X)    ; get current X value
        add     a, b                    ; add to delta X
        ; test if sides of screen were reached
        cp      3
        jp      c, .bigEnemyReset          ; if (X < 3) bigEnemyReset
        cp      254
        jp      nc, .bigEnemyReset         ; if (X >= 254) bigEnemyReset
        ld      (BigEnemy_Temp_X), a       ; save X

        ld      a, (BigEnemy_Temp_X1)   ; get current X1 value
        add     a, b                    ; add to delta X
        ld      (BigEnemy_Temp_X1), a   ; save
        
        ld      a, (BigEnemy_Temp_X2)   ; get current X2 value
        add     a, b                    ; add to delta X
        ld      (BigEnemy_Temp_X2), a   ; save
        
        ld      a, (BigEnemy_Temp_X3)   ; get current X3 value
        add     a, b                    ; add to delta X
        ld      (BigEnemy_Temp_X3), a   ; save
        
        ld      a, (BigEnemy_Temp_X4)   ; get current X4 value
        add     a, b                    ; add to delta X
        ld      (BigEnemy_Temp_X4), a   ; save
        
        ld      a, (BigEnemy_Temp_X5)   ; get current X5 value
        add     a, b                    ; add to delta X
        ld      (BigEnemy_Temp_X5), a   ; save
        
        ld      a, (BigEnemy_Temp_X6)   ; get current X6 value
        add     a, b                    ; add to delta X
        ld      (BigEnemy_Temp_X6), a   ; save


        ; inc     hl                      ; next Delta X addr
        ; ld      (Enemy_Temp_Delta_X_Current_Addr), hl
        inc     hl                          ; next Enemy Data addr
        ld      (BigEnemy_Temp_Data_Current_Addr), hl
    .ignoreDeltaX:

        ; --------------------------- check collision (big enemy x player shots) -------------------------

        ld      a, (BigEnemy_Temp_X)
        ld      b, a
        ld      a, (BigEnemy_Temp_Y_Static)
        ld      c, a

        push    bc
                ; check col. between current enemy and shot 0
                ld      hl, PlayerShot_0_Struct
                call    CheckCol_BigEnemy_PlayerShot
        pop     bc
        push    bc
                ; check col. between current enemy and shot 1
                ld      hl, PlayerShot_1_Struct
                call    CheckCol_BigEnemy_PlayerShot
        pop     bc
        push    bc
                ; check col. between current enemy and shot 2
                ld      hl, PlayerShot_2_Struct
                call    CheckCol_BigEnemy_PlayerShot
        pop     bc
        ; push    bc
        ;         ; check col. between current enemy an1d shot 3
        ;         ld      hl, PlayerShot_3_Struct
        ;         call    CheckCol_Enemy_PlayerShot
        ; pop     bc
        ; push    bc
        ;         ; check col. between current enemy and shot 4
        ;         ld      hl, PlayerShot_4_Struct
        ;         call    CheckCol_Enemy_PlayerShot
        ; pop     bc
        ; push    bc
        ;         ; check col. between current enemy and shot 5
        ;         ld      hl, PlayerShot_5_Struct
        ;         call    CheckCol_Enemy_PlayerShot
        ; pop     bc

        ; --------------------------- check collision (enemy x player plane) -------------------------

        ; ld      a, (Enemy_Temp_X)
        ; ld      b, a
        ; ld      a, (Enemy_Temp_Y_Static)
        ; ld      c, a

        ; if (Player_Status != 1) return
        ld      a, (Player_Status)
        cp      1
        jp      nz, .return


        ; check col. between current big enemy and plane
        ld      a, (Player_X)
        add     2                           ; adjust the 16x16 collision box to the center of the plane
        ld      d, a
        ld      a, (Player_Y_Static)
        add     12                          ; adjust the 16x16 collision box to the body of the plane
        ld      e, a
        call    CheckCol_BigEnemy_PlayerPlane



        jp      .return

    .bigEnemyReset:
        ld      hl, BigEnemy_Temp_Struct
        call    BigEnemy_Reset
        jp      .return
    

.return:
        ; increment Frame Counter
        ld      hl, (BigEnemy_Temp_Frame_Counter)
        inc     hl
        ld      (BigEnemy_Temp_Frame_Counter), hl

        ld      hl, BigEnemy_Temp_Struct                    ; source
    pop     de                                              ; destiny
    ld      bc, BigEnemy_Temp_Struct.size                   ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ret


.doExplosionAnimation:

    ld      a, (BigEnemy_Temp_Status)      ; get Status
    inc     a
    ld      (BigEnemy_Temp_Status), a
    cp      20
    ld      hl, BigEnemy_Temp_Struct
    call    z, BigEnemy_Reset


    ld      a, (BigEnemy_Temp_Status)      ; get Status
    cp      3 ; first frame of explosion (don't change it)
    jp      z, .loadExplosionFrame_0
    cp      7
    jp      z, .loadExplosionFrame_1
    cp      11
    jp      z, .loadExplosionFrame_2
    cp      15
    jp      z, .loadExplosionFrame_3
    jp      .return

; .doBigEnemy_Reset:
;     ; ; check if this enemy should become an item after dead
;     ; ; if (Enemy_Temp_ItemStruct_Addr != 0) Status = 255
;     ; ;push    hl
;     ;     ld      hl, (Enemy_Temp_ItemStruct_Addr)
;     ;     ld      a, l
;     ;     or      h
;     ; ;pop     hl
;     ; jp      nz, .doInitItem

;     ld      hl, BigEnemy_Temp_Struct
;     call    BigEnemy_Reset
;     ret

; .doInitItem:
; ;jp .doInitItem ; debug

;     ld      hl, (Enemy_Temp_ItemStruct_Addr)
;     ld      de, Enemy_Temp_Struct
;     call    Item_Init

;     ; ld      hl, Enemy_Temp_Struct
;     ; call    z, Enemy_Reset

;     ld      a, 255
;     ld      (Enemy_Temp_Status), a
        
;     ret

.loadExplosionFrame_0:
    ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ld      (BigEnemy_Temp_Pattern_0), a
    ld      (BigEnemy_Temp_Pattern_1), a
    ld      (BigEnemy_Temp_Pattern_2), a

    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (BigEnemy_Temp_Pattern_3), a
    ld      (BigEnemy_Temp_Pattern_4), a
    ld      (BigEnemy_Temp_Pattern_5), a
    ld      (BigEnemy_Temp_Pattern_6), a
    ; TODO: use the remaining sprites to make a bigger explosion
    
    ; ; load explosion colors (first sprite)
    ; ld      hl, (BigEnemy_Temp_SPRCOL_Addr)
    ; ld      a, 0000 0001 b
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      hl, SpriteColors_Explosion_Frames_0_to_2
    ; ; 16x OUTI
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi 

    ; ; load explosion colors (second sprite)
    ; ld      hl, (BigEnemy_Temp_SPRCOL_Addr)
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

    ; load explosion colors
    ld      hl, (BigEnemy_Temp_SPRCOL_Addr)
    ld      a, 0000 0001 b
    call    SetVdp_Write
    ld      c, PORT_0

    ld      a, 8 ; color yellow
    ld      b, 16
.loop_1001:
    nop
    out     (c), a
    djnz    .loop_1001

    ld      a, 12 ; color light orange
    ld      b, 16
.loop_1002:
    nop
    out     (c), a
    djnz    .loop_1002

    ld      a, 4 ; color dark orange
    ld      b, 16 + (4 * 16)
.loop_1003:
    nop
    out     (c), a
    djnz    .loop_1003

    jp      .return

.loadExplosionFrame_1:
    ld      a, EXPLOSION_SPR_PAT_1_NUMBER
    ld      (BigEnemy_Temp_Pattern_0), a
    ld      (BigEnemy_Temp_Pattern_1), a
    ld      (BigEnemy_Temp_Pattern_2), a

    ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ld      (BigEnemy_Temp_Pattern_3), a
    ld      (BigEnemy_Temp_Pattern_4), a
    ld      (BigEnemy_Temp_Pattern_5), a
    ld      (BigEnemy_Temp_Pattern_6), a

    jp      .return

.loadExplosionFrame_2:
    ld      a, EXPLOSION_SPR_PAT_2_NUMBER
    ld      (BigEnemy_Temp_Pattern_0), a
    ld      (BigEnemy_Temp_Pattern_2), a

    ld      a, EXPLOSION_SPR_PAT_1_NUMBER
    ld      (BigEnemy_Temp_Pattern_3), a
    ld      (BigEnemy_Temp_Pattern_4), a
    ld      (BigEnemy_Temp_Pattern_5), a
    ld      (BigEnemy_Temp_Pattern_6), a

    jp      .return

.loadExplosionFrame_3:
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (BigEnemy_Temp_Pattern_0), a
    ld      (BigEnemy_Temp_Pattern_1), a
    ld      (BigEnemy_Temp_Pattern_2), a

    ld      a, EXPLOSION_SPR_PAT_2_NUMBER
    ld      (BigEnemy_Temp_Pattern_3), a
    ld      (BigEnemy_Temp_Pattern_4), a
    ld      (BigEnemy_Temp_Pattern_5), a
    ld      (BigEnemy_Temp_Pattern_6), a

 
    ; --- explosion sfx is played twice for Big Enemies
     ;ld      a, 200          ; volume
    ld      a, SFX_EXPLOSION    ; number of sfx in the bank
    ld      c, 1                ; sound priority
    call    PlaySfx


    jp      .return



; Inputs:
;   BC: X and Y static of big enemy
;   HL: PlayerShot struct addr
CheckCol_BigEnemy_PlayerShot:

    call    CheckCol_32x32_Object_PlayerShot
    ret     nc

;.collision:
    call    PlayerShot_Reset

    ;jp      BigEnemyGotHit ; not necessary (fall through)

BigEnemyGotHit:
    ld      a, 1
    ld      (BigEnemy_Temp_Hit), a ; set big enemy hit flag


    ld      a, (BigEnemy_Temp_Power)
    dec     a
    ld      (BigEnemy_Temp_Power), a
    jp      z, .enemyKilled

    ret

.enemyKilled:
    ld      hl, BigEnemy_Temp_Struct
    call    BigEnemy_StartExplosionAnimation

    ret



; Inputs:
;   BC: X and Y of enemy
;   DE: X and Y of player plane
CheckCol_BigEnemy_PlayerPlane:
    ;ld      a, (Player_Status)    ; Status
    ;or      a
    ;ret     z                  ; if (Player status == 0) skip Check Col.

    call    CheckCollision_32x32_16x16
    ret     nc

;.collision:
    ; ld      b, 30       ; 1/2 second
    ; call    Wait_B_Vblanks

    ; set player status to dead
    xor     a
    ld      (Player_Status), a


    jp      BigEnemyGotHit

    ; ld      hl, BigEnemy_Temp_Struct
    ; call    BigEnemy_StartExplosionAnimation

    ; ret


BigEnemy_StartExplosionAnimation:
    ld      a, 2
    ld      (hl), a                         ; status
    inc     hl

    ld      a, (hl)                         ; X
    ld      b, a                            ; register B = X
    add     4
    ld      (hl), a
    inc     hl

    ld      a, (hl)                         ; Y
    ld      c, a                            ; register C = Y
    add     4
    ld      (hl), a
    inc     hl

    ld      de, 5
    add     hl, de  ; skip 5 bytes (y static, BigEnemy_Temp_Data_Current_Addr and BigEnemy_Temp_SPRCOL_Addr)


    ld      a, b
    add     16
    ld      (hl), a                         ; X1
    inc     hl

    ld      a, c
    add     16
    ld      (hl), a                         ; Y1
    inc     hl


    ld      a, b
    ; add     16
    ld      (hl), a                         ; X2
    inc     hl

    ld      a, c
    add     20
    ld      (hl), a                         ; Y2
    inc     hl


    ld      a, b
    add     8
    ld      (hl), a                         ; X3
    inc     hl

    ld      a, c
    sub     8
    ld      (hl), a                         ; Y3
    inc     hl


    ld      a, b
    add     16
    ld      (hl), a                         ; X4
    inc     hl

    ld      a, c
    ; add     16
    ld      (hl), a                         ; Y4
    inc     hl


    ld      a, b
    sub     4
    ld      (hl), a                         ; X5
    inc     hl

    ld      a, c
    add     8
    ld      (hl), a                         ; Y5
    inc     hl


    ld      a, b
    add     24
    ld      (hl), a                         ; X6
    inc     hl

    ld      a, c
    add     4
    ld      (hl), a                         ; Y6
    inc     hl

    ; --- explosion sfx is played twice for Big Enemies
    ;ld      a, 200          ; volume
    ld      a, SFX_EXPLOSION    ; number of sfx in the bank
    ld      c, 1                ; sound priority
    call    PlaySfx

    ret



; BigEnemy_LoadDataFromEnemyData:


    ; sprite pattern for animations are controlled in UpdateBigEnemiesPatterns

    ; ; ------------------------- patterns ------------------------

    ; ld      hl, (BigEnemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ; ld      bc, EnemyDeltaX_size + EnemyDeltaY_size     ; set HL to current patternNumber
    ; add     hl, bc

    ; ld      a, (hl)
    ; or      a
    ; ret     z                               ; if (patternNumber == 0) keep previous pattern, offsets and SPRCOL addr

    ; ld      (Enemy_Temp_Pattern_0), a       ; Pattern 0

    ; add     4
    ; ld      (Enemy_Temp_Pattern_1), a       ; Pattern 1




    ; offsets for X1..X6 and Y1..Y6 are fixed for big enemies (loaded on Big Enemy Init)
    ; ; ------------------------- x1 ------------------------

    ; ld      hl, (BigEnemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ; ld      bc, EnemyDeltaX_size + EnemyDeltaY_size + EnemyPatternNumber_size     ; set HL to current offset x1
    ; add     hl, bc

    ; ld      a, (BigEnemy_Temp_X)
    ; ld      b, (hl)                     ; offset x1
    ; add     b
    ; ld      (BigEnemy_Temp_X1), a          ; 

    ; ; ------------------------- y1 ------------------------

    ; ld      hl, (BigEnemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ; ld      bc, EnemyDeltaX_size + EnemyDeltaY_size + EnemyPatternNumber_size + EnemyOffset_x1_size     ; set HL to current offset y1
    ; add     hl, bc

    ; ld      a, (BigEnemy_Temp_Y)
    ; ld      b, (hl)                     ; offset y1
    ; add     b
    ; ld      (BigEnemy_Temp_Y1), a          ; 

    ; ; -------------------------- colors -----------------------

    ; ld      hl, (Enemy_Temp_Data_Current_Addr)          ; Enemy data addr

    ; ld      bc, EnemyDeltaX_size + EnemyDeltaY_size + EnemyPatternNumber_size + EnemyOffset_x1_size + EnemyOffset_y1_size    ; set HL to current offset y1
    ; add     hl, bc

    ; ld      bc, (Enemy_Temp_Frame_Counter)              ; this is to duplicate the advance (this data is word, the others are byte)
    ; ;dec     bc                                          ; adjust because frame counter is inc before this routine is called
    ; add     hl, bc

    ; push    hl
    ;     ; Load enemy colors
    ;     ld      a, 0000 0001 b
    ;     ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ;     call    SetVdp_Write
    ;     ;ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ;     ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ; pop     hl
    ; ;ld      hl, testcolors
    ; ;ld      hl, EnemyData_5 + (128 * 5)
    ; ld      a, (hl)
    ; inc     hl
    ; ld      h, (hl)
    ; ld      l, a
    ; ;ld      hl, SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1
    ; ;ld      hl, SpriteColors_EnemyPlane_Frame_1_Patterns_0_and_1
    ; ; 32x OUTI
    ; call    OUTI_x32
    ; ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

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


    ; ret
