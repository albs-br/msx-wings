ENEMY_TYPE_1:           equ 1
ENEMY_SHOT_TYPE_1:      equ 2


Level_1_Data:
    ; TODO: level data in the same timing mark should work

;                                 Initial_X                      EnemyStruct_Addr
;       Counter     ActionType    |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |             |         |                    |               |
    dw  20      db  ENEMY_TYPE_1, 32    dw  EnemyDeltaX_1     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR
    dw  21      db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_1     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR        
    dw  22      db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_1     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR
    dw  23      db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_1     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR
    dw  30      db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_1     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR
    dw  31      db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_1     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR
    dw  32      db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_1     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR
 
    dw  150     db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_2     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR
    dw  151     db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_2     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR
    dw  152     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR
    dw  153     db  ENEMY_TYPE_1, 160   dw  EnemyDeltaX_2     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR
    dw  160     db  ENEMY_TYPE_1, 64+16 dw  EnemyDeltaX_2     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR
    dw  161     db  ENEMY_TYPE_1, 96+16 dw  EnemyDeltaX_2     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR
    dw  162     db  ENEMY_TYPE_1, 144   dw  EnemyDeltaX_2     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR

    dw  250     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR
    dw  251     db  ENEMY_TYPE_1, 112   dw  EnemyDeltaX_0     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR
    dw  252     db  ENEMY_TYPE_1, 144   dw  EnemyDeltaX_1     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR
    dw  253     db  ENEMY_TYPE_1, 176   dw  EnemyDeltaX_1     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR

    dw  350     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR
    dw  360     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR
    dw  370     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR
    dw  380     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR
    dw  390     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR
    dw  400     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR
    dw  410     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR

    dw  500     db  ENEMY_TYPE_1, 128   dw  0                 dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR
    dw  510     db  ENEMY_TYPE_1, 128   dw  0                 dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR
    dw  520     db  ENEMY_TYPE_1, 128   dw  0                 dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR
    dw  530     db  ENEMY_TYPE_1, 128   dw  0                 dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR
    dw  540     db  ENEMY_TYPE_1, 128   dw  0                 dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR
    dw  550     db  ENEMY_TYPE_1, 128   dw  0                 dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR
    dw  560     db  ENEMY_TYPE_1, 128   dw  0                 dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR

    dw  650     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR
    dw  660     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR
    dw  670     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR
    dw  680     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR
    dw  690     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR
    dw  700     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR
    dw  710     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR

    ; end marking of level data
    dw  0
