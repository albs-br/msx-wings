ENEMY_TYPE_1:           equ 1
ENEMY_SHOT_TYPE_1:      equ 2


Level_1_Data:
    ; TODO: level data in the same timing mark should work

;                                           Initial_X                      EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |                       |         |                    |               |
    ;dw  20      db  ENEMY_TYPE_1,           8    dw  EnemyDeltaX_0     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0
    dw  20      db  ENEMY_TYPE_1,           32    dw  EnemyDeltaX_1     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0
    dw  21      db  ENEMY_TYPE_1,           64    dw  EnemyDeltaX_1     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0        
    dw  22      db  ENEMY_TYPE_1,           96    dw  EnemyDeltaX_1     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0
    dw  23      db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_1     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0
    dw  30      db  ENEMY_TYPE_1,           64    dw  EnemyDeltaX_1     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0
    dw  31      db  ENEMY_TYPE_1,           96    dw  EnemyDeltaX_1     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0
    dw  32      db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_1     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0
    ;dw  32      db  ENEMY_TYPE_1,           256-16   dw  EnemyDeltaX_1     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0

    dw  35      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct
    dw  36      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct
    dw  37      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct
    dw  38      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct
    dw  39      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct
    dw  40      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct
    dw  41      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct



    dw  150     db  ENEMY_TYPE_1,           64    dw  EnemyDeltaX_2     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0
    dw  151     db  ENEMY_TYPE_1,           96    dw  EnemyDeltaX_2     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0
    dw  152     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0
    dw  154     db  ENEMY_TYPE_1,           160   dw  EnemyDeltaX_2     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0

    dw  155     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct
    dw  156     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct
    dw  157     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct
    dw  158     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct

    dw  160     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_2     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0
    dw  161     db  ENEMY_TYPE_1,           112   dw  EnemyDeltaX_2     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0
    dw  162     db  ENEMY_TYPE_1,           144   dw  EnemyDeltaX_2     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0

    dw  163     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct
    dw  164     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct
    dw  165     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct



    dw  250     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0
    dw  251     db  ENEMY_TYPE_1,           112   dw  EnemyDeltaX_0     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0
    dw  252     db  ENEMY_TYPE_1,           144   dw  EnemyDeltaX_1     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0
    dw  253     db  ENEMY_TYPE_1,           176   dw  EnemyDeltaX_1     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0

    dw  254     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct
    dw  255     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct
    dw  256     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct
    dw  257     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct
    dw  258     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct
    dw  259     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct


;TODO: all these shots are buggy
    dw  350     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0
    ;dw  355     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct
    ; dw  355     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct
    ; dw  356     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct
    ; dw  357     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct

    dw  360     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0
    ;dw  365     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct

    dw  370     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0
    ;dw  375     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct

    dw  380     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0
    ;dw  385     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct

    dw  390     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0
    ;dw  395     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct

    dw  400     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0
    dw  410     db  ENEMY_TYPE_1,           80    dw  EnemyDeltaX_0     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0
    dw  415     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left   dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct
    dw  416     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct
    dw  417     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct




    dw  500     db  ENEMY_TYPE_1,           128   dw  0                 dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0
    dw  505     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct

    dw  510     db  ENEMY_TYPE_1,           128   dw  0                 dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0
    dw  515     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct

    dw  520     db  ENEMY_TYPE_1,           128   dw  0                 dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0
    dw  525     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct

    dw  530     db  ENEMY_TYPE_1,           128   dw  0                 dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0
    dw  535     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct

    dw  540     db  ENEMY_TYPE_1,           128   dw  0                 dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0
    dw  545     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct

    dw  550     db  ENEMY_TYPE_1,           128   dw  0                 dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0
    dw  555     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct

    dw  560     db  ENEMY_TYPE_1,           128   dw  0                 dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0
    dw  565     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct




    dw  650     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0
    dw  655     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct
    dw  656     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct
    dw  657     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct

    dw  660     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0
    dw  670     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0
    dw  680     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0
    dw  690     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0
    dw  700     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0
    dw  710     db  ENEMY_TYPE_1,           128   dw  EnemyDeltaX_2     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0

    ; end marking of level data
    dw  0
