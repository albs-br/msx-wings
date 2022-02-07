; Input
;   HL: addr of player shot struct
PlayerShot_Logic:
    ld      a, (hl)                 ; get Status
    or      a
    ret     z                       ; if (Status == 0) ret

    inc     hl
    inc     hl
    inc     hl
    ld      a, (hl)                 ; Y static
    cp      8
    jp      c, .shotReset           ; if (Y < 8) shotReset
    sub     8
    ld      (hl), a


    dec     hl
    ld      a, (hl)                 ; Y
    sub     8
    ld      (hl), a

    ret

.shotReset:
    dec     hl                      ; back to start of struct
    dec     hl
    dec     hl
    call    PlayerShot_Reset
    ret
