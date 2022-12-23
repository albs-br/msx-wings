; Input
;   HL: addr of player shot struct
PlayerShot_Logic:
    ld      a, (hl)                 ; get Status
    or      a
    ;ret     z                       ; if (Status == 0) ret
    jp      z, .shotIsDisabled       ; if (Status == 0) .shotIsDisabled

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

; TODO: repeat this logic on all objects, there are sprites disabled being left on screen,
; it will cause problems with the 8 sprites per line limit
.shotIsDisabled:

    ; place sprite off screen    
    inc     hl
    inc     hl
    ld      a, (VerticalScroll)
    add     192
    ld      (hl), a     ; Y

    ret