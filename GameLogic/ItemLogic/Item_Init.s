; Input
;   HL: addr of item data struct
;   DE: addr of enemy data struct
Item_Init:
    ; init Item / load some data from Enemy Data Struct to Item Struct

    push    hl  ; save addr of item data struct
        push    de
            ; Copy Item struct to temp Item struct
            ;ld      hl, ?           ; source
            ld      de, Item_Temp_Struct                           ; destiny
            ld      bc, Item_Temp_Struct.size                      ; size
            ldir                                                    ; Copy BC bytes from HL to DE
        pop     de

        ld      a, 1
        ld      (Item_Temp_Status), a

        ; Item_X = Enemy_X
        inc     de
        ld      a, (de)
        ld      (Item_Temp_X), a

        ; Item_Y = Enemy_Y
        inc     de
        ld      a, (de)
        ld      (Item_Temp_Y), a

        ; Item_Y_Static = Enemy_Y_Static
        inc     de
        ;ld      a, (de)
        ld      a, (Enemy_Temp_Y_Static)
        sub     6                           ; not sure why, but Y static need to be ajusted by 6 pixels..,
        ld      (Item_Temp_Y_Static), a

        ld      a, ITEM_P_FRAME_0_SPR_PAT_0_NUMBER
        ld      (Item_Temp_Pattern_0), a

        add     4
        ld      (Item_Temp_Pattern_1), a

        inc     de
        inc     de
        inc     de
        inc     de
        inc     de
        
        ; HL = (DE)
        ld      a, (de)
        ld      l, a
        inc     de
        ld      a, (de)
        ld      h, a
        ld      (Item_Temp_SPRCOL_Addr), hl

        ld      hl, 0
        ld      (Item_Temp_Frame_Counter), hl      ; reset frame counter

        call    RandomNumber
        and     0001 0000 b
        jp      z, .minus1
        ;else
        ld      a, +1
        jp      .continue
.minus1:
        ld      a, -1
.continue:
        ld      (Item_Temp_Delta_X), a

        ld      a, -1 ; TODO: randomize delta_X
        ld      (Item_Temp_Delta_Y), a


.return:

    pop     de  ; restore addr of item data struct
    
    ; Copy temp Item struct back to Item struct
    ld      hl, Item_Temp_Struct                                ; source
    ;ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, Item_Temp_Struct.size                           ; size
    ldir                                                        ; Copy BC bytes from HL to DE


; .eTERNALloop:
; JP .eTERNALloop

    ret
