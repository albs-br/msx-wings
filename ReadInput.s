PLANE_PLAYER_WIDTH:             equ 21
PLANE_PLAYER_HEIGHT:            equ 31
PLANE_PLAYER_PIXELS_PER_MOV:    equ 3

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
    sub     PLANE_PLAYER_PIXELS_PER_MOV
    ret     c
    ld      (Player_X), a

    ; ; clear 7th bit (key right)
    ; ld      a, e
    ; or      1000 0000b
    ; ld      e, a

    ret

.playerRight:
    ld      a, (Player_X)
    add     PLANE_PLAYER_PIXELS_PER_MOV
    cp      255 - PLANE_PLAYER_WIDTH
    ret     nc
    ld      (Player_X), a

    ; ; clear 4th bit (key left)
    ; ld      a, e
    ; or      0001 0000b
    ; ld      e, a

    ret

.playerUp:
    ld      a, (Player_Y_Static)
    sub     PLANE_PLAYER_PIXELS_PER_MOV
    ret     c
    ld      (Player_Y_Static), a

    ld      a, (Player_Y)
    sub     PLANE_PLAYER_PIXELS_PER_MOV
    ld      (Player_Y), a

    ret

.playerDown:
    ld      a, (Player_Y_Static)
    add     PLANE_PLAYER_PIXELS_PER_MOV
    cp      191 - PLANE_PLAYER_HEIGHT
    ret     nc
    ld      (Player_Y_Static), a

    ld      a, (Player_Y)
    add     PLANE_PLAYER_PIXELS_PER_MOV
    ld      (Player_Y), a

    ret

.shot:
    ; TODO: get current shot
    ld      hl, PlayerShot_0_Struct
    call    PlayerShot_Init

    ret

