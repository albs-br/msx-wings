; Boss_Reset:
;     xor     a
;     ld      (Boss_Struct.Status), a     ; Status

;     ld      a, 255
;     ld      (Boss_Struct.X), a     ; X

;     ;ld      a, 192      ; place sprite off screen
;     ld      a, (VerticalScroll)     ; place sprite off screen
;     add     192
;     ld      (Boss_Struct.Y), a     ; Y

;     ld      a, 192
;     ld      (Boss_Struct.Y_Static), a     ; Y static

;     ; set sprite patterns to empty
;     ld      a, EMPTY_SPR_PAT_NUMBER
;     ld      (Boss_Struct.Pattern_0), a
;     ld      (Boss_Struct.Pattern_1), a


;     ; TODO: should other fields be reset too?

;     ret
