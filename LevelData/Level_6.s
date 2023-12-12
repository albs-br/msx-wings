Level_6_Data:

;                                           Initial_X                                     EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |           |                       |         |                                   |                    |
    dw  10      db  BIG_ENEMY_TYPE_2,      64     dw  TankData_0                    dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw  42      db  BIG_ENEMY_TYPE_2,     192     dw  TankData_0                    dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0



    dw  90      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  91      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  92      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw 120      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw 121      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw 122      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw 123      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


    ; consecutive enemy shots need to be spaced 100 frames apart for the same EnemyShotStruct 
    dw 220      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw 221      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw 222      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw 223      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw 224      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw 225      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw 226      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw 320      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw 321      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw 322      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw 323      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw 324      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw 325      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw 326      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw 420      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw 421      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw 422      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw 423      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw 424      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw 425      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw 426      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw 520      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw 521      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw BigEnemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw 522      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    
    dw 523      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw 524      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw BigEnemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw 525      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw 526      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw BigEnemy_1_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0



    dw 850      db  BIG_ENEMY_TYPE_1,       4    dw  ChopperData_0                   dw BigEnemy_0_Struct,   BIG_ENEMY_0_SPRCOL_ADDR,              0, 0               db 0
    dw 882      db  BIG_ENEMY_TYPE_1,     104    dw  ChopperData_1                   dw BigEnemy_1_Struct,   BIG_ENEMY_1_SPRCOL_ADDR,              0, 0               db 0


    ; end marking of level data
    dw  0
