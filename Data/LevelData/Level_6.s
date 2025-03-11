Level_6_Data:

;                                           Initial_X                                     EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |           |                       |         |                                   |                    |
    dw  10    db  BIG_ENEMY_TYPE_HOVERCRAFT,     64     dw  TankData_0                    dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw  42    db  BIG_ENEMY_TYPE_HOVERCRAFT,    192     dw  TankData_0                    dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0



    dw  70      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  71      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  72      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw  73      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  74      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  75      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  76      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


    ; consecutive enemy shots need to be spaced 100 frames apart for the same EnemyShotStruct 
    dw 170      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw 171      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw 172      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw 173      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw 174      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_fast  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw 175      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw 176      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    ; dw 320      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    ; dw 321      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    ; dw 322      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    ; dw 323      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    ; dw 324      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    ; dw 325      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    ; dw 326      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    ; dw 420      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    ; dw 421      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    ; dw 422      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    ; dw 423      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    ; dw 424      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    ; dw 425      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    ; dw 426      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    ; dw 520      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    ; dw 521      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    ; dw 522      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    ; dw 523      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    ; dw 524      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    ; dw 525      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    ; dw 526      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    ; dw 350    db  BIG_ENEMY_TYPE_CHOPPER,   4     dw  ChopperData_0                   dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    ; dw 382    db  BIG_ENEMY_TYPE_CHOPPER, 104     dw  ChopperData_1                   dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0
    dw 350    db  BIG_ENEMY_TYPE_TANK,  64     dw  TankData_0                   dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw 382    db  BIG_ENEMY_TYPE_TANK, 192     dw  TankData_0                   dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0


    ; end marking of level data
    dw  0
