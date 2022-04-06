; Input
;   HL: addr of ground target struct
GroundTarget_Logic:

    ; check status before copying to temp vars to save cycles when disabled
    ld      a, (hl)         ; get Status
    or      a
    ret     z               ; if (Status == 0) ret

    push    hl

        ; Copy enemy struct to temp enemy struct
        ;ld      hl, ?                                          ; source
        ld      de, GroundTarget_Temp_Struct                    ; destiny
        ld      bc, GroundTarget_Temp_Struct.size               ; size
        ldir                                                    ; Copy BC bytes from HL to DE



        ; TODO: ground target logic here


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