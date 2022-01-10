;NUMBER_OF_PLAYER_SHOTS:         equ 6

GameLogic:

    ld      hl, PlayerShot_0_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_1_Struct
    call    PlayerShot_Logic
    ld      hl, PlayerShot_2_Struct
    call    PlayerShot_Logic
    ; ld      hl, PlayerShot_3_Struct
    ; call    PlayerShot_Logic
    ; ld      hl, PlayerShot_4_Struct
    ; call    PlayerShot_Logic
    ; ld      hl, PlayerShot_5_Struct
    ; call    PlayerShot_Logic


    ; -------------------------------------------

    ld      hl, Enemy_0_Struct
    call    Enemy_Logic
    ld      hl, Enemy_1_Struct
    call    Enemy_Logic
    ld      hl, Enemy_2_Struct
    call    Enemy_Logic
    ld      hl, Enemy_3_Struct
    call    Enemy_Logic
    ld      hl, Enemy_4_Struct
    call    Enemy_Logic
    ld      hl, Enemy_5_Struct
    call    Enemy_Logic

    ; -------------------------------------------

    ld      hl, (LevelCounter)
    inc     hl
    ld      (LevelCounter), hl


    ;ld      hl, Level_1_Data
    ld      hl, (LevelData_CurrentAddr)
    ld      de, (LevelCounter)
.loop:
    push    hl      ; CAUTION: these two PUSHes are POPed in two different places!
        push    de
            ; HL = level data of current position
            ld      a, (hl)
            inc     hl
            ld      h, (hl)
            ld      l, a

            ; if (LevelData == 0x0000) exit
            or      h
            jp      z, .endOfLevelData

            ; DE = level counter
            call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
        pop     de
    pop     hl

    ld      (LevelData_CurrentAddr), hl
    jp      z, .executeLevelData
    jp      nc, .exitLevelData           ; if (HL > DE)

    ; next LevelData
    ld      bc, LevelData_Temp_Struct.size
    add     hl, bc
    jp      .loop

.endOfLevelData:
        pop     de                  ; not a good practice :P
    pop     hl
    jp      .exitLevelData

.executeLevelData:
    ;call BIOS_BEEP; debug
    ;jp .executeLevelData ; debug

    ;ld      hl, Enemy_1_Struct
    ld      de, (LevelData_CurrentAddr)
    call    Enemy_Init
    ; TODO: all other enemies

.exitLevelData:





    ; -------------------------------------------

    ; if (Player_FramesSinceLastShot == 255) ret
    ld      a, (Player_FramesSinceLastShot)
    inc     a
    ret     z
    ; else Player_FramesSinceLastShot ++ 
    ld      (Player_FramesSinceLastShot), a


    ret
