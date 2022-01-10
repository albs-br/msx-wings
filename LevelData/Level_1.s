ENEMY_TYPE_1:           equ 1


Level_1_Data:
    dw  20      db  ENEMY_TYPE_1, 32    dw  EnemyData_1     db 0
    dw  21      db  ENEMY_TYPE_1, 64    dw  EnemyData_1     db 1        ; TODO: level data in the same timing mark should work
    dw  22      db  ENEMY_TYPE_1, 96    dw  EnemyData_1     db 2        ; TODO: level data in the same timing mark should work
    dw  23      db  ENEMY_TYPE_1, 128   dw  EnemyData_1     db 3        ; TODO: level data in the same timing mark should work
    dw  30      db  ENEMY_TYPE_1, 64    dw  EnemyData_1     db 4        ; TODO: level data in the same timing mark should work
    dw  31      db  ENEMY_TYPE_1, 96    dw  EnemyData_1     db 5        ; TODO: level data in the same timing mark should work

    dw  250     db  ENEMY_TYPE_1, 160   dw  EnemyData_2     db 0
    dw  500     db  ENEMY_TYPE_1, 0     dw  0               db 0
    dw  750     db  ENEMY_TYPE_1, 80    dw  0               db 0

    ; end marking of level data
    dw  0
