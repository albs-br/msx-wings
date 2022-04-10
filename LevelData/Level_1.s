ENEMY_TYPE_1:           equ 1
ENEMY_SHOT_TYPE_1:      equ 2
ITEM_P:                 equ 100     ; this is gonna be used only on bonus stages
GROUND_TARGET:          equ 150


Level_1_Data:
    ; TODO: level data in the same timing mark should work

;                                           Initial_X                      EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |                       |         |                    |               |
    dw  10      db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct
    dw  11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct
    dw  12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct
    dw  20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct        
    dw  21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct
    dw  22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct
    ; test debug trap    
    ; dw  33      db  ENEMY_TYPE_1,           32    dw  EnemyData_1     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0



    dw  35      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       Item_0_Struct
    dw  36      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    dw  37      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0
    dw  38      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,       0
    dw  39      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,       0
    dw  40      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,       0
    dw  41      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,       0
    ; test debug trap    
    ;dw  42      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0

    dw  100     db  GROUND_TARGET,          112   dw  0       dw GroundTarget_0_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0


    dw  150     db  ENEMY_TYPE_1,           64    dw  EnemyData_2     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct
    dw  151     db  ENEMY_TYPE_1,           96    dw  EnemyData_2     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0
    dw  152     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0
    dw  154     db  ENEMY_TYPE_1,           160   dw  EnemyData_2     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0

    dw  155     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       Item_0_Struct
    dw  156     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    dw  157     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0
    dw  158     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,       0

    dw  160     db  ENEMY_TYPE_1,           80    dw  EnemyData_2     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0
    dw  161     db  ENEMY_TYPE_1,           112   dw  EnemyData_2     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0
    dw  162     db  ENEMY_TYPE_1,           144   dw  EnemyData_2     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0,       Item_6_Struct

    dw  163     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,       0
    dw  164     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,       0
    dw  165     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,       0



    dw  250     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0
    dw  251     db  ENEMY_TYPE_1,           112   dw  EnemyData_0     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0
    dw  252     db  ENEMY_TYPE_1,           144   dw  EnemyData_1     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0
    dw  253     db  ENEMY_TYPE_1,           176   dw  EnemyData_1     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct

    dw  254     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    dw  255     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    dw  256     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0
    dw  257     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,       0
    dw  258     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,       0
    dw  259     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,       Item_5_Struct



    dw  350     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0
    dw  355     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    ; dw  355     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    dw  356     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    dw  357     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0

    dw  360     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0
    ;dw  365     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0

    dw  370     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0
    ;dw  375     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0

    dw  380     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0
    dw  385     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,       0

    dw  390     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct
    dw  395     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,       0

    dw  400     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0
    dw  410     db  ENEMY_TYPE_1,           80    dw  EnemyData_0     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0,       0
    ; dw  415     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left   dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    ; dw  416     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    ; dw  417     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0


    dw  499     db  GROUND_TARGET,          0     dw  0       dw GroundTarget_0_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0


    dw  500     db  ENEMY_TYPE_1,           128   dw  EnemyData_4     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0
    dw  505     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0

    dw  510     db  ENEMY_TYPE_1,           128   dw  EnemyData_4     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0
    dw  515     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0

    dw  520     db  ENEMY_TYPE_1,           128   dw  EnemyData_4     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0
    dw  525     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0

    dw  530     db  ENEMY_TYPE_1,           128   dw  EnemyData_4     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0
    dw  535     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,       0

    dw  540     db  ENEMY_TYPE_1,           128   dw  EnemyData_4     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0
    dw  545     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,       0

    dw  550     db  ENEMY_TYPE_1,           128   dw  EnemyData_4     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0
    dw  555     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,       0

    dw  560     db  ENEMY_TYPE_1,           128   dw  EnemyData_4     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0,       Item_6_Struct
    dw  565     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,       0




    dw  650     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0
    dw  655     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    dw  656     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    dw  657     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0

    dw  660     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       0
    dw  670     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       0
    dw  680     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       0
    dw  690     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       0
    dw  700     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       0
    dw  710     db  ENEMY_TYPE_1,           128   dw  EnemyData_2     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0,       Item_6_Struct

    dw  820      db  ENEMY_TYPE_1,           32    dw  EnemyData_1     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct
    dw  821      db  ENEMY_TYPE_1,           64    dw  EnemyData_1     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct
    dw  822      db  ENEMY_TYPE_1,           96    dw  EnemyData_1     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct
    dw  823      db  ENEMY_TYPE_1,           128   dw  EnemyData_1     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct
    dw  830      db  ENEMY_TYPE_1,           64    dw  EnemyData_1     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct
    dw  831      db  ENEMY_TYPE_1,           96    dw  EnemyData_1     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct
    dw  832      db  ENEMY_TYPE_1,           128   dw  EnemyData_1     dw Enemy_6_Struct, ENEMY_6_SPRCOL_ADDR,      0,       Item_6_Struct

    dw  835      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    dw  836      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    dw  837      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0
    dw  838      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,       0
    dw  839      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,       0
    dw  840      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,       0
    dw  841      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,       0

    dw  950      db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct
    dw  951      db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct
    dw  952      db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct
    dw  953      db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct        
    dw  954      db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct
    dw  955      db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct

    ; end marking of level data
    dw  0
