; Input
;   HL: addr of item struct
GroundTarget_Reset:

    ; reset all struct fields
    push    hl
        ld      b, GroundTarget_Temp_Struct.size
        call    ClearRamArea
    pop     hl


    xor     a
    ld      (hl), a     ; Status

    inc     hl
    ld      a, 255
    ld      (hl), a     ; X

    inc     hl
    ;ld      a, 192      ; place sprite off screen
    ld      a, (VerticalScroll)     ; place sprite off screen
    add     192
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



    ; Ground target sprite attributes
    xor     a
    ld      (GroundTarget_Sprite.X), a

    ;ld      a, 192      ; place sprite off screen
    ld      a, (VerticalScroll)     ; place sprite off screen
    add     192
    ld      (GroundTarget_Sprite.Y), a

    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a


    ret