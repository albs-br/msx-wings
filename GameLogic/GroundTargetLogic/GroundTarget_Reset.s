; Input
;   HL: addr of item struct
GroundTarget_Reset:
    xor     a
    ld      (hl), a     ; Status

    inc     hl
    ld      a, 255
    ld      (hl), a     ; X

    inc     hl
    ld      a, 192      ; place sprite off screen
    ld      (hl), a     ; Y

    inc     hl
    ld      a, 192
    ld      (hl), a     ; Y static

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; Pattern 0

    ; not used
    ; inc     hl
    ; ld      a, EMPTY_SPR_PAT_NUMBER
    ; ld      (hl), a     ; Pattern 1

    ; TODO: should other fields be reset too?
    


    ; Ground target sprite attributes
    xor     a
    ld      (GroundTarget_Sprite.X), a

    ld      a, 192      ; place sprite off screen
    ld      (GroundTarget_Sprite.Y), a

    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a


    ret