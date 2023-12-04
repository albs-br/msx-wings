; Inputs:
;   BC: X and Y static of 16x16 object
;   HL: PlayerShot struct addr
; Output:
;   Carry set: collision
;   Carry reset: no collision
; Obs.: Preserves HL
CheckCol_16x16_Object_PlayerShot:
    ld      a, (hl)    ; Status
    or      a
    ret     z ; jp      z, .skipCheckColShot_0      ; if (Shot status == 0) skip Check Col.

    push    hl
            inc     hl
            ld      a, (hl)    ; D = player shot X
            ld      d, a

            inc     hl
            inc     hl
            ld      a, (hl)    ; E = player shot Y static
            ld      e, a
            
            ; if (Player_Shot_Width == PLAYER_SHOT_DOUBLE) CheckCollision_16x16_32x16 else CheckCollision_16x16_16x16
            ld      a, (Player_Shot_Width)
            cp      PLAYER_SHOT_WIDTH_DOUBLE
            jp      nz, .singleShot
            call    CheckCollision_16x16_32x16
            jp      .continue
        .singleShot:
            call    CheckCollision_16x16_16x16
        .continue:                
    pop     hl

    ret



; Inputs:
;   BC: X and Y static of 32x32 object
;   HL: PlayerShot struct addr
; Output:
;   Carry set: collision
;   Carry reset: no collision
; Obs.: Preserves HL
CheckCol_32x32_Object_PlayerShot:
    ld      a, (hl)    ; Status
    or      a
    ret     z ; if (Shot status == 0) skip Check Col.

    push    hl
            inc     hl
            ld      a, (hl)    ; D = player shot X
            ld      d, a

            inc     hl
            inc     hl
            ld      a, (hl)    ; E = player shot Y static
            ld      e, a
            
            ; if (Player_Shot_Width == PLAYER_SHOT_DOUBLE) CheckCollision_16x16_32x16 else CheckCollision_16x16_16x16
            ld      a, (Player_Shot_Width)
            cp      PLAYER_SHOT_WIDTH_DOUBLE
            jp      nz, .singleShot
            call    CheckCollision_32x32_32x16
            jp      .continue
        .singleShot:
            call    CheckCollision_32x32_16x16
        .continue:                
    pop     hl

    ret
