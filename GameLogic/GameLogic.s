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


    call    PlayerEngineAnimation


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
    ld      hl, Enemy_6_Struct
    call    Enemy_Logic

    ; -------------------------------------------

    ld      hl, EnemyShot_0_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_1_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_2_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_3_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_4_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_5_Struct
    call    EnemyShot_Logic
    ld      hl, EnemyShot_6_Struct
    call    EnemyShot_Logic

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

    ld      de, (LevelData_CurrentAddr)
    ld      b, d
    ld      c, e
    inc     bc
    inc     bc
    ld      a, (bc)         ; switch (LevelData_Temp_EnemyType)
    
    cp      ENEMY_TYPE_1
    call    z, Enemy_Init
    
    cp      ENEMY_SHOT_TYPE_1
    call    z, EnemyShot_Init

.exitLevelData:





    ; -------------------------------------------

    ; if (Player_FramesSinceLastShot == 255) ret
    ld      a, (Player_FramesSinceLastShot)
    inc     a
    ret     z
    ; else Player_FramesSinceLastShot ++ 
    ld      (Player_FramesSinceLastShot), a


    ret




PlayerEngineAnimation:

    ld      a, (BIOS_JIFFY)
    and     0000 1111 b
    cp      7
    jp      z, .frame_0
    cp      15
    jp      z, .frame_1
    ret

.frame_0:

    ; Spr 2 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 12
    call    SetVdp_Write
    ;ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_0.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, ColorsPlayerPlaneEngine_Frame_0
    otir

    ; Spr 3 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 16 + 12
    call    SetVdp_Write
    ; ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_0.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, 0 + ColorsPlayerPlaneEngine_Frame_0 + (ColorsPlayerPlaneEngine_Frame_0.size / 2)
    otir

    ret

.frame_1:

    ; Spr 2 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 12
    call    SetVdp_Write
    ; ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_1.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, ColorsPlayerPlaneEngine_Frame_1
    otir

    ; Spr 3 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 16 + 12
    call    SetVdp_Write
    ; ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_1.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, 0 + ColorsPlayerPlaneEngine_Frame_1 + (ColorsPlayerPlaneEngine_Frame_1.size / 2)
    otir

    ret

ColorsPlayerPlaneEngine_Frame_0:
    db  0x08, 0x0c, 0x0c          ; first sprite (outer colors)
    db  0x0d, 0x08, 0x00          ; second sprite (inner colors)
.size:  equ $ - ColorsPlayerPlaneEngine_Frame_0

ColorsPlayerPlaneEngine_Frame_1:
    db  0x0d, 0x08, 0x08          ; first sprite (outer colors)
    db  0x0d, 0x0d, 0x00          ; second sprite (inner colors)
.size:  equ $ - ColorsPlayerPlaneEngine_Frame_1