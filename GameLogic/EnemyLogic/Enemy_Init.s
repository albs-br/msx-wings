; Input
;   DE: addr of level data struct
Enemy_Init:
    ; init Enemy / load some data from Level Data Struct to Enemy Struct

    ; Copy Level Data struct to temp Level Data struct
    ex      de, hl                                          ; HL receives addr of level data struct
    ;ld      hl, ?                                          ; source
    ld      de, LevelData_Temp_Struct                       ; destiny
    ld      bc, LevelData_Temp_Struct.size                  ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ; Copy Enemy struct to temp Enemy struct
    ld      hl, (LevelData_Temp_EnemyStruct_Addr)           ; source
    ld      de, Enemy_Temp_Struct                           ; destiny
    ld      bc, Enemy_Temp_Struct.size                      ; size
    ldir                                                    ; Copy BC bytes from HL to DE


    IFDEF DEBUG
        ; debug trap (get if an enemy is being initialized before its lifecycle ends)
        ld      a, (Enemy_Temp_Status)      ; get Status
        cp      1
    .debugTrap:
        jp      z, .debugTrap
    ENDIF    




    ld      hl, (LevelData_Temp_SPRCOL_Addr)
    ld      (Enemy_Temp_SPRCOL_Addr), hl


    ; ; Load enemy colors
    ; ld      a, 0000 0001 b
    ; ld      hl, (Enemy_Temp_SPRCOL_Addr)
    ; call    SetVdp_Write
    ; ;ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ; ld      hl, SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1
    ; ;ld      hl, SpriteColors_EnemyPlane_Frame_1_Patterns_0_and_1
    ; ; 32x OUTI
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ld      a, 1
    ld      (Enemy_Temp_Status), a     ; Status

    ld      hl, 0
    ld      (Enemy_Temp_Frame_Counter), hl      ; reset frame counter

    ; get initial X coord from level data struct
    ld      a, (LevelData_Temp_Initial_X)
    ld      (Enemy_Temp_X), a

    ; this now comes from enemy data
    ; ;add     1          ; X offset for sprite 1
    ; ld      (Enemy_Temp_X1), a            ; X1

    ld      a, (Screen_Y_Origin)
    ld      (Enemy_Temp_Y), a

    ; this now comes from enemy data
    ; add     8           ; Y offset for sprite 1
    ; ;add     4           ; Y offset for sprite 1
    ; ld      (Enemy_Temp_Y1), a            ; Y1

    xor     a
    ld      (Enemy_Temp_Y_Static), a      ; Y static

    ; this now comes from enemy data
    ; ld      a, ENEMY_FRAME_0_SPR_PAT_0_NUMBER
    ; ;ld      a, ENEMY_1_SPR_PAT_0_NUMBER
    ; ld      (Enemy_Temp_Pattern_0), a     ; Pattern 0

    ; add     4
    ; ;ld      a, ENEMY_0_SPR_PAT_1_NUMBER
    ; ;ld      a, ENEMY_1_SPR_PAT_1_NUMBER
    ; ld      (Enemy_Temp_Pattern_1), a     ; Pattern 1


    ; get  Enemy Data Initial Addr from level data struct
    ld      hl, (LevelData_Temp_Data_Initial_Addr)
    ld      (Enemy_Temp_Data_Current_Addr), hl           ; Enemy data addr


    ;call    LoadDataFromEnemyData


    ; ; Delta Y data is always n bytes after Delta X data. n = EnemyDeltaX_size
    ; ld      bc, EnemyDeltaX_size
    ; add     hl, bc
    ; ld      (Enemy_Temp_Delta_Y_Current_Addr), hl           ; Delta Y addr







.return:

    ld      hl, Enemy_Temp_Struct                               ; source
    ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, Enemy_Temp_Struct.size                          ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret
