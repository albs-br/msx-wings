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
        ld      a, (de)
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

        ld      a, -1
        ld      (Item_Temp_Delta_X), a
        ld      (Item_Temp_Delta_Y), a

;     ld      hl, (LevelData_Temp_SPRCOL_Addr)
;     ld      (Enemy_Temp_SPRCOL_Addr), hl


        ; ; Load item colors
        ; ld      a, 0000 0001 b
        ; ld      hl, (Item_Temp_SPRCOL_Addr)
        ; call    SetVdp_Write
        ; ld      c, PORT_0
        ; ld      hl, SpriteColors_Item_P_Frames_0_to_7
        ; ; 32x OUTI
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



;     ld      a, 1
;     ld      (Enemy_Temp_Status), a     ; Status

;     ld      hl, 0
;     ld      (Enemy_Temp_Frame_Counter), hl      ; reset frame counter

;     ; get initial X coord from level data struct
;     ld      a, (LevelData_Temp_Initial_X)
;     ld      (Enemy_Temp_X), a

;     ; this now comes from enemy data
;     ; ;add     1          ; X offset for sprite 1
;     ; ld      (Enemy_Temp_X1), a            ; X1

;     ld      a, (Screen_Y_Origin)
;     ld      (Enemy_Temp_Y), a

;     ; this now comes from enemy data
;     ; add     8           ; Y offset for sprite 1
;     ; ;add     4           ; Y offset for sprite 1
;     ; ld      (Enemy_Temp_Y1), a            ; Y1

;     xor     a
;     ld      (Enemy_Temp_Y_Static), a      ; Y static

;     ; this now comes from enemy data
;     ; ld      a, ENEMY_FRAME_0_SPR_PAT_0_NUMBER
;     ; ;ld      a, ENEMY_1_SPR_PAT_0_NUMBER
;     ; ld      (Enemy_Temp_Pattern_0), a     ; Pattern 0

;     ; add     4
;     ; ;ld      a, ENEMY_0_SPR_PAT_1_NUMBER
;     ; ;ld      a, ENEMY_1_SPR_PAT_1_NUMBER
;     ; ld      (Enemy_Temp_Pattern_1), a     ; Pattern 1


;     ; get  Enemy Data Initial Addr from level data struct
;     ld      hl, (LevelData_Temp_Data_Initial_Addr)
;     ld      (Enemy_Temp_Data_Current_Addr), hl           ; Enemy data addr


;     ;call    LoadDataFromEnemyData


;     ; ; Delta Y data is always n bytes after Delta X data. n = EnemyDeltaX_size
;     ; ld      bc, EnemyDeltaX_size
;     ; add     hl, bc
;     ; ld      (Enemy_Temp_Delta_Y_Current_Addr), hl           ; Delta Y addr







.return:

        pop     de  ; restore addr of item data struct
    
    ; Copy temp Item struct back to Item struct
    ld      hl, Item_Temp_Struct                                ; source
    ;ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, Item_Temp_Struct.size                           ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret
