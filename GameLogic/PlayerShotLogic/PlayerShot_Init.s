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
    ; check if double shot is enabled
    ld      a, (Player_Shot_Width)
    cp      PLAYER_SHOT_WIDTH_DOUBLE
    ld      a, (Player_X)
    jp      nz, .continue_0

    sub     8 ; on double shot, adjust 8px left to centralize

.continue_0:
    add     2 ; small adjust to centralize (due to the fact that the player sprite isn't centralized on the 32x32 box?)
    ld      (hl), a     ; X



    inc     hl
    ld      a, (Player_Y)
    sub     16
    ld      (hl), a     ; Y

    inc     hl
    ld      a, (Player_Y_Static)
    sub     16
    ld      (hl), a     ; Y static

    inc     hl
    ld      a, PLAYER_SHOT_SPR_PAT_NUMBER
    ld      (hl), a     ; pattern number 0

    ; check if double shot is enabled
    ld      a, (Player_Shot_Width)
    cp      PLAYER_SHOT_WIDTH_DOUBLE
    jp      nz, .continue_1

    inc     hl
    ld      a, PLAYER_SHOT_SPR_PAT_NUMBER
    ld      (hl), a     ; pattern number 1

.continue_1:

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
