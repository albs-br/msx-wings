; these are all planes turning

Level_4_Data:

.Enemy_Wave_1: equ 0

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_1 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_1 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_1 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_1 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_7     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_1 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_7     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_1 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_7     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_1 + 23      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_1 + 24      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_1 + 25      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_1 + 26      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_1 + 27      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_1 + 28      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_1 + 29      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; .Enemy_Wave_2: equ 150

    dw  110     db  ENEMY_TYPE_1,           32    dw  EnemyData_6     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0               db 0
    dw  111     db  ENEMY_TYPE_1,           64    dw  EnemyData_6     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_P
    dw  112     db  ENEMY_TYPE_1,           96    dw  EnemyData_6     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  120     db  ENEMY_TYPE_1,           128   dw  EnemyData_6     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  121     db  ENEMY_TYPE_1,           160   dw  EnemyData_6     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  122     db  ENEMY_TYPE_1,           192   dw  EnemyData_6     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  210     db  ENEMY_TYPE_1,           32    dw  EnemyData_8     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0               db 0
    dw  211     db  ENEMY_TYPE_1,           64    dw  EnemyData_8     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  212     db  ENEMY_TYPE_1,           96    dw  EnemyData_8     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  220     db  ENEMY_TYPE_1,           128   dw  EnemyData_8     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  221     db  ENEMY_TYPE_1,           160   dw  EnemyData_8     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  222     db  ENEMY_TYPE_1,           192   dw  EnemyData_8     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  310     db  ENEMY_TYPE_1,           32    dw  EnemyData_8     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0               db 0
    dw  311     db  ENEMY_TYPE_1,           64    dw  EnemyData_8     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  312     db  ENEMY_TYPE_1,           96    dw  EnemyData_8     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  320     db  ENEMY_TYPE_1,           128   dw  EnemyData_7     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  321     db  ENEMY_TYPE_1,           160   dw  EnemyData_7     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  322     db  ENEMY_TYPE_1,           192   dw  EnemyData_7     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0


    ; end marking of level data
    dw  0
