
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

    dw  .Enemy_Wave_2 + 23      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 24      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 25      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 26      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 27      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 28      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_2 + 29      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_3: equ 400

    dw  .Enemy_Wave_3 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_8     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_3 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_8     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_3 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_8     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_3 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_8     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_3 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_8     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_3 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_8     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_3 + 23      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 24      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 25      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 26      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 27      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 28      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_3 + 29      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_4: equ 600

    dw  .Enemy_Wave_4 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_4 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_4 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_4 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_8     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_4 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_8     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_4 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_8     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_4 + 23      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 24      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 25      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 26      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 27      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 28      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_4 + 29      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_5: equ 800

    dw  .Enemy_Wave_5  +  0     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_5  +  5     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  .Enemy_Wave_5  + 10     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_5  + 15     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0

    dw  .Enemy_Wave_5  + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_5  + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  .Enemy_Wave_5  + 30     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_5  + 35     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  .Enemy_Wave_5  + 40     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_5  + 45     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  .Enemy_Wave_5  + 50     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_5  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  .Enemy_Wave_5  + 60     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                       0, Item_6_Struct   db ITEM_P
    dw  .Enemy_Wave_5  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_6: equ 1000

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_6 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_6 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_6 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_6 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_7     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_6 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_7     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_6 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_7     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_6 + 23      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_6 + 24      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_6 + 25      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_6 + 26      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_6 + 27      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_6 + 28      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_6 + 29      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_7: equ 1200

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_7 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_7 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_7 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_7 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_7 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_7 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct   db ITEM_P

    dw  .Enemy_Wave_7 + 23      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_7 + 24      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_7 + 25      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_7 + 26      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_7 + 27      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_7 + 28      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_7 + 29      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_8: equ 1400

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_8 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_8 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_8 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_8 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_7     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_8 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_7     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_8 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_7     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_8 + 23      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_8 + 24      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_8 + 25      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_8 + 26      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_8 + 27      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_8 + 28      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_8 + 29      db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_9: equ 1600

    dw .Enemy_Wave_9 + 0        db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 1        db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 2        db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 3        db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 10       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 11       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 12       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw .Enemy_Wave_9 + 15       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw .Enemy_Wave_9 + 16       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw .Enemy_Wave_9 + 17       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw .Enemy_Wave_9 + 18       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw .Enemy_Wave_9 + 19       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw .Enemy_Wave_9 + 20       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw .Enemy_Wave_9 + 21       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_10: equ 1800

    dw  .Enemy_Wave_10 + 10     db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_10 + 11     db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_10 + 12     db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_10 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_8     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_10 + 21     db  ENEMY_TYPE_1,           160   dw  EnemyData_8     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_10 + 22     db  ENEMY_TYPE_1,           192   dw  EnemyData_8     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_10 + 23     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 24     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 26     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 27     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 28     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 29     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_11: equ 2000


    dw  .Enemy_Wave_11 + 0      db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_11 + 1      db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_11 + 2      db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_11 + 4      db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    
    dw  .Enemy_Wave_11 + 15     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_11 + 16     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_11 + 17     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_11 + 18     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  .Enemy_Wave_11 + 20     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_11 + 21     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_11 + 22     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    dw  .Enemy_Wave_11 + 23     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_11 + 24     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_11 + 25     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_12: equ 2200

;                                                   Initial_X                                     EnemyStruct_Addr
;       Counter     ActionType                      |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |           |                               |         |                                   |                    |
    dw  .Enemy_Wave_12 + 10     db  BIG_ENEMY_TYPE_HOVERCRAFT,     64     dw  TankData_0                    dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw  .Enemy_Wave_12 + 42     db  BIG_ENEMY_TYPE_HOVERCRAFT,    192     dw  TankData_0                    dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0

    dw  .Enemy_Wave_12 + 90     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 91     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 92     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw  .Enemy_Wave_12 + 120    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 121    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 122    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 123    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


    ; consecutive enemy shots need to be spaced 100 frames apart for the same EnemyShotStruct 
    dw  .Enemy_Wave_12 + 220    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 221    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 222    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw  .Enemy_Wave_12 + 223    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 224    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 225    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  .Enemy_Wave_12 + 226    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_13: equ 2500

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_13 + 10     db  ENEMY_TYPE_1,           32    dw  EnemyData_6     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_13 + 11     db  ENEMY_TYPE_1,           64    dw  EnemyData_6     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_13 + 12     db  ENEMY_TYPE_1,           96    dw  EnemyData_6     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_13 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_6     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_13 + 21     db  ENEMY_TYPE_1,           160   dw  EnemyData_6     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_13 + 22     db  ENEMY_TYPE_1,           192   dw  EnemyData_6     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_13 + 23     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_13 + 24     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_13 + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_13 + 26     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_13 + 27     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_13 + 28     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_13 + 29     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_14: equ 2700

    dw  .Enemy_Wave_14 + 10     db  ENEMY_TYPE_1,           32    dw  EnemyData_8     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_14 + 11     db  ENEMY_TYPE_1,           64    dw  EnemyData_8     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_14 + 12     db  ENEMY_TYPE_1,           96    dw  EnemyData_8     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_14 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_8     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_14 + 21     db  ENEMY_TYPE_1,           160   dw  EnemyData_8     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_14 + 22     db  ENEMY_TYPE_1,           192   dw  EnemyData_8     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_14 + 23     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 24     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 26     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 27     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 28     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 29     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_15: equ 2900

    dw  .Enemy_Wave_15 +  0     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_15 +  5     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  .Enemy_Wave_15 + 10     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_15 + 15     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0

    dw  .Enemy_Wave_15 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_15 + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  .Enemy_Wave_15 + 30     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_15 + 35     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  .Enemy_Wave_15 + 40     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_15 + 45     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  .Enemy_Wave_15 + 50     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_15 + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  .Enemy_Wave_15 + 60     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                       0, Item_6_Struct   db ITEM_P
    dw  .Enemy_Wave_15 + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_16: equ 3100

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_16 + 10     db  ENEMY_TYPE_1,           32    dw  EnemyData_7     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_16 + 11     db  ENEMY_TYPE_1,           64    dw  EnemyData_7     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_16 + 12     db  ENEMY_TYPE_1,           96    dw  EnemyData_7     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_16 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_7     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0               db 0        
    dw  .Enemy_Wave_16 + 21     db  ENEMY_TYPE_1,           160   dw  EnemyData_7     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0               db 0
    dw  .Enemy_Wave_16 + 22     db  ENEMY_TYPE_1,           192   dw  EnemyData_7     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0               db 0

    dw  .Enemy_Wave_16 + 23     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_16 + 24     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_16 + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_16 + 26     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_16 + 27     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_16 + 28     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_16 + 29     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0



    ; dw  .Enemy_Wave_12 + 320      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    ; dw  .Enemy_Wave_12 + 321      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    ; dw  .Enemy_Wave_12 + 322      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    ; dw  .Enemy_Wave_12 + 323      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    ; dw  .Enemy_Wave_12 + 324      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    ; dw  .Enemy_Wave_12 + 325      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    ; dw  .Enemy_Wave_12 + 326      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


    ;dw 3326 ; last LevelCounter for Level 2 BG

    ; end marking of level data
    dw  0

.size: equ $ - Level_2_Data ; 0X????   (? kb)
