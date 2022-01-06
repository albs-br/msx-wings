NUMBER_OF_PLAYER_SHOTS:         equ 6

GameLogic:

    ld      hl, PlayerShot_0_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_1_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_2_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_3_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_4_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_5_Struct
    call    PlayerShot_Logic


    ret

;PLAYER_SHOT_ADDR_JUMP_TABLE:        dw      PlayerShot_0_Struct, PlayerShot_1_Struct, PlayerShot_2_Struct, PlayerShot_3_Struct, PlayerShot_4_Struct, PlayerShot_5_Struct


; Input
;   HL: addr of player shot struct
PlayerShot_Init:
    ld      a, (hl)     ; Status
    or      a
    ret     nz          ; if (status != 0) ret


    ld      a, (Player_Y_Static)
    cp      16
    ret     c           ; if (Player_Y_Static < 16) ret


    inc     a
    ld      (hl), a     ; set Status = 1

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a     ; X

    inc     hl
    ld      a, (Player_Y)
    sub     16
    ld      (hl), a     ; Y

    inc     hl
    ld      a, (Player_Y_Static)
    sub     16
    ld      (hl), a     ; Y static

    ret

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