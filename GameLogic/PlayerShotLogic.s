
FRAMES_BETWEEN_PLAYER_SHOTS:        equ 4

; Input
;   HL: addr of player shot struct
PlayerShot_Init:

    ; if (Player_FramesSinceLastShot < FRAMES_BETWEEN_PLAYER_SHOTS) ret
    ld      a, (Player_FramesSinceLastShot)
    cp      FRAMES_BETWEEN_PLAYER_SHOTS
    ret     c

    xor     a
    ld      (Player_FramesSinceLastShot), a



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

    ; next shot
    ld      hl, (NextShot_Struct_Addr)

    ld      bc, PlayerShot_Temp_Struct.size
    add     hl, bc

    ld      de, PlayerShot_2_Struct + PlayerShot_Temp_Struct.size
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp      nz, .dontResetNextShot

    ld      hl, PlayerShot_0_Struct     ; reset next shot

.dontResetNextShot:
    ld      (NextShot_Struct_Addr), hl


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
