NUMBER_OF_PLAYER_SHOTS:         equ 6

GameLogic:

    ; loop through all player shots
;     ld      b, NUMBER_OF_PLAYER_SHOTS
;     ld      hl, PlayerShot_0_Struct

; .loop:
;     ld      a, (hl)
;     jp      z, .next
    
; .next:    
;     ld      de, PlayerShot_Temp_Struct.size

;     djnz    .loop


    ld      hl, PLAYER_SHOT_ADDR_JUMP_TABLE
    ld      b, NUMBER_OF_PLAYER_SHOTS

.loop:
    ; get the address pointed by HL and put it in HL
    ld      a, (hl)     ; least significant byte of addr
    inc     hl
    ld      h, (hl)     ; most significant byte of addr
    ld      l, a

    ; if (Status == 0) next
    ld      a, (hl)
    or      a
    jp      z, .next

    ; else
    push    hl
        push    bc
            ; call    PlayerShotLogic
        pop     bc
    pop     hl

.next:
    inc     hl

    djnz    .loop

    ret

PLAYER_SHOT_ADDR_JUMP_TABLE:        dw      PlayerShot_0_Struct, PlayerShot_1_Struct, PlayerShot_2_Struct, PlayerShot_3_Struct, PlayerShot_4_Struct, PlayerShot_5_Struct