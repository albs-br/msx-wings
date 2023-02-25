; Input
;   HL: addr of item struct
Item_Reset:

    ; reset all struct fields
    push    hl
        ld      b, Item_Temp_Struct.size
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

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; Pattern 1

    ret