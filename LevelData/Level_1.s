ENEMY_TYPE_1:           equ 1


Level_1_Data:
    dw  20      db  ENEMY_TYPE_1, 32    dw  EnemyData_1     db 0
    dw  21      db  ENEMY_TYPE_1, 64    dw  EnemyData_1     db 1        ; TODO: level data in the same timing mark should work
    dw  250     db  ENEMY_TYPE_1, 160   dw  EnemyData_2     db 0
    dw  500     db  ENEMY_TYPE_1, 0     dw  0               db 0
    dw  750     db  ENEMY_TYPE_1, 80    dw  0               db 0

    ; end marking of level data
    dw  0
