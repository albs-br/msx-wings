; Input
;   DE: addr of level data struct
EnemyShot_Init:

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

    
    
    ; Enemy shot initialization

    ; Load enemy colors
    ld      a, 0000 0001 b
    ld      hl, (LevelData_Temp_SPRCOL_Addr)
    call    SetVdp_Write
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyShot_0_to_2
    ; 16x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


    ld      a, 1
    ld      (EnemyShot_Temp_Status), a      ; Status



    ; get, from addr on Level Data, the enemy that is supposed to fire this shot
    ld      hl, (LevelData_Temp_EnemyStruct_Addr)
    
    ; if enemy is dead return
    ld      a, (hl)
    or      a
    jp      z, .return
    
    ; get X and Y initial coords from enemy 
    inc     hl
    ld      a, (hl)
    ld      (EnemyShot_Temp_X), a                ; X

    inc     hl
    ld      a, (hl)
    ld      (EnemyShot_Temp_Y), a                ; Y

    inc     hl
    ld      a, (hl)
    ld      (EnemyShot_Temp_Y_Static), a         ; Y static

    ld      a, ENEMY_SHOT_SPR_PAT_0_NUMBER
    ld      (EnemyShot_Temp_Pattern), a          ; Pattern

    ; TODO:
    ; EnemyShot_Temp_Delta_X_Current_Addr:    rw 1
    ; EnemyShot_Temp_Delta_Y_Current_Addr:    rw 1

.return:

    ld      hl, EnemyShot_Temp_Struct                           ; source
    ld      de, (LevelData_Temp_EnemyShotStruct_Addr)           ; destiny
    ld      bc, EnemyShot_Temp_Struct.size                      ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret



; Input
;   HL: addr of enemy shot struct
EnemyShot_Reset:
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
    ld      (hl), a     ; Pattern

    ; inc     hl
    ; ld      a, EMPTY_SPR_PAT_NUMBER
    ; ld      (hl), a     ; Pattern 1

    ret



; Input
;   HL: addr of enemy shot struct
EnemyShot_Logic:

    push    hl

        ; Copy enemy shot struct to temp enemy shot struct
        ;ld      hl, ?                                          ; source
        ld      de, EnemyShot_Temp_Struct                       ; destiny
        ld      bc, EnemyShot_Temp_Struct.size                  ; size
        ldir                                                    ; Copy BC bytes from HL to DE


; magic here


.return:
        ld      hl, EnemyShot_Temp_Struct                       ; source
    pop     de                                                  ; destiny
    ld      bc, EnemyShot_Temp_Struct.size                      ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret