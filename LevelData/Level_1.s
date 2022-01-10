ENEMY_TYPE_1:           equ 1


Level_1_Data:
    dw  20      db  ENEMY_TYPE_1, 32    dw  EnemyDeltaX_1     db 0
    dw  21      db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_1     db 1        ; TODO: level data in the same timing mark should work
    dw  22      db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_1     db 2        ; TODO: level data in the same timing mark should work
    dw  23      db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_1     db 3        ; TODO: level data in the same timing mark should work
    dw  30      db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_1     db 4        ; TODO: level data in the same timing mark should work
    dw  31      db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_1     db 5        ; TODO: level data in the same timing mark should work

    dw  150     db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_2     db 0
    dw  151     db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_2     db 1
    dw  152     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 2
    dw  153     db  ENEMY_TYPE_1, 160   dw  EnemyDeltaX_2     db 3

    dw  250     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 0
    dw  251     db  ENEMY_TYPE_1, 112   dw  EnemyDeltaX_0     db 1
    dw  252     db  ENEMY_TYPE_1, 144   dw  EnemyDeltaX_1     db 2
    dw  253     db  ENEMY_TYPE_1, 176   dw  EnemyDeltaX_1     db 3

    dw  350     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 0
    dw  360     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 1
    dw  370     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 2
    dw  380     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 3
    dw  390     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 4
    dw  400     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 5

    dw  550     db  ENEMY_TYPE_1, 128   dw  0                 db 0
    dw  560     db  ENEMY_TYPE_1, 128   dw  0                 db 1
    dw  570     db  ENEMY_TYPE_1, 128   dw  0                 db 2
    dw  580     db  ENEMY_TYPE_1, 128   dw  0                 db 3
    dw  590     db  ENEMY_TYPE_1, 128   dw  0                 db 4
    dw  600     db  ENEMY_TYPE_1, 128   dw  0                 db 5

    dw  750     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 0
    dw  760     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 1
    dw  770     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 2
    dw  780     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 3
    dw  790     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 4
    dw  800     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 5

    ; end marking of level data
    dw  0
