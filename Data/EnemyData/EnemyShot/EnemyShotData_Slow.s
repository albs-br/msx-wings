
; values should be in -2, +2 range

; ------------------------------------- 45° left ----------------------------------------

EnemyShotDeltaX_45_degrees_left_slow:  
                    db -1, -1, 255
.end:
;DeltaY:  
                    db  1,  1, 255

; ------------------------------------- 22.5° left ----------------------------------------

EnemyShotDeltaX_22_degrees_left_slow:
                    db  0, -1, 255

;DeltaY:  
                    db  1,  1, 255

; ------------------------------------- 0° (center) ----------------------------------------

EnemyShotDeltaX_0_degrees_center_slow:  
                    db  0,  0, 255

;DeltaY:
                    db  1,  1, 255

; ------------------------------------- 22.5° right ----------------------------------------

EnemyShotDeltaX_22_degrees_right_slow:
                    db  0,  1, 255

;DeltaY:
                    db  1,  1, 255

; ------------------------------------- 45° right ----------------------------------------

EnemyShotDeltaX_45_degrees_right_slow:  
                    db  1,  1, 255

;DeltaY:  
                    db  1,  1, 255
