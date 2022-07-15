Level_4_Data:
;                                           Initial_X                      EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |                       |         |                    |               |
    dw  10      db  ENEMY_TYPE_1,           32    dw  EnemyData_6     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct
    dw  11      db  ENEMY_TYPE_1,           64    dw  EnemyData_6     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct
    dw  12      db  ENEMY_TYPE_1,           96    dw  EnemyData_6     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct
    dw  20      db  ENEMY_TYPE_1,           128   dw  EnemyData_6     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct        
    dw  21      db  ENEMY_TYPE_1,           160   dw  EnemyData_6     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct
    dw  22      db  ENEMY_TYPE_1,           192   dw  EnemyData_6     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct

    dw  110     db  ENEMY_TYPE_1,           32    dw  EnemyData_6     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct
    dw  111     db  ENEMY_TYPE_1,           64    dw  EnemyData_6     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct
    dw  112     db  ENEMY_TYPE_1,           96    dw  EnemyData_6     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct
    dw  120     db  ENEMY_TYPE_1,           128   dw  EnemyData_6     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct        
    dw  121     db  ENEMY_TYPE_1,           160   dw  EnemyData_6     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct
    dw  122     db  ENEMY_TYPE_1,           192   dw  EnemyData_6     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct


    ; end marking of level data
    dw  0
