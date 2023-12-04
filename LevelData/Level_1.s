ENEMY_TYPE_1:           equ 1
ENEMY_SHOT_TYPE_1:      equ 2
BIG_ENEMY_TYPE_1:       equ 3
ITEM_P:                 equ 100
ITEM_BOMB:              equ 101


; --------------------------------
GROUND_TARGET:                        equ 150
GROUND_TARGET_DONT_HAVE_ITEM:         equ 0
GROUND_TARGET_HAS_ITEM:               equ 1

Level_1_Data:
    ; TODO: level data in the same timing mark should work

;                                           Initial_X                                     EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |           |                       |         |                                   |                    |
    dw  10      db  ENEMY_TYPE_1,           32    dw  EnemyData_5                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw  12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw  20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_P        
    dw  21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_P
    dw  22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_P
    ; test debug trap    
    ; dw  33      db  ENEMY_TYPE_1,           32    dw  EnemyData_1     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       0



    dw  35      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  36      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  37      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  38      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  39      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  40      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  41      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0
    ; test debug trap    
    ;dw  42      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0


    dw  150     db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  151     db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  152     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  154     db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    dw  155     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  156     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  157     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  158     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  160     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  161     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  162     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    dw  163     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  164     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  165     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

    ; -------------------------------------------
    ; ground target position rules:

    ; H = height                 C = counter
    ; |                          |    
    ; 830px on image: counter at 0
    ; 820px on image: counter at 40
    ; 810px on image: counter at 80
    ; 800px on image: counter at 120
    ; 790px on image: counter at 160
    ; 780px on image: counter at 200

    ; 770px on image: counter at 240
    ; 760px on image: counter at 280
    ; 720px on image: counter at 440

    ; each -10px = +40 on counter

    ; formula:
    ; C = (830 - H) * 4
    ; -------------------------------------------
                                                                                                                                               ;0: no item; 1: item
    ; 770px on image: counter at 240                                                                                                           |
    dw  240     db  GROUND_TARGET,          112   dw  0                                dw GroundTarget_0_Struct,                 0,         0, GROUND_TARGET_HAS_ITEM   db 0


    dw  250     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    dw  251     db  ENEMY_TYPE_1,           112   dw  EnemyData_0                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  252     db  ENEMY_TYPE_1,           144   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  253     db  ENEMY_TYPE_1,           176   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_P

    dw  254     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  255     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  256     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  257     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  258     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  259     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    
    dw  260     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left  dw GroundTarget_0_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,      0   db 0


    ; 760px on image: counter at 280
    dw  280     db  GROUND_TARGET,          240   dw  0                                dw GroundTarget_1_Struct,                  0,  0, GROUND_TARGET_DONT_HAVE_ITEM   db 0


    dw  350     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                       dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,            0   db 0
    dw  355     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left   dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,            0   db 0
    dw  356     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,            0   db 0
    dw  357     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,            0   db 0


    dw  360     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    ;dw  365     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0

    dw  370     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    ;dw  375     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0

    dw  380     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0
    dw  385     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0

    dw  390     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw  395     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0

    dw  400     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  410     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0,             0   db 0
    ; dw  415     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left   dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    ; dw  416     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    ; dw  417     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0


    ; 720px on image: counter at 440
    dw  440     db  GROUND_TARGET,          224   dw  0                                dw GroundTarget_2_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0

    ;dw  499     db  GROUND_TARGET,          0     dw  0       dw GroundTarget_0_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0


    dw  500     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    dw  505     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  510     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  515     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0




    dw  520     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  525     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  530     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0
    dw  535     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  540     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  545     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  550     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  555     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  560     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P
    dw  565     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0




    dw  650     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    dw  655     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  656     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  657     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  660     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  670     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  680     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0
    dw  690     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  700     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  710     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw  820      db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  821      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw  822      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw  823      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw  830      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw  831      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw  832      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw  835      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  836      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  837      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  838      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  839      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  840      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  841      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

    dw  950      db  ENEMY_TYPE_1,           32   dw  EnemyData_5                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_P
    dw  951      db  ENEMY_TYPE_1,           64   dw  EnemyData_5                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_p
    dw  952      db  ENEMY_TYPE_1,           96   dw  EnemyData_5                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_p
    dw  960      db  ENEMY_TYPE_1,          128   dw  EnemyData_5                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_p        
    dw  961      db  ENEMY_TYPE_1,          160   dw  EnemyData_5                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_p
    dw  962      db  ENEMY_TYPE_1,          192   dw  EnemyData_5                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_p

    ; 560px on image: counter at 1080
    dw 1080     db  GROUND_TARGET,           42   dw  0                                dw GroundTarget_0_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1160     db  GROUND_TARGET,           46   dw  0                                dw GroundTarget_1_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1161     db  GROUND_TARGET,           22   dw  0                                dw GroundTarget_2_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1240     db  GROUND_TARGET,            8   dw  0                                dw GroundTarget_3_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1241     db  GROUND_TARGET,           28   dw  0                                dw GroundTarget_4_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1242     db  GROUND_TARGET,           50   dw  0                                dw GroundTarget_5_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0

    
    

    dw 2000     db  ENEMY_TYPE_1,          255    dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0

    dw 2500     db  ENEMY_TYPE_1,          255    dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0

    dw 3000     db  ENEMY_TYPE_1,          255    dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0

    ;dw 3327 ; last LevelCounter for Level 1 BG

    ; end marking of level data
    dw  0
