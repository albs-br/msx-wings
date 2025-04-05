
; X values should be in -1, +1 range
; Y values should be in -2, +2 range

; ------------------------------------- 45° left ----------------------------------------

EnemyShotDeltaX_45_degrees_left_slow:  
                    db -1, -1, 128 ; 128 = end of data
.end:
;DeltaY:  
                    db  1,  1, 128 ; 128 = end of data

; ------------------------------------- 22.5° left ----------------------------------------

EnemyShotDeltaX_22_degrees_left_slow:
                    db  0, -1, 128 ; 128 = end of data

;DeltaY:  
                    db  1,  1, 128 ; 128 = end of data

; ------------------------------------- 0° (center) ----------------------------------------

EnemyShotDeltaX_0_degrees_center_slow:  
                    db  0,  0, 128 ; 128 = end of data

;DeltaY:
                    db  1,  1, 128 ; 128 = end of data

; ------------------------------------- 22.5° right ----------------------------------------

EnemyShotDeltaX_22_degrees_right_slow:
                    db  0,  1, 128 ; 128 = end of data

;DeltaY:
                    db  1,  1, 128 ; 128 = end of data

; ------------------------------------- 45° right ----------------------------------------

EnemyShotDeltaX_45_degrees_right_slow:  
                    db  1,  1, 128 ; 128 = end of data

;DeltaY:  
                    db  1,  1, 128 ; 128 = end of data
