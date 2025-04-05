Level_3_Data:
; ;                                           Initial_X                      EnemyStruct_Addr
; ;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
; ;       |           |                       |         |                    |               |
;     dw  100     db  GROUND_TARGET,          0     dw  0       dw GroundTarget_0_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  101     db  GROUND_TARGET,          32    dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  102     db  GROUND_TARGET,          64    dw  0       dw GroundTarget_2_Struct, 0,                         0,       GROUND_TARGET_DONT_HAVE_ITEM db 0
;     dw  103     db  GROUND_TARGET,          96    dw  0       dw GroundTarget_3_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  104     db  GROUND_TARGET,          128   dw  0       dw GroundTarget_4_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
;     dw  105     db  GROUND_TARGET,          160   dw  0       dw GroundTarget_5_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0

;     dw  110     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_fast  dw GroundTarget_2_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
;     dw  111     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_fast   dw GroundTarget_1_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
;     dw  112     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_fast  dw GroundTarget_0_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
;     dw  113     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
;     dw  123     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
;     dw  133     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
;     dw  143     db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_fast  dw GroundTarget_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0


.Enemy_Wave_1: equ 0

;                                                           Initial_X                      EnemyStruct_Addr
;       Counter                     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |                           |                       |         |                    |               |
    dw  .Enemy_Wave_1 + 10      db  ENEMY_TYPE_1,           32    dw  EnemyData_5     dw Enemy_0_Struct, ENEMY_0_SPRCOL_ADDR,      0,       Item_0_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_1 + 11      db  ENEMY_TYPE_1,           64    dw  EnemyData_5     dw Enemy_1_Struct, ENEMY_1_SPRCOL_ADDR,      0,       Item_1_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_1 + 12      db  ENEMY_TYPE_1,           96    dw  EnemyData_5     dw Enemy_2_Struct, ENEMY_2_SPRCOL_ADDR,      0,       Item_2_Struct   db ITEM_BOMB
    dw  .Enemy_Wave_1 + 20      db  ENEMY_TYPE_1,           128   dw  EnemyData_5     dw Enemy_3_Struct, ENEMY_3_SPRCOL_ADDR,      0,       Item_3_Struct   db ITEM_P        
    dw  .Enemy_Wave_1 + 21      db  ENEMY_TYPE_1,           160   dw  EnemyData_5     dw Enemy_4_Struct, ENEMY_4_SPRCOL_ADDR,      0,       Item_4_Struct   db ITEM_P
    dw  .Enemy_Wave_1 + 22      db  ENEMY_TYPE_1,           192   dw  EnemyData_5     dw Enemy_5_Struct, ENEMY_5_SPRCOL_ADDR,      0,       Item_5_Struct   db ITEM_P





; first ground target: 234 X 1525

; first visible line of BG: 1791

    ; -------------------------------------------
    ; ground target position rules (for level 3):

    ; H = height                  C = counter
    ; |                           |    
    ; 1790px on image: counter at 0
    ; 1780px on image: counter at 40
    ; 1770px on image: counter at 80

    ; each -10px = +40 on counter

    ; formula:
    ; C = (1790 - H) * 4
    ; -------------------------------------------

;                                           Initial_X                      EnemyStruct_Addr
;       Counter     ActionType              |         Delta_X_Initial_Addr |               SPRCOL_Addr
;       |           |                       |         |                    |               |
    dw  1060    db  GROUND_TARGET,          230   dw  0       dw GroundTarget_0_Struct, 0,                         0,       GROUND_TARGET_DONT_HAVE_ITEM db 0
    dw  1116    db  GROUND_TARGET,          150   dw  0       dw GroundTarget_1_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    


    dw  1760    db  GROUND_TARGET,          137   dw  0       dw GroundTarget_2_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  1780    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_2_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  1781    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_2_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  1782    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_2_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  1820    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow   dw GroundTarget_2_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  1821    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_2_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0



    dw  2008    db  GROUND_TARGET,          137   dw  0       dw GroundTarget_3_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2030    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_3_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  2031    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_3_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2070    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow   dw GroundTarget_3_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  2071    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_3_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0
    dw  2072    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_3_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0



    dw  2268    db  GROUND_TARGET,          137   dw  0       dw GroundTarget_4_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2290    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_4_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  2291    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  2330    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_left_slow   dw GroundTarget_4_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    dw  2331    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2332    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_4_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0



    dw  2536    db  GROUND_TARGET,          53    dw  0       dw GroundTarget_5_Struct, 0,                         0,       GROUND_TARGET_HAS_ITEM       db 0
    dw  2561    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_2_SPRCOL_ADDR, EnemyShot_2_Struct,          0   db 0
    dw  2562    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_3_SPRCOL_ADDR, EnemyShot_3_Struct,          0   db 0
    dw  2563    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_4_SPRCOL_ADDR, EnemyShot_4_Struct,          0   db 0
    dw  2564    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_45_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_5_SPRCOL_ADDR, EnemyShot_5_Struct,          0   db 0
    
    dw  2661    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_left_slow   dw GroundTarget_5_Struct, ENEMY_SHOT_6_SPRCOL_ADDR, EnemyShot_6_Struct,          0   db 0
    dw  2662    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_0_degrees_center_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_0_SPRCOL_ADDR, EnemyShot_0_Struct,          0   db 0
    dw  2663    db  ENEMY_SHOT_TYPE_1,      0     dw  EnemyShotDeltaX_22_degrees_right_slow  dw GroundTarget_5_Struct, ENEMY_SHOT_1_SPRCOL_ADDR, EnemyShot_1_Struct,          0   db 0

    ;dw 7100 ; last LevelCounter for Level 3 BG

    ; end marking of level data
    dw  0
