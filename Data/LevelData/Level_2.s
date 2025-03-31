
Level_2_Data:

.Enemy_Wave_1: equ 0

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_1 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_1 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_1 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_1 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_1 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_1 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct   db ITEM_P
    ; test debug trap    
    ; dw  33      db  ENEMY_TYPE_1,           32    dw  EnemyData_1     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_2: equ 200

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_2 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_2 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_2 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_2 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_7     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_2 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_7     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_2 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_7     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_2 + 23      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 24      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 25      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 26      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 27      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 28      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 29      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_3: equ 400

    dw  .Enemy_Wave_3 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_8     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_3 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_8     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_3 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_8     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_3 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_8     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_3 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_8     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_3 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_8     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_3 + 23      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 24      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 25      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 26      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 27      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 28      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 29      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_4: equ 600

    dw  .Enemy_Wave_4 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_4 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_4 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_4 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_8     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_4 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_8     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_4 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_8     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_4 + 23      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 24      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 25      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 26      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 27      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 28      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 29      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0




    ;dw 3326 ; last LevelCounter for Level 2 BG

    ; end marking of level data
    dw  0

.size: equ $ - Level_2_Data ; 0X????   (? kb)
