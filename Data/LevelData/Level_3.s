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

;                                                             Initial_X                                     EnemyStruct_Addr
;       Counter                     ActionType                |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |                           |                         |         |                                   |                    |
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
    ; ground target positioning rules (for level 3):

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

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_9: equ 2080

    dw .Enemy_Wave_9 + 0        db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 1        db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 2        db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 3        db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 10       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 11       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_9 + 12       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    ; dw .Enemy_Wave_9 + 15       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    ; dw .Enemy_Wave_9 + 16       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    ; dw .Enemy_Wave_9 + 17       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw .Enemy_Wave_9 + 18       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw .Enemy_Wave_9 + 19       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    ;dw .Enemy_Wave_9 + 20       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    ; dw .Enemy_Wave_9 + 21       db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    dw  2268    db  GROUND_TARGET,          137   dw  0       dw GroundTarget_4_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2290    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_4_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  2291    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  2330    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow   dw GroundTarget_4_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  2331    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2332    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_10: equ 2340


    dw  .Enemy_Wave_10  + 0      db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_10  + 1      db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10  + 2      db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10  + 4      db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    
    ; dw  .Enemy_Wave_10  + 15     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_10  + 16     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_10  + 17     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    ; dw  .Enemy_Wave_10  + 18     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  .Enemy_Wave_10 + 20     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10 + 21     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10 + 22     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    ; dw  .Enemy_Wave_10 + 23     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    ; dw  .Enemy_Wave_10 + 24     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    ; dw  .Enemy_Wave_10 + 25     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    dw  2536    db  GROUND_TARGET,          53    dw  0       dw GroundTarget_5_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2561    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  2562    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  2563    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  2564    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  2661    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2662    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  2663    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_11: equ 2800

    dw .Enemy_Wave_11 + 0       db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_11 + 1       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_11 + 2       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_11 + 3       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_11 + 10      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_11 + 11      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_11 + 12      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw .Enemy_Wave_11 + 15      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw .Enemy_Wave_11 + 16      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw .Enemy_Wave_11 + 17      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw .Enemy_Wave_11 + 18      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw .Enemy_Wave_11 + 19      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw .Enemy_Wave_11 + 20      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw .Enemy_Wave_11 + 21      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_12: equ 3000

    dw  .Enemy_Wave_12 +  0     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_12 +  5     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  .Enemy_Wave_12 + 10     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_12 + 15     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0

    dw  .Enemy_Wave_12 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_12 + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  .Enemy_Wave_12 + 30     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_12 + 35     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  .Enemy_Wave_12 + 40     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_12 + 45     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  .Enemy_Wave_12 + 50     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_12 + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  .Enemy_Wave_12 + 60     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                       0, Item_6_Struct   db ITEM_P
    dw  .Enemy_Wave_12 + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_13: equ 3200

;                                                           Initial_X                                  EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr             |                    SPRCOL_Addr
;       |                           |                       |         |                                |                    |
    dw  .Enemy_Wave_13 + 10     db  BIG_ENEMY_TYPE_TANK,   88     dw  TankData_0                    dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw  .Enemy_Wave_13 + 42     db  BIG_ENEMY_TYPE_TANK,  120     dw  TankData_0                    dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0

    dw  .Enemy_Wave_13 + 90     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 91     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 92     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw  .Enemy_Wave_13 + 120    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 121    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 122    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 123    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


    ; consecutive enemy shots need to be spaced 100 frames apart for the same EnemyShotStruct 
    dw  .Enemy_Wave_13 + 220    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 221    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 222    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw  .Enemy_Wave_13 + 223    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 224    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 225    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  .Enemy_Wave_13 + 226    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0

; ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_14: equ 3450


    dw  .Enemy_Wave_14 + 0      db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_14 + 1      db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_14 + 2      db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_14 + 4      db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    
    dw  .Enemy_Wave_14 + 15     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 16     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 17     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 18     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  .Enemy_Wave_14 + 20     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_14 + 21     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_14 + 22     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    dw  .Enemy_Wave_14 + 23     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 24     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_14 + 25     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_15: equ 3650

    dw .Enemy_Wave_15 + 0       db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_15 + 1       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_15 + 2       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_15 + 3       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_15 + 10      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_15 + 11      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_15 + 12      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw .Enemy_Wave_15 + 15      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw .Enemy_Wave_15 + 16      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw .Enemy_Wave_15 + 17      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw .Enemy_Wave_15 + 18      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw .Enemy_Wave_15 + 19      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw .Enemy_Wave_15 + 20      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw .Enemy_Wave_15 + 21      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;.Ground_Target_10: equ 3932
.Ground_Target_10: equ (1790 - 807) * 4 ; this ground target is positioned at (118, 807) on the bitmap

    dw  .Ground_Target_10       db  GROUND_TARGET,          118   dw  0       dw GroundTarget_5_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  .Ground_Target_10 + 25  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  .Ground_Target_10 + 26  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Ground_Target_10 + 27  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Ground_Target_10 + 28  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  .Ground_Target_10 + 130 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  .Ground_Target_10 + 131 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Ground_Target_10 + 132 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_16: equ 4070

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_16 + 10     db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_16 + 11     db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_16 + 12     db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_16 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_16 + 21     db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_16 + 22     db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct   db ITEM_P

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;.Ground_Target_11: equ 4196
.Ground_Target_11: equ (1790 - 741) * 4 ; this ground target is positioned at (118, 741) on the bitmap

    dw  .Ground_Target_11       db  GROUND_TARGET,          118   dw  0       dw GroundTarget_0_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  .Ground_Target_11 + 25  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  .Ground_Target_11 + 26  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_0_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Ground_Target_11 + 27  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_0_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Ground_Target_11 + 28  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_0_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  .Ground_Target_11 + 130 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_0_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  .Ground_Target_11 + 131 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Ground_Target_11 + 132 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_17: equ 4330

    dw .Enemy_Wave_17 + 0       db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_17 + 1       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_17 + 2       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_17 + 3       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_17 + 10      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_17 + 11      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_17 + 12      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    ; dw .Enemy_Wave_17 + 15      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    ; dw .Enemy_Wave_17 + 16      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    ; dw .Enemy_Wave_17 + 17      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    ; dw .Enemy_Wave_17 + 18      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    ; dw .Enemy_Wave_17 + 19      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    ; dw .Enemy_Wave_17 + 20      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    ; dw .Enemy_Wave_17 + 21      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;.Ground_Target_12: equ 4520
.Ground_Target_12: equ (1790 - 660) * 4 ; this ground target is positioned at (118, 660) on the bitmap

    dw  .Ground_Target_12       db  GROUND_TARGET,          118   dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  .Ground_Target_12 + 25  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_1_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  .Ground_Target_12 + 26  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Ground_Target_12 + 27  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Ground_Target_12 + 28  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  .Ground_Target_12 + 130 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  .Ground_Target_12 + 131 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Ground_Target_12 + 132 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_18: equ 4800


    dw  .Enemy_Wave_18 + 0      db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_18 + 1      db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_18 + 2      db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_18 + 4      db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    
    dw  .Enemy_Wave_18 + 15     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_18 + 16     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_18 + 17     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_18 + 18     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  .Enemy_Wave_18 + 20     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_18 + 21     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_18 + 22     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    dw  .Enemy_Wave_18 + 23     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_18 + 24     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_18 + 25     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_19: equ 5000

    dw  .Enemy_Wave_19 +  0     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_19 +  5     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  .Enemy_Wave_19 + 10     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_19 + 15     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0

    dw  .Enemy_Wave_19 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_19 + 25     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  .Enemy_Wave_19 + 30     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_19 + 35     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  .Enemy_Wave_19 + 40     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_19 + 45     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  .Enemy_Wave_19 + 50     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                       0,             0   db 0
    dw  .Enemy_Wave_19 + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  .Enemy_Wave_19 + 60     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                       0, Item_6_Struct   db ITEM_P
    dw  .Enemy_Wave_19 + 65     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0


; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_20: equ 5200

    dw .Enemy_Wave_20 + 0       db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_20 + 1       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_20 + 2       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_20 + 3       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_20 + 10      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_20 + 11      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_20 + 12      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw .Enemy_Wave_20 + 15      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw .Enemy_Wave_20 + 16      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw .Enemy_Wave_20 + 17      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw .Enemy_Wave_20 + 18      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw .Enemy_Wave_20 + 19      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw .Enemy_Wave_20 + 20      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw .Enemy_Wave_20 + 21      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_21: equ 5350

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_21 + 10     db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_21 + 11     db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_21 + 12     db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_21 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_21 + 21     db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_21 + 22     db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct   db ITEM_P


; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_22: equ 5500

;                                                              Initial_X                                     EnemyStruct_Addr
;       Counter                      ActionType                |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |                            |                         |         |                                   |                    |
    dw  .Enemy_Wave_22 + 10      db  BIG_ENEMY_TYPE_CHOPPER,   4     dw  ChopperData_0                    dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw  .Enemy_Wave_22 + 42      db  BIG_ENEMY_TYPE_CHOPPER, 104     dw  ChopperData_1                    dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0



    dw  .Enemy_Wave_22 + 90      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Enemy_Wave_22 + 91      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  .Enemy_Wave_22 + 92      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_22 + 120      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_22 + 121      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_22 + 122      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_22 + 123      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


    ; consecutive enemy shots need to be spaced 100 frames apart for the same EnemyShotStruct 
    dw .Enemy_Wave_22 + 220      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_22 + 221      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_22 + 222      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_22 + 223      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_22 + 224      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_22 + 225      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_22 + 226      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw .Enemy_Wave_22 + 320      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_22 + 321      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_22 + 322      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_22 + 323      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_22 + 324      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_22 + 325      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_22 + 326      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw .Enemy_Wave_22 + 420      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_22 + 421      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_22 + 422      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_22 + 423      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_22 + 424      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_22 + 425      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_22 + 426      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw .Enemy_Wave_22 + 520      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw .Enemy_Wave_22 + 521      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw .Enemy_Wave_22 + 522      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw .Enemy_Wave_22 + 523      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw .Enemy_Wave_22 + 524      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw .Enemy_Wave_22 + 525      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw .Enemy_Wave_22 + 526      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_23: equ 6030

    dw .Enemy_Wave_23 + 0       db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_23 + 1       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_23 + 2       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_23 + 3       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_23 + 10      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_23 + 11      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_23 + 12      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;.Ground_Target_13: equ 6172
.Ground_Target_13: equ (1790 - 247) * 4 ; this ground target is positioned at (130, 247) on the bitmap

    dw  .Ground_Target_13       db  GROUND_TARGET,          130   dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0

    dw  .Ground_Target_13 + 25  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_1_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  .Ground_Target_13 + 26  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Ground_Target_13 + 27  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Ground_Target_13 + 28  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  .Ground_Target_13 + 130 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  .Ground_Target_13 + 131 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Ground_Target_13 + 132 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

    dw  .Ground_Target_13 + 245 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_1_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  .Ground_Target_13 + 246 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Ground_Target_13 + 247 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Ground_Target_13 + 248 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0

    dw  .Ground_Target_13 + 350 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  .Ground_Target_13 + 351 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Ground_Target_13 + 352 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_24: equ 6500

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_24 + 10     db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_24 + 11     db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_24 + 12     db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_24 + 20     db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_24 + 21     db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_24 + 22     db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct   db ITEM_P

; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

;.Ground_Target_14: equ 6752
.Ground_Target_14: equ (1790 - 102) * 4 ; this ground target is positioned at (144, 102) on the bitmap

    dw  .Ground_Target_14       db  GROUND_TARGET,          144   dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    
    dw  .Ground_Target_14 + 25  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast   dw GroundTarget_1_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  .Ground_Target_14 + 26  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Ground_Target_14 + 27  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Ground_Target_14 + 28  db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  .Ground_Target_14 + 130 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast   dw GroundTarget_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  .Ground_Target_14 + 131 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  .Ground_Target_14 + 132 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

    dw  .Ground_Target_14 + 245 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast   dw GroundTarget_1_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  .Ground_Target_14 + 246 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  .Ground_Target_14 + 247 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  .Ground_Target_14 + 248 db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0




    ;dw 7100 ; last LevelCounter for Level 3 BG

    ; end marking of level data
    dw  0
