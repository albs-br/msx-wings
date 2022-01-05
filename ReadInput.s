ReadInput:
    ; read keyboard
    ld      a, 8                    ; 8th line
    call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix




    push    af
        bit     0, a                    ; 0th bit (space bar)
        call    z, .shot
    pop     af

    bit     4, a                    ; 4th bit (key left)
    jp      z, .playerLeft

    bit     7, a                    ; 7th bit (key right)
    jp      z, .playerRight
    
    ret

.playerLeft:
    ld      a, (Player_X)
    sub     3
    ld      (Player_X), a

    ret

.playerRight:
    ld      a, (Player_X)
    add     3
    ld      (Player_X), a

    ret

.shot:
    ret