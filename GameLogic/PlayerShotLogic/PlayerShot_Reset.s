; Input
;   HL: addr of player shot struct
PlayerShot_Reset:

    ; reset all struct fields
    push    hl
        ld      b, PlayerShot_Temp_Struct.size
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
    ld      (hl), a     ; pattern number 0

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; pattern number 1

    ret
