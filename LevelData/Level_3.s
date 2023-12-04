Level_3_Data:
;                                           Initial_X                      EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |                       |         |                    |               |
    dw  100     db  GROUND_TARGET,          0     dw  0       dw GroundTarget_0_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  101     db  GROUND_TARGET,          32    dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  102     db  GROUND_TARGET,          64    dw  0       dw GroundTarget_2_Struct, 0,                         0,       GROUND_TARGET_DONT_HAVE_ITEM db 0
    dw  103     db  GROUND_TARGET,          96    dw  0       dw GroundTarget_3_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  104     db  GROUND_TARGET,          128   dw  0       dw GroundTarget_4_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  105     db  GROUND_TARGET,          160   dw  0       dw GroundTarget_5_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0

    dw  110     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw GroundTarget_2_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  111     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right  dw GroundTarget_3_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0


    ; end marking of level data
    dw  0
