; Input
;   HL: addr of ground target struct
GroundTarget_Logic:

    ; check status before copying to temp vars to save cycles when disabled
    ld      a, (hl)         ; get Status
    or      a
    ret     z               ; if (Status == 0) ret

    push    hl

        ; Copy ground target struct to temp ground target struct
        ;ld      hl, ?                                          ; source
        ld      de, GroundTarget_Temp_Struct                    ; destiny
        ld      bc, GroundTarget_Temp_Struct.size               ; size
        ldir                                                    ; Copy BC bytes from HL to DE



        ; -------------------------- ground target logic --------------------------
        
        ; if (IsScroll)
        ld      a, (BIOS_JIFFY)         ; get only low byte of JIFFY
        and     SCROLL_SPEED
        jp      nz, .isNotScroll


        ld      a, (GroundTarget_Temp_Y_Static)
        inc     a
        ld      (GroundTarget_Temp_Y_Static), a

        cp      192
        jp      z, .groundTargetReset

    .isNotScroll:

.return:
        ; increment Frame Counter
        ; ld      hl, (GroundTarget_Temp_Frame_Counter)
        ; inc     hl
        ; ld      (GroundTarget_Temp_Frame_Counter), hl

        ld      hl, GroundTarget_Temp_Struct                ; source
    pop     de                                              ; destiny
    ld      bc, GroundTarget_Temp_Struct.size               ; size
    ldir                                                    ; Copy BC bytes from HL to DE



    ret



.groundTargetReset:
    ld      hl, GroundTarget_Temp_Struct
    call    GroundTarget_Reset
    jp      .return
