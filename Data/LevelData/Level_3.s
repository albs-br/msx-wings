Level_3_Data:
; ;                                           Initial_X                      EnemyStruct_Addr
; ;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
; ;       |           |                       |         |                    |               |
;     dw  100     db  GROUND_TARGET,          0     dw  0       dw GroundTarget_0_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  101     db  GROUND_TARGET,          32    dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  102     db  GROUND_TARGET,          64    dw  0       dw GroundTarget_2_Struct, 0,                         0,       GROUND_TARGET_DONT_HAVE_ITEM db 0
;     dw  103     db  GROUND_TARGET,          96    dw  0       dw GroundTarget_3_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  104     db  GROUND_TARGET,          128   dw  0       dw GroundTarget_4_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  105     db  GROUND_TARGET,          160   dw  0       dw GroundTarget_5_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0

;     dw  110     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast  dw GroundTarget_2_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
;     dw  111     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast   dw GroundTarget_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
;     dw  112     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast  dw GroundTarget_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
;     dw  113     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
;     dw  123     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
;     dw  133     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
;     dw  143     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


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

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_2: equ 200

    dw  .Enemy_Wave_2  +  0     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_2  +  5     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  .Enemy_Wave_2  + 10     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_2  + 15     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0

    dw  .Enemy_Wave_2  + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_2  + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  .Enemy_Wave_2  + 30     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_2  + 35     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  .Enemy_Wave_2  + 40     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_2  + 45     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  .Enemy_Wave_2  + 50     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_2  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  .Enemy_Wave_2  + 60     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                       0, Item_6_Struct   db ITEM_P
    dw  .Enemy_Wave_2  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_3: equ 400

;                                           Initial_X                                     EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |           |                       |         |                                   |                    |
    dw  .Enemy_Wave_3 + 10      db  BIG_ENEMY_TYPE_CHOPPER,   4     dw  ChopperData_0                    dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw  .Enemy_Wave_3 + 42      db  BIG_ENEMY_TYPE_CHOPPER, 104     dw  ChopperData_1                    dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0



    dw  .Enemy_Wave_3 + 90      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Enemy_Wave_3 + 91      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  .Enemy_Wave_3 + 92      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_3 + 120      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_3 + 121      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_3 + 122      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_3 + 123      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


    ; consecutive enemy shots need to be spaced 100 frames apart for the same EnemyShotStruct 
    dw .Enemy_Wave_3 + 220      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_3 + 221      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_3 + 222      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_3 + 223      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_3 + 224      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_3 + 225      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_3 + 226      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw .Enemy_Wave_3 + 320      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_3 + 321      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_3 + 322      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_3 + 323      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_3 + 324      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_3 + 325      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_3 + 326      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw .Enemy_Wave_3 + 420      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_3 + 421      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_3 + 422      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_3 + 423      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_3 + 424      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_3 + 425      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_3 + 426      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw .Enemy_Wave_3 + 520      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_3 + 521      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_3 + 522      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_3 + 523      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_3 + 524      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_3 + 525      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_3 + 526      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_4: equ 1020

    dw .Enemy_Wave_4 + 0        db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_4 + 1        db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_4 + 2        db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_4 + 3        db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_4 + 10       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_4 + 11       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_4 + 12       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw .Enemy_Wave_4 + 15       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw .Enemy_Wave_4 + 16       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw .Enemy_Wave_4 + 17       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw .Enemy_Wave_4 + 18       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw .Enemy_Wave_4 + 19       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw .Enemy_Wave_4 + 20       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw .Enemy_Wave_4 + 21       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

; first ground target: 234 X 1525

; first visible line of BG: 1791

    ; -------------------------------------------
    ; ground target position rules (for level 3):

    ; H = height                  C = counter
    ; |                           |    
    ; 1790px on image: counter at 0
    ; 1780px on image: counter at 40
    ; 1770px on image: counter at 80

    ; each -10px = +40 on counter

    ; formula:
    ; C = (1790 - H) * 4
    ; -------------------------------------------

;                                           Initial_X                      EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |                       |         |                    |               |
    dw  1060    db  GROUND_TARGET,          230   dw  0       dw GroundTarget_0_Struct, 0,                         0,       GROUND_TARGET_DONT_HAVE_ITEM db 0
    dw  1116    db  GROUND_TARGET,          150   dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    
; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_5: equ 1220


    dw  .Enemy_Wave_5  + 0      db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_5  + 1      db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_5  + 2      db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_5  + 4      db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    
    dw  .Enemy_Wave_5  + 15     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_5  + 16     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_5  + 17     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_5  + 18     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  .Enemy_Wave_5  + 20     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_5  + 21     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_5  + 22     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    dw  .Enemy_Wave_5  + 23     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_5  + 24     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_5  + 25     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_6: equ 1420

    dw  .Enemy_Wave_6  +  0     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_6  +  5     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  .Enemy_Wave_6  + 10     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_6  + 15     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0

    dw  .Enemy_Wave_6  + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_6  + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  .Enemy_Wave_6  + 30     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_6  + 35     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  .Enemy_Wave_6  + 40     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_6  + 45     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  .Enemy_Wave_6  + 50     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_6  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  .Enemy_Wave_6  + 60     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                       0, Item_6_Struct   db ITEM_P
    dw  .Enemy_Wave_6  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_7: equ 1600

    dw  .Enemy_Wave_7  +  0     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_7  +  5     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  .Enemy_Wave_7  + 10     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                       0,             0   db 0
    ; dw  .Enemy_Wave_7  + 15     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0

    dw  .Enemy_Wave_7  + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                       0,             0   db 0
    ; dw  .Enemy_Wave_7  + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  .Enemy_Wave_7  + 30     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                       0,             0   db 0
    ; dw  .Enemy_Wave_7  + 35     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  .Enemy_Wave_7  + 40     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                       0,             0   db 0
    ; dw  .Enemy_Wave_7  + 45     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  .Enemy_Wave_7  + 50     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_7  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  .Enemy_Wave_7  + 60     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                       0, Item_6_Struct   db ITEM_P
    dw  .Enemy_Wave_7  + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    dw  1760    db  GROUND_TARGET,          137   dw  0       dw GroundTarget_2_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  1780    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_2_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  1781    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_2_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  1782    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  1820    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow   dw GroundTarget_2_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  1821    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_2_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_8: equ 1830

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_8 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_8 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_8 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_8 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_8 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_8 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct   db ITEM_P

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    dw  2008    db  GROUND_TARGET,          137   dw  0       dw GroundTarget_3_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2030    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  2031    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2070    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow   dw GroundTarget_3_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  2071    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_3_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  2072    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0



    dw  2268    db  GROUND_TARGET,          137   dw  0       dw GroundTarget_4_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2290    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_4_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  2291    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  2330    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow   dw GroundTarget_4_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  2331    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2332    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0



    dw  2536    db  GROUND_TARGET,          53    dw  0       dw GroundTarget_5_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2561    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  2562    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  2563    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  2564    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  2661    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2662    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  2663    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

    ;dw 7100 ; last LevelCounter for Level 3 BG

    ; end marking of level data
    dw  0
