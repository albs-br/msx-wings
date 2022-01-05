ReadInput:
    ; read keyboard
    ld      a, 8                    ; 8th line
    call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix
    ld      e, a                    ; save value


    bit     0, a                    ; 0th bit (space bar)
    call    z, .shot

    ld      a, e
    bit     4, a                    ; 4th bit (key left)
    call    z, .playerLeft

    ld      a, e
    bit     7, a                    ; 7th bit (key right)
    call    z, .playerRight
    
    ld      a, e
    bit     5, a                    ; 5th bit (key up)
    call    z, .playerUp

    ld      a, e
    bit     6, a                    ; 6th bit (key down)
    call    z, .playerDown

    ret

.playerLeft:
    ld      a, (Player_X)
    sub     3
    ret     c
    ld      (Player_X), a

    ret

.playerRight:
    ld      a, (Player_X)
    add     3
    cp      240
    ret     nc
    ld      (Player_X), a

    ret

.playerUp:
    ld      a, (Player_Y)
    sub     3
    ;ret     c
    ld      (Player_Y), a

    ret

.playerDown:
    ld      a, (Player_Y)
    add     3
    ;ret     c
    ld      (Player_Y), a

    ret

.shot:
    ret

