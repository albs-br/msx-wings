ENEMY_TYPE_1:           equ 1


Level_1_Data:
    dw  32      db  ENEMY_TYPE_1, 32    dw  EnemyData_1
    dw  250     db  ENEMY_TYPE_1, 160   dw  EnemyData_2
    dw  500     db  ENEMY_TYPE_1, 0     dw  0
    dw  750     db  ENEMY_TYPE_1, 80    dw  0

    ; end marking of level data
    dw  0
