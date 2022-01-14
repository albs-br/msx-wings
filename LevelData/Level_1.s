ENEMY_TYPE_1:           equ 1
ENEMY_SHOT:             equ 2


Level_1_Data:
    dw  20      db  ENEMY_TYPE_1, 32    dw  EnemyDeltaX_1     db 0
    dw  21      db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_1     db 1        ; TODO: level data in the same timing mark should work
    dw  22      db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_1     db 2
    dw  23      db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_1     db 3
    dw  30      db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_1     db 4
    dw  31      db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_1     db 5
    dw  32      db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_1     db 6

    dw  150     db  ENEMY_TYPE_1, 64    dw  EnemyDeltaX_2     db 0
    dw  151     db  ENEMY_TYPE_1, 96    dw  EnemyDeltaX_2     db 1
    dw  152     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 2
    dw  153     db  ENEMY_TYPE_1, 160   dw  EnemyDeltaX_2     db 3
    dw  160     db  ENEMY_TYPE_1, 64+16 dw  EnemyDeltaX_2     db 4
    dw  161     db  ENEMY_TYPE_1, 96+16 dw  EnemyDeltaX_2     db 5
    dw  162     db  ENEMY_TYPE_1, 128+16 dw  EnemyDeltaX_2     db 6

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
    dw  410     db  ENEMY_TYPE_1, 80    dw  EnemyDeltaX_0     db 6

    dw  500     db  ENEMY_TYPE_1, 128   dw  0                 db 0
    dw  510     db  ENEMY_TYPE_1, 128   dw  0                 db 1
    dw  520     db  ENEMY_TYPE_1, 128   dw  0                 db 2
    dw  530     db  ENEMY_TYPE_1, 128   dw  0                 db 3
    dw  540     db  ENEMY_TYPE_1, 128   dw  0                 db 4
    dw  550     db  ENEMY_TYPE_1, 128   dw  0                 db 5
    dw  560     db  ENEMY_TYPE_1, 128   dw  0                 db 6

    dw  650     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 0
    dw  660     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 1
    dw  670     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 2
    dw  680     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 3
    dw  690     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 4
    dw  700     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 5
    dw  710     db  ENEMY_TYPE_1, 128   dw  EnemyDeltaX_2     db 6

    ; end marking of level data
    dw  0
