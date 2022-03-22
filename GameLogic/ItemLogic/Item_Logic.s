; Input
;   HL: addr of enemy struct (the item struct addr is inside enemy struct)
Item_Logic:


            call BIOS_BEEP
            jp Item_Logic ; debug

    ; get item struct addr from enemy struct and put it in HL
    ld      bc, 0 + (Enemy_Temp_ItemStruct_Addr - Enemy_Temp_Struct)
    add     hl, bc
    ; HL = (HL)
    ld      a, (hl)
    inc     hl
    ld      h, (hl)
    ld      l, a


    ; check status before copying to temp vars to save cycles when disabled
    ld      a, (hl)     ; get Status
    or      a
    ret     z           ; if (Status == 0) ret
    
    push    hl

        ; Copy item struct to temp item struct
        ;ld      hl, ?                                          ; source
        ld      de, Item_Temp_Struct                            ; destiny
        ld      bc, Item_Temp_Struct.size                       ; size
        ldir                                                    ; Copy BC bytes from HL to DE


        ; TODO: item logic here



.return:
        ; increment Frame Counter
        ld      hl, (Item_Temp_Frame_Counter)
        inc     hl
        ld      (Item_Temp_Frame_Counter), hl

        ld      hl, Item_Temp_Struct                        ; source
    pop     de                                              ; destiny
    ld      bc, Item_Temp_Struct.size                       ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ret