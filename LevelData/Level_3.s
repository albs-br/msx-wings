Level_3_Data:
;                                           Initial_X                      EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |                       |         |                    |               |
    dw  100     db  GROUND_TARGET,          0     dw  0       dw GroundTarget_0_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0
    dw  101     db  GROUND_TARGET,          32    dw  0       dw GroundTarget_1_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0
    dw  102     db  GROUND_TARGET,          64    dw  0       dw GroundTarget_2_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0
    dw  103     db  GROUND_TARGET,          96    dw  0       dw GroundTarget_3_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0
    dw  104     db  GROUND_TARGET,          128   dw  0       dw GroundTarget_4_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0
    dw  105     db  GROUND_TARGET,          160   dw  0       dw GroundTarget_5_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0



    ; end marking of level data
    dw  0
