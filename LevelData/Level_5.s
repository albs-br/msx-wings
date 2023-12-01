Level_5_Data:
    ; TODO: level data in the same timing mark should work

;                                           Initial_X                                     EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |           |                       |         |                                   |                    |
    dw  10      db  BIG_ENEMY_TYPE_1,       32    dw  ChopperData_1                   dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw  42      db  BIG_ENEMY_TYPE_1,       128   dw  ChopperData_1                   dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0
    ; dw  11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    ; dw  12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    ; dw  20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_P        
    ; dw  21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_P
    ; dw  22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_P
    ; test debug trap    
    ; dw  33      db  ENEMY_TYPE_1,           32    dw  EnemyData_1     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0



    dw  90      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  91      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  92      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw 120      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw 121      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw 122      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw 123      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0




    ; end marking of level data
    dw  0
