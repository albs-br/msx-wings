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
        sub     6                           ; not sure why, but Y static needs to be ajusted by 6 pixels..,
        ld      (Item_Temp_Y_Static), a

        ; Item_Type = Enemy_Item_Type
        ld      a, (Enemy_Temp_Item_Type)
        ld      (Item_Temp_Type), a

    ; cp      ITEM_P
    ; jp      z, $ ; debug




        ; ------ Load item patterns
        ; if (Item_Type == ITEM_P) load ITEM_P_SPR_PAT_0_NUMBER else load ITEM_BOMB_SPR_PAT_0_NUMBER
        ld      a, (Item_Temp_Type)
        cp      ITEM_P
        jp      nz, .itemBomb_Patterns
        ld      a, ITEM_P_SPR_PAT_0_NUMBER
        ld      ix, SpriteColors_Item_P_Frame_0
        jp      .continue_Patterns
.itemBomb_Patterns:
        ld      a, ITEM_BOMB_SPR_PAT_0_NUMBER
        ld      ix, SpriteColors_Item_Bomb_Frame_0
.continue_Patterns:
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

        ld      a, -1 ; TODO: randomize delta_Y (is it really necessary?)
        ld      (Item_Temp_Delta_Y), a




        ; ------ Load item colors
        ld      a, 0000 0001 b
        ld      hl, (Item_Temp_SPRCOL_Addr)
        call    SetVdp_Write
        ld      c, PORT_0
        
        ; HL = IX
        push    ix
        pop     hl

        ; 32x OUTI
        call    OUTI_x32
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


; .return:

    pop     de  ; restore addr of item data struct
    
    ; Copy temp Item struct back to Item struct
    ld      hl, Item_Temp_Struct                                ; source
    ;ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, Item_Temp_Struct.size                           ; size
    ldir                                                        ; Copy BC bytes from HL to DE


    ret
