
EnemyShotDeltaX_size:   equ EnemyShotDeltaX_45_degrees_left_fast.end - EnemyShotDeltaX_45_degrees_left_fast    ; all delta X sequences for Enemy Shot have the same size

; values should be in -2, +2 range

; ------------------------------------- 45° left ----------------------------------------

EnemyShotDeltaX_45_degrees_left_fast:  
                    db -1, -1, 255
.end:
;DeltaY:  
                    db  2,  2, 255

; ------------------------------------- 22.5° left ----------------------------------------

EnemyShotDeltaX_22_degrees_left_fast:
                    db  0, -1, 255

;DeltaY:  
                    db  2,  2, 255

; ------------------------------------- 0° (center) ----------------------------------------

EnemyShotDeltaX_0_degrees_center_fast:  
                    db  0,  0, 255

;DeltaY:
                    db  2,  2, 255

; ------------------------------------- 22.5° right ----------------------------------------

EnemyShotDeltaX_22_degrees_right_fast:
                    db  0,  1, 255

;DeltaY:
                    db  2,  2, 255

; ------------------------------------- 45° right ----------------------------------------

EnemyShotDeltaX_45_degrees_right_fast:  
                    db  1,  1, 255

;DeltaY:  
                    db  2,  2, 255
