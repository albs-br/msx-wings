; all these enemy data sequences have the same size for all Enemy Datas
EnemyDeltaX_size:           equ EnemyData_0.deltaY - EnemyData_0.deltaX
EnemyDeltaY_size:           equ EnemyData_0.patternNumber - EnemyData_0.deltaY
EnemyPatternNumber_size:    equ EnemyData_0.offset_x1 - EnemyData_0.patternNumber
EnemyOffset_x1_size:        equ EnemyData_0.offset_y1 - EnemyData_0.offset_x1
EnemyOffset_y1_size:        equ EnemyData_0.SPRCOL_Addr - EnemyData_0.offset_y1


; Delta X values for enemy position on time
; values should be in -2, +2 range

EnemyData_0:
.deltaX:
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
                db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
                db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
                db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
.deltaY:
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
.patternNumber:  ; (0 means no change)
                db  ENEMY_FRAME_0_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
.offset_x1:     ; offsets will be changed only when pattern change, otherwise data will be ignored
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
.offset_y1:
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
.SPRCOL_Addr:
                dw  SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 

EnemyData_1:  
; .deltaX:
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
                db  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
                db  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
                db  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
; .deltaY:
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
; .patternNumber:  ; (0 means no change)
                db  ENEMY_FRAME_0_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_x1:     ; offsets will be changed only when pattern change, otherwise data will be ignored
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_y1:
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
;.SPRCOL_Addr:
                dw SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
EnemyData_2:  
; .deltaX:
                db  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
                db  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2
                db  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
                db -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2
                db -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
; .deltaY:
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
; .patternNumber:  ; (0 means no change)
                db  ENEMY_FRAME_0_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_x1:     ; offsets will be changed only when pattern change, otherwise data will be ignored
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_y1:
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
;.SPRCOL_Addr:
                dw SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 

EnemyData_4:  
; .deltaX:
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
; .deltaY:
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
; .patternNumber:  ; (0 means no change)
                db  ENEMY_FRAME_0_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_x1:     ; offsets will be changed only when pattern change, otherwise data will be ignored
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_y1:
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
                db  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8,  8
;.SPRCOL_Addr:
                dw SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 

; Enemy plane comes from top of screen, goes until bottom and flips backwards, returning to top of screen inverted
EnemyData_5:  
; .deltaX:
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
; .deltaY:
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  2,  2,  2,  2,  2,  2,  2,  2,  1,  1,  1,  1,  1,  1,  0,  0
                db  0,  0, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2
                db -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3 
                db -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3 
                db -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3 
;.patternNumber: (0 means no change)
                db  ENEMY_FRAME_0_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  ENEMY_FRAME_1_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0,  ENEMY_FRAME_2_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  ENEMY_FRAME_3_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  ENEMY_FRAME_4_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0 
                db  ENEMY_FRAME_5_SPR_PAT_0_NUMBER,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_x1:     ; offsets will be changed only when pattern change, otherwise data will be ignored
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  1,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  1,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0 
                db  1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_y1:
                db  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  4,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  8,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.SPRCOL_Addr:
                dw  SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  SpriteColors_EnemyPlane_Frame_1_Patterns_0_and_1,  0,  0,  0,  0,  0,  0,  0,  SpriteColors_EnemyPlane_Frame_2_Patterns_0_and_1,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  SpriteColors_EnemyPlane_Frame_3_Patterns_0_and_1,  0,  0,  0,  0,  0,  SpriteColors_EnemyPlane_Frame_4_Patterns_0_and_1,  0,  0,  0,  0,  0,  0,  0 
                dw  SpriteColors_EnemyPlane_Frame_5_Patterns_0_and_1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                dw  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 

; Enemy plane TURNING comes from top until bottom of screen
EnemyData_6:
; .deltaX:
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
; .deltaY:
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
                db  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3 
;.patternNumber: (0 means no change)
                db  ENEMY_PLANE_TURNING_FRAME_0_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_1_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_2_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_3_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_4_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_5_SPR_PAT_0_NUMBER
                db  0, 0, ENEMY_PLANE_TURNING_FRAME_6_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_7_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_0_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_1_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_2_SPR_PAT_0_NUMBER, 0
                db  0, ENEMY_PLANE_TURNING_FRAME_3_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_4_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_5_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_6_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_7_SPR_PAT_0_NUMBER, 0, 0
                ;
                db  ENEMY_PLANE_TURNING_FRAME_0_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_1_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_2_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_3_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_4_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_5_SPR_PAT_0_NUMBER
                db  0, 0, ENEMY_PLANE_TURNING_FRAME_6_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_7_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_0_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_1_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_2_SPR_PAT_0_NUMBER, 0
                db  0, ENEMY_PLANE_TURNING_FRAME_3_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_4_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_5_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_6_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_7_SPR_PAT_0_NUMBER, 0, 0
                ;
                db  ENEMY_PLANE_TURNING_FRAME_0_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_1_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_2_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_3_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_4_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_5_SPR_PAT_0_NUMBER
                db  0, 0, ENEMY_PLANE_TURNING_FRAME_6_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_7_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_0_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_1_SPR_PAT_0_NUMBER, 0, 0, ENEMY_PLANE_TURNING_FRAME_2_SPR_PAT_0_NUMBER, 0
;.offset_x1:     ; offsets will be changed only when pattern change, otherwise data will be ignored
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
                db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 
;.offset_y1:
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
                db  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9,  9 
;.SPRCOL_Addr:
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
                dw  SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1,SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1, SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1,  SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1
