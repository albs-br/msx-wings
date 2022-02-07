; Input
;   HL: addr of player shot struct
PlayerShot_Reset:
    xor     a
    ld      (hl), a     ; Status

    inc     hl
    ld      a, 255
    ld      (hl), a     ; X

    inc     hl
    ; ld      a, 192
    ; ld      (hl), a     ; Y

    inc     hl
    ld      a, 192
    ld      (hl), a     ; Y static

    ret
