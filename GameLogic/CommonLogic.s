; Inputs:
;   BC: X and Y static of object
;   HL: PlayerShot struct addr
; Output:
;   Carry set: collision
;   Carry reset: no collision
; Obs.: Preserves HL
CheckCol_Object_PlayerShot:
        ld      a, (hl)    ; Status
        or      a
        ret     z ; jp      z, .skipCheckColShot_0      ; if (Shot status == 0) skip Check Col.

        push    hl
                inc     hl
                ld      a, (hl)    ; player shot X
                ld      d, a

                inc     hl
                inc     hl
                ld      a, (hl)    ; player shot Y static
                ld      e, a
                
                ; if (Player_Shot_Type == PLAYER_SHOT_DOUBLE) CheckCollision_16x16_32x16 else CheckCollision_16x16_16x16
                ld      a, (Player_Shot_Type)
                cp      PLAYER_SHOT_DOUBLE
                jp      nz, .singleShot
                call    CheckCollision_16x16_32x16
                jp      .continue
            .singleShot:
                call    CheckCollision_16x16_16x16
            .continue:                
        pop     hl

        ret
