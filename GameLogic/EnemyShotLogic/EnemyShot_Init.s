; Input
;   DE: addr of level data struct
EnemyShot_Init:

    ; if (Player_BombActive) return;
    ld      a, (Player_BombActive)
    or      a
    ret     nz


    ; init Enemy Shot / load some data from Level Data Struct to Enemy Shot Struct

    ; Copy Level Data struct to temp Level Data struct
    ex      de, hl                                          ; HL receives addr of level data struct
    ;ld      hl, ?                                          ; source
    ld      de, LevelData_Temp_Struct                       ; destiny
    ld      bc, LevelData_Temp_Struct.size                  ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ; Copy Enemy Shot struct to temp Enemy Shot struct
    ld      hl, (LevelData_Temp_EnemyShotStruct_Addr)       ; source
    ld      de, EnemyShot_Temp_Struct                       ; destiny
    ld      bc, EnemyShot_Temp_Struct.size                  ; size
    ldir                                                    ; Copy BC bytes from HL to DE



    IFDEF DEBUG
        ; debug trap (get if an enemy shot is being initialized before its lifecycle ends)
        ld      a, (EnemyShot_Temp_Status)      ; get Status
        cp      1
    .debugTrap:
        ;jp      z, .debugTrap
        ld      hl, STRING_DEBUG_ENEMY_SHOT_INIT_ERROR
        JP      z, DebugMessage
    ENDIF    



    
    ; Enemy shot initialization

    ; get, from addr on Level Data, the enemy that is supposed to fire this shot
    ld      hl, (LevelData_Temp_EnemyStruct_Addr)
    
    ; if enemy is dead return
    ld      a, (hl)
    or      a
    jp      z, .return

    ; if enemy is turned into item return
    cp      255
    jp      z, .return
    
    ld      a, 1
    ld      (EnemyShot_Temp_Status), a          ; Status

    ; get X and Y initial coords from enemy 
    inc     hl
    ld      a, (hl)
    add     8
    ; if is Big enemy, add 8 to X
    ld      b, a
    ld      a, (EnemyMode)
    cp      ENEMY_MODE_BIG_ENEMIES
    ld      a, b
    jp      nz, .cont_2
    add     8
.cont_2:
    ld      (EnemyShot_Temp_X), a                ; X

    ; TODO:
    ; fix bug, when shot come from Ground target, ignore EnemyMode


    inc     hl
    ld      a, (hl)
    add     8
    ; if is Big enemy, add 16 to Y
    ld      b, a
    ld      a, (EnemyMode)
    cp      ENEMY_MODE_BIG_ENEMIES
    ld      a, b
    jp      nz, .cont_1
    add     16
.cont_1:
    ld      (EnemyShot_Temp_Y), a                ; Y

    inc     hl
    ld      a, (hl)
    add     8
    ld      (EnemyShot_Temp_Y_Static), a         ; Y static

    ld      a, ENEMY_SHOT_SPR_PAT_0_NUMBER
    ld      (EnemyShot_Temp_Pattern), a          ; Pattern

    ld      hl, (LevelData_Temp_Data_Initial_Addr)
    ld      (EnemyShot_Temp_Delta_X_Current_Addr), hl           ; Delta X addr

    ; Delta Y data is always n bytes after Delta X data. n = EnemyShotDeltaX_size
    ld      bc, EnemyShotDeltaX_size
    add     hl, bc
    ld      (EnemyShot_Temp_Delta_Y_Current_Addr), hl           ; Delta Y addr

    ld      hl, (LevelData_Temp_SPRCOL_Addr)
    ld      (EnemyShot_Temp_SPRCOL_Addr), hl                    ; SPRCOL addr



    ; Load enemy colors
    ld      a, 0000 0001 b
    ld      hl, (EnemyShot_Temp_SPRCOL_Addr)
    call    SetVdp_Write
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyShot_0_to_2
    ; 16x OUTI
    call    OUTI_x16
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


.return:

    ld      hl, EnemyShot_Temp_Struct                           ; source
    ld      de, (LevelData_Temp_EnemyShotStruct_Addr)           ; destiny
    ld      bc, EnemyShot_Temp_Struct.size                      ; size
    ldir                                                        ; Copy BC bytes from HL to DE



    ; TODO: use specific sfx for enemy shots
    ;ld      a, 100           ; volume
    ld      a, SFX_SHOT     ; number of sfx in the bank
    ld      c, 15            ; sound priority
    call    PlaySfx



    ret
