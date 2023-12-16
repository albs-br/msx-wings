; Input
;   DE: addr of level data struct
BigEnemy_Init:
    ; init Big Enemy / load some data from Level Data Struct to Big Enemy Struct


    ; EnemyMode = ENEMY_MODE_BIG_ENEMIES
    ld      a, ENEMY_MODE_BIG_ENEMIES
    ld      (EnemyMode), a



    ; Copy Level Data struct to temp Level Data struct
    ex      de, hl                                          ; HL receives addr of level data struct
    ;ld      hl, ?                                          ; source
    ld      de, LevelData_Temp_Struct                       ; destiny
    ld      bc, LevelData_Temp_Struct.size                  ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ; Copy Big Enemy struct to temp Big Enemy struct
    ld      hl, (LevelData_Temp_EnemyStruct_Addr)           ; source
    ld      de, BigEnemy_Temp_Struct                        ; destiny
    ld      bc, BigEnemy_Temp_Struct.size                   ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ; ; return if this enemy is now an item
    ; ; if (Enemy_Temp_Status == 255) ret     ; Status = 255 means that this enemy was turned into item
    ; ld      a, (Enemy_Temp_Status)      ; get Status
    ; cp      255
    ; ret     z


    ; set BigEnemy_Type = LevelData_Temp_ActionType
    ld      a, (LevelData_Temp_ActionType)
    ld      (BigEnemy_Type), a



    IFDEF DEBUG
        ; debug trap (get if an big enemy is being initialized before its lifecycle ends)
        ld      a, (BigEnemy_Temp_Status)      ; get Status
        cp      1
    .debugTrap:
        ld      hl, STRING_DEBUG_ENEMY_INIT_ERROR
        JP      z, DebugMessage
    ENDIF    




    ld      hl, (LevelData_Temp_SPRCOL_Addr)
    ld      (BigEnemy_Temp_SPRCOL_Addr), hl


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
    ld      (BigEnemy_Temp_Status), a           ; Status

    ld      hl, 0
    ld      (BigEnemy_Temp_Frame_Counter), hl   ; reset frame counter

    ld      a, 20                               ; initial big enemy energy level
    ld      (BigEnemy_Temp_Power), a

    xor     a
    ld      (BigEnemy_Temp_Hit), a


    ; ; get initial X coord from level data struct
    ; ld      a, (LevelData_Temp_Initial_X)
    ; ld      (Enemy_Temp_X), a

    ; get initial X coord from level data struct
;     ; if(LevelData_Temp_Initial_X == 255) setEnemyX_Equal_PlayerX
;     ld      a, (LevelData_Temp_Initial_X)
;     cp      255
;     jp      nz, .notSetEnemyX_Equal_PlayerX
;     ld      a, (Player_X)
; .notSetEnemyX_Equal_PlayerX:
;     ld      (BigEnemy_Temp_X), a

    ; get initial X coord from level data struct
    ld      a, (LevelData_Temp_Initial_X)
    ld      (BigEnemy_Temp_X), a

    ; this now comes from enemy data
    ; ;add     1          ; X offset for sprite 1
    ; ld      (Enemy_Temp_X1), a            ; X1

    ld      a, (Screen_Y_Origin)
    sub     32 ; -32 to start off screen
    ld      (BigEnemy_Temp_Y), a

    ; this now comes from enemy data
    ; add     8           ; Y offset for sprite 1
    ; ;add     4           ; Y offset for sprite 1
    ; ld      (Enemy_Temp_Y1), a            ; Y1

    ld      a, -32 ; -32 to start off screen
    ld      (BigEnemy_Temp_Y_Static), a      ; Y static

    ; switch (type of big enemy)
    ld      a, (LevelData_Temp_ActionType)
    cp      BIG_ENEMY_TYPE_TANK
    jp      z, .setBigEnemyType_Tank
    cp      BIG_ENEMY_TYPE_HOVERCRAFT
    jp      z, .setBigEnemyType_Hovercraft

; .setBigEnemyType_Chopper:
    ; ----- load all X and Y for Big enemy type Chopper
    ; load X1 .. X6
    ld      a, (BigEnemy_Temp_X)
    ld      (BigEnemy_Temp_X3), a
    ld      (BigEnemy_Temp_X4), a
    add     8 ; X1 offset
    ld      (BigEnemy_Temp_X1), a
    add     8 ; X2 offset
    ld      (BigEnemy_Temp_X2), a
    ld      (BigEnemy_Temp_X5), a
    ld      (BigEnemy_Temp_X6), a
    ; load Y1 .. Y6
    ld      a, (BigEnemy_Temp_Y)
    ld      (BigEnemy_Temp_Y1), a
    ld      (BigEnemy_Temp_Y2), a
    add     16
    ld      (BigEnemy_Temp_Y3), a
    ld      (BigEnemy_Temp_Y4), a
    ld      (BigEnemy_Temp_Y5), a
    ld      (BigEnemy_Temp_Y6), a
    jp      .continue_0

.setBigEnemyType_Tank:
    ; ----- load all X and Y for Big enemy type Tank
    ; load X1 .. X6
    ld      a, (BigEnemy_Temp_X)
    ld      (BigEnemy_Temp_X1), a
    add     16
    ld      (BigEnemy_Temp_X2), a
    ld      a, (BigEnemy_Temp_X)
    sub     7
    ld      (BigEnemy_Temp_X3), a
    ld      (BigEnemy_Temp_X4), a
    add     16
    ld      (BigEnemy_Temp_X5), a
    ld      (BigEnemy_Temp_X6), a
    ; load Y1 .. Y6
    ld      a, (BigEnemy_Temp_Y)
    ld      (BigEnemy_Temp_Y1), a
    ld      (BigEnemy_Temp_Y2), a
    add     16
    ld      (BigEnemy_Temp_Y3), a
    ld      (BigEnemy_Temp_Y4), a
    ld      (BigEnemy_Temp_Y5), a
    ld      (BigEnemy_Temp_Y6), a
    jp      .continue_0

.setBigEnemyType_Hovercraft:
    ; ----- load all X and Y for Big enemy type Hovercraft
    ; load X1 .. X6
    ld      a, (BigEnemy_Temp_X)
    ld      (BigEnemy_Temp_X1), a
    add     16
    ld      (BigEnemy_Temp_X2), a
    ld      (BigEnemy_Temp_X3), a
    ld      a, (BigEnemy_Temp_X)
    add     2
    ld      (BigEnemy_Temp_X4), a
    ld      (BigEnemy_Temp_X5), a
    add     16
    ld      (BigEnemy_Temp_X6), a
    ; load Y1 .. Y6
    ld      a, (BigEnemy_Temp_Y)
    ld      (BigEnemy_Temp_Y1), a
    ld      (BigEnemy_Temp_Y2), a
    ld      (BigEnemy_Temp_Y3), a
    add     16
    ld      (BigEnemy_Temp_Y4), a
    ld      (BigEnemy_Temp_Y5), a
    ld      (BigEnemy_Temp_Y6), a
    ; jp      .continue_0


.continue_0:
    
    ld      b, 4 ; add b is faster than add 4
    ld      a, BIG_ENEMY_SPR_PAT_0_NUMBER
    ld      (BigEnemy_Temp_Pattern_0), a
    add     b
    ld      (BigEnemy_Temp_Pattern_1), a
    add     b
    ld      (BigEnemy_Temp_Pattern_2), a
    add     b
    ld      (BigEnemy_Temp_Pattern_3), a
    add     b
    ld      (BigEnemy_Temp_Pattern_4), a
    add     b
    ld      (BigEnemy_Temp_Pattern_5), a
    add     b
    ld      (BigEnemy_Temp_Pattern_6), a


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
    ld      (BigEnemy_Temp_Data_Current_Addr), hl              ; Enemy data addr


    ; ld      hl, (LevelData_Temp_ExtraData_Addr)
    ; ld      (Enemy_Temp_ItemStruct_Addr), hl                ; Item data addr

    ; ld      a, (LevelData_Temp_Item_Type)
    ; ld      (Enemy_Temp_Item_Type), a                       ; Item type (Item P or Bomb)


    ;call    LoadDataFromEnemyData


    ; ; Delta Y data is always n bytes after Delta X data. n = EnemyDeltaX_size
    ; ld      bc, EnemyDeltaX_size
    ; add     hl, bc
    ; ld      (Enemy_Temp_Delta_Y_Current_Addr), hl           ; Delta Y addr







.return:

    ld      hl, BigEnemy_Temp_Struct                            ; source
    ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, BigEnemy_Temp_Struct.size                       ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret
