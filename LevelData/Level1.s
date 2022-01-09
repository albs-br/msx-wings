ENEMY_TYPE_1:           equ 1


Level_1_Data:
    dw  32     db  ENEMY_TYPE_1, 32
    dw  250    db  ENEMY_TYPE_1, 160
    dw  500     db  ENEMY_TYPE_1, 0
    dw  750     db  ENEMY_TYPE_1, 80

    ; end marking of level data
    dw  0      db  0, 0
