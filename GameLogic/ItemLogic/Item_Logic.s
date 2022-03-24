; Input
;   HL: addr of enemy struct (the item struct addr is inside enemy struct)
Item_Logic:


            ; call BIOS_BEEP
            ; jp Item_Logic ; debug

    push    hl
        ; Copy enemy struct to temp enemy struct
        ;ld      hl, ?                                          ; source
        ld      de, Enemy_Temp_Struct                           ; destiny
        ld      bc, Enemy_Temp_Struct.size                      ; size
        ldir                                                    ; Copy BC bytes from HL to DE
    pop     hl

    ld      (Temp_Addr), hl                                     ; save enemy struct addr

    ; get item struct addr from enemy struct and put it in HL
    ld      bc, 0 + (Enemy_Temp_ItemStruct_Addr - Enemy_Temp_Struct)
    add     hl, bc
    ; HL = (HL)
    ld      a, (hl)
    inc     hl
    ld      h, (hl)
    ld      l, a


    ; check item status before copying to temp vars to save cycles when disabled
    ld      a, (hl)     ; get Item Status
    or      a
    ret     z           ; if (Item Status == 0) ret
    
    push    hl

        ; Copy item struct to temp item struct
        ;ld      hl, ?                                          ; source
        ld      de, Item_Temp_Struct                            ; destiny
        ld      bc, Item_Temp_Struct.size                       ; size
        ldir                                                    ; Copy BC bytes from HL to DE


        ; TODO: item logic here

        ; copy sprite attrs from item to enemy (they share the place on SPRATR table)
        ld      a, (Item_Temp_X)
        ld      (Enemy_Temp_X), a
        ld      (Enemy_Temp_X1), a
        
        ld      a, (Item_Temp_Y)
        ld      (Enemy_Temp_Y), a
        ld      (Enemy_Temp_Y1), a

        ld      a, (Item_Temp_Pattern_0)
        ld      (Enemy_Temp_Pattern_0), a

        ld      a, (Item_Temp_Pattern_1)
        ld      (Enemy_Temp_Pattern_1), a

        ; TODO: load colors only when frame changes
        
        ; Load item colors
        ld      a, 0000 0001 b
        ld      hl, (Item_Temp_SPRCOL_Addr)
        call    SetVdp_Write
        ld      c, PORT_0
        ld      hl, SpriteColors_Item_P_Frames_0_to_7
        ; 32x OUTI
        outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

.return:
        ; increment Frame Counter
        ld      hl, (Item_Temp_Frame_Counter)
        inc     hl
        ld      (Item_Temp_Frame_Counter), hl

        ld      hl, Item_Temp_Struct                        ; source
    pop     de                                              ; destiny
    ld      bc, Item_Temp_Struct.size                       ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ; Copy temp enemy struct back to enemy struct
    ld      hl, Enemy_Temp_Struct                               ; source
    ld      de, (Temp_Addr)                                     ; destiny
    ld      bc, Enemy_Temp_Struct.size                          ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret