
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



    dw  35      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  36      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  37      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  38      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  39      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  40      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  41      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0
    ; test debug trap    
    ;dw  42      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0

    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    dw  170     db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  171     db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  172     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  174     db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    
    dw  185     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  186     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  187     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  188     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  190     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  191     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  192     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    dw  213     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  214     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  215     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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

    ; 760px on image: counter at 280
    dw  280     db  GROUND_TARGET,          240   dw  0                                dw GroundTarget_1_Struct,                  0,  0, GROUND_TARGET_DONT_HAVE_ITEM   db 0

    dw  340     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    dw  341     db  ENEMY_TYPE_1,           112   dw  EnemyData_0                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  342     db  ENEMY_TYPE_1,           144   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  343     db  ENEMY_TYPE_1,           176   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_P

    dw  350     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow  dw GroundTarget_0_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,      0   db 0

    dw  374     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  375     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  376     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  377     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  378     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_1_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  379     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    
    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



    ; 720px on image: counter at 440
    dw  440     db  GROUND_TARGET,          224   dw  0                                dw GroundTarget_2_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0



    dw  441     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                       dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,            0   db 0
    dw  465     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,            0   db 0
    dw  466     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,            0   db 0
    dw  467     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,            0   db 0


    dw  500     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    ;dw  365     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0

    dw  510     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    ;dw  375     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0




    dw  521     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0
    dw  525     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0

    dw  530     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw  535     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0

    dw  540     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  550     db  ENEMY_TYPE_1,           80    dw  EnemyData_0                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0,             0   db 0
    ; dw  415     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left   dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,       0
    ; dw  416     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,       0
    ; dw  417     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right  dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,       0

    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    ;dw  499     db  GROUND_TARGET,          0     dw  0       dw GroundTarget_0_Struct, GROUND_TARGET_SPRCOL_ADDR, 0,       0


    dw  620     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    dw  625     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0

    dw  630     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  635     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0




    dw  660     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  665     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0

    dw  700     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0
    dw  705     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
      
    dw  710     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  715     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
      
    dw  720     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  725     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    dw  730     db  ENEMY_TYPE_1,           128   dw  EnemyData_4                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P
    dw  735     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0


    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    dw  830     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    dw  835     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  836     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_0_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  837     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0






    dw  960     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  970     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  980     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    dw  981     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_1_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    ; dw  982     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    ; dw  989     db  ENEMY_SHOT_TYPE_1,        0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0

    dw  990     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw 1000     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw 1010     db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB



    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    ; 560px on image: counter at 1080
    dw 1080     db  GROUND_TARGET,           42   dw  0                                dw GroundTarget_0_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0



    dw 1120      db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw 1121      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw 1122      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw 1123      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw 1130      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw 1131      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw 1132      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw 1135      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw 1136      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw 1137      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw 1138      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw 1139      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw 1140      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw 1141      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    dw 1160     db  GROUND_TARGET,           46   dw  0                                dw GroundTarget_1_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1161     db  GROUND_TARGET,           22   dw  0                                dw GroundTarget_2_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1240     db  GROUND_TARGET,            8   dw  0                                dw GroundTarget_3_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1241     db  GROUND_TARGET,           28   dw  0                                dw GroundTarget_4_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0
    dw 1242     db  GROUND_TARGET,           50   dw  0                                dw GroundTarget_5_Struct,                  0,  0,       GROUND_TARGET_HAS_ITEM   db 0


    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    dw 1260      db  ENEMY_TYPE_1,           32   dw  EnemyData_5                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_P
    dw 1261      db  ENEMY_TYPE_1,           64   dw  EnemyData_5                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_p
    dw 1262      db  ENEMY_TYPE_1,           96   dw  EnemyData_5                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_p
    dw 1270      db  ENEMY_TYPE_1,          128   dw  EnemyData_5                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_p        
    dw 1271      db  ENEMY_TYPE_1,          160   dw  EnemyData_5                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_p
    dw 1272      db  ENEMY_TYPE_1,          192   dw  EnemyData_5                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_p

    dw 1313      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw 1314      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw 1315      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw 1316      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw 1317      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw 1318      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0

    
    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_9: equ 1260 + 140

;                                                           Initial_X                                     EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr                |                    SPRCOL_Addr
;       |                           |                       |         |                                   |                    |
    dw  .Enemy_Wave_9 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_5                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_9 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_9 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_9 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_9 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_9 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_P



    dw  .Enemy_Wave_9 + 35      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_9 + 36      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_9 + 37      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_9 + 38      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw  .Enemy_Wave_9 + 39      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_9 + 40      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_9 + 41      db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_10: equ 1560

    dw .Enemy_Wave_10 + 0       db  ENEMY_TYPE_1,           32   dw  EnemyData_1                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw .Enemy_Wave_10 + 1       db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0, Item_1_Struct   db ITEM_BOMB
    dw .Enemy_Wave_10 + 2       db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0, Item_2_Struct   db ITEM_BOMB
    dw .Enemy_Wave_10 + 3       db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0, Item_3_Struct   db ITEM_BOMB
    dw .Enemy_Wave_10 + 10      db  ENEMY_TYPE_1,           64   dw  EnemyData_1                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0, Item_4_Struct   db ITEM_BOMB
    dw .Enemy_Wave_10 + 11      db  ENEMY_TYPE_1,           96   dw  EnemyData_1                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0, Item_5_Struct   db ITEM_BOMB
    dw .Enemy_Wave_10 + 12      db  ENEMY_TYPE_1,          128   dw  EnemyData_1                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_BOMB

    dw .Enemy_Wave_10 + 15      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw .Enemy_Wave_10 + 16      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_6_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw .Enemy_Wave_10 + 17      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_6_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw .Enemy_Wave_10 + 18      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0
    dw .Enemy_Wave_10 + 19      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw .Enemy_Wave_10 + 20      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_left_slow  dw Enemy_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw .Enemy_Wave_10 + 21      db  ENEMY_SHOT_TYPE_1,       0   dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0

    ; ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

.Enemy_Wave_11: equ 1700


    dw  .Enemy_Wave_10 + 0      db  ENEMY_TYPE_1,           64    dw  EnemyData_2                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0, Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_10 + 1      db  ENEMY_TYPE_1,           96    dw  EnemyData_2                      dw Enemy_1_Struct,      ENEMY_1_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10 + 2      db  ENEMY_TYPE_1,           128   dw  EnemyData_2                      dw Enemy_2_Struct,      ENEMY_2_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10 + 4      db  ENEMY_TYPE_1,           160   dw  EnemyData_2                      dw Enemy_3_Struct,      ENEMY_3_SPRCOL_ADDR,                  0,             0   db 0

    
    dw  .Enemy_Wave_10 + 15     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_0_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 16     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow dw Enemy_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 17     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 18     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow dw Enemy_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,             0   db 0



    dw  .Enemy_Wave_10 + 20     db  ENEMY_TYPE_1,           80    dw  EnemyData_2                      dw Enemy_4_Struct,      ENEMY_4_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10 + 21     db  ENEMY_TYPE_1,           112   dw  EnemyData_2                      dw Enemy_5_Struct,      ENEMY_5_SPRCOL_ADDR,                  0,             0   db 0
    dw  .Enemy_Wave_10 + 22     db  ENEMY_TYPE_1,           144   dw  EnemyData_2                      dw Enemy_6_Struct,      ENEMY_6_SPRCOL_ADDR,                  0, Item_6_Struct   db ITEM_P

    dw  .Enemy_Wave_10 + 23     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 24     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,             0   db 0
    dw  .Enemy_Wave_10 + 25     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow dw Enemy_6_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,             0   db 0








    ; dw 2000     db  ENEMY_TYPE_1, ENEMY_X_EQUAL_PLAYER_X  dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    
    ; dw 2500     db  ENEMY_TYPE_1, ENEMY_X_EQUAL_PLAYER_X  dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0
    
    ; dw 3000     db  ENEMY_TYPE_1, ENEMY_X_EQUAL_PLAYER_X  dw  EnemyData_4                      dw Enemy_0_Struct,      ENEMY_0_SPRCOL_ADDR,                  0,             0   db 0

    ;dw 3327 ; last LevelCounter for Level 1 BG

    ; end marking of level data
    dw  0
