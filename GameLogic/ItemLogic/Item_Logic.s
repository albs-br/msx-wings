ITEM_P_MAX_LIFETIME:            equ 600         ; 600 frames = 10 seconds
ITEM_P_LIFETIME_START_BLINK:    equ 420

; Input
;   HL: addr of enemy struct (the item struct addr is inside enemy struct)
Item_Logic:


            ;call BIOS_BEEP
            ;jp Item_Logic ; debug

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


        ; --------------------------- item movement

        ; copy sprite attrs from item to enemy (they share the place on SPRATR table)

        ; if (X == -2) DeltaX = +1
        ld      a, (Item_Temp_X)
        cp      -2
        call    z, .itemX_Equal_0
        ; if (X == 242) DeltaX = -1
        ld      a, (Item_Temp_X)
        cp      242
        call    z, .itemX_Equal_240
        
        ; X += Delta_X
        ld      a, (Item_Temp_X)
        ld      hl, Item_Temp_Delta_X
        add     (hl)
        ld      (Item_Temp_X), a
        ld      (Enemy_Temp_X), a
        ld      (Enemy_Temp_X1), a
        
        ; if (Y_Static == 0) DeltaY = +1
        ld      a, (Item_Temp_Y_Static)
        or      a
        call    z, .itemYStatic_Equal_0
        ; if (Y_Static == 176) DeltaY = -1
        ld      a, (Item_Temp_Y_Static)
        cp      176
        call    z, .itemYStatic_Equal_176

        ; Y_Static += Delta_Y
        ld      a, (Item_Temp_Y_Static)
        ld      hl, Item_Temp_Delta_Y
        add     (hl)
        ld      (Item_Temp_Y_Static), a

        ; Y += Delta_Y
        ld      a, (Item_Temp_Y)
        ld      hl, Item_Temp_Delta_Y
        add     (hl)
        ld      (Item_Temp_Y), a
        ld      (Enemy_Temp_Y), a
        ld      (Enemy_Temp_Y1), a

        ; --------------------------- item animation


        ; if (Item_Temp_Frame_Counter >= 600) jp .resetItem
        ld      hl, (Item_Temp_Frame_Counter)
        ld      de, ITEM_P_MAX_LIFETIME
        call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
        jp      nc, .resetItem


        ; if (Item_Temp_Frame_Counter >= 420) blink item
        ld      hl, (Item_Temp_Frame_Counter)
        ld      de, ITEM_P_LIFETIME_START_BLINK     ; after 7 seconds
        call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
        jp      c, .showItem

        ; blink item when lifetime is ending
        ld      a, (BIOS_JIFFY)
        and     0000 0100 b
        or      a
        jp      z, .showItem

        ; hide item
        ld      a, EMPTY_SPR_PAT_NUMBER
        ld      (Enemy_Temp_Pattern_0), a
        ld      (Enemy_Temp_Pattern_1), a
        
        jp      .continue
        
        ; ; Load item colors
        ; ld      a, 0000 0001 b
        ; ld      hl, (Item_Temp_SPRCOL_Addr)
        ; call    SetVdp_Write
        ; ld      c, PORT_0
        ; ld      hl, SpriteColors_Item_P_Frames_0_to_7
        ; ; 32x OUTI
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    .showItem:
        ld      a, (Item_Temp_Pattern_0)
        ld      (Enemy_Temp_Pattern_0), a

        ld      a, (Item_Temp_Pattern_1)
        ld      (Enemy_Temp_Pattern_1), a

    .continue:

        ; --------------------------- check collision between item and player

        ld      a, (Item_Temp_X)
        ld      b, a
        ld      a, (Item_Temp_Y_Static)
        ld      c, a

        ld      a, (Player_X)
        add     2                           ; adjust the 16x16 collision box to the center of the plane
        ld      d, a
        ld      a, (Player_Y_Static)
        add     12                          ; adjust the 16x16 collision box to the body of the plane
        ld      e, a

        call    CheckCollision_16x16_16x16
        jp      c, .collision
        
        jp      .return

    .collision:

        ; --------------- improve player shot
        
        ; if(Player_Shot_Level == PLAYER_SHOT_LEVEL_3) do nothing
        ld      a, (Player_Shot_Level)
        cp      PLAYER_SHOT_LEVEL_3
        jp      z, .playGetItemSfx

        ; Player_Shot_Level++
        inc     a
        ld      (Player_Shot_Level), a

        ; if(Player_Shot_Level >= PLAYER_SHOT_LEVEL_2) Set_double_width
        cp      PLAYER_SHOT_LEVEL_2
        jp      c, .not_set_double_width

        ld      a, PLAYER_SHOT_WIDTH_DOUBLE
        ld      (Player_Shot_Width), a
    .not_set_double_width:        

        
        ; Player_Shot_Level is never = 0 here

        ; if(Player_Shot_Level == PLAYER_SHOT_LEVEL_2) {
        ;   Set_Player_Shot_Pattern_Thin
        ; }
        ; else {
        ;   Set_Player_Shot_Pattern_Fat
        ; }
        ld      a, (Player_Shot_Level)
        cp      PLAYER_SHOT_LEVEL_2
        jp      nz, .set_Player_Shot_Pattern_Fat

        ld      hl, SpritePattern_PlayerShot_Thin
        ld      de, SpriteColors_PlayerShot_Thin
        call    Load_PlayerShot_Pattern_And_Colors
        jp      .playGetItemSfx

    .set_Player_Shot_Pattern_Fat:
        ld      hl, SpritePattern_PlayerShot_Fat
        ld      de, SpriteColors_PlayerShot_Fat
        call    Load_PlayerShot_Pattern_And_Colors

    .playGetItemSfx:
        ;ld      a, 100             ; volume
        ld      a, SFX_GET_ITEM     ; number of sfx in the bank
        ld      c, 1                ; sound priority
        call    PlaySfx

    .resetItem:
        ; reset item
        pop     hl                                                  ; destiny
        call    Item_Reset

        ; reset enemy
        ld      hl, (Temp_Addr)                                     ; get enemy struct Temp_Addr
        call    Enemy_Reset

        ret


    .return:
        ; increment Frame Counter
        ld      hl, (Item_Temp_Frame_Counter)
        inc     hl
        ld      (Item_Temp_Frame_Counter), hl

        ; TODO: check if max item lifespan was reached


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

.itemX_Equal_0:
    ld      a, +1
    ld      (Item_Temp_Delta_X), a
    ret

.itemX_Equal_240:
    ld      a, -1
    ld      (Item_Temp_Delta_X), a
    ret

.itemYStatic_Equal_0:
    ld      a, +1
    ld      (Item_Temp_Delta_Y), a
    ret

.itemYStatic_Equal_176:
    ld      a, -1
    ld      (Item_Temp_Delta_Y), a
    ret



; TODO: put this routine on a separate file
ItemAnimation:

    ld      a, (BIOS_JIFFY)
    and     0000 0011 b         ; animation only at each 4 frames
    ret     nz


    ; check if is there any item visible
    xor     a
    ld      hl, Item_0_Struct   ; first byte of Item Struct is Status (0: disabled, 1: enabled)
    add     (hl)
    ld      hl, Item_1_Struct
    add     (hl)
    ld      hl, Item_2_Struct
    add     (hl)
    ld      hl, Item_3_Struct
    add     (hl)
    ld      hl, Item_4_Struct
    add     (hl)
    ld      hl, Item_5_Struct
    add     (hl)
    ld      hl, Item_6_Struct
    add     (hl)
    ret     z               ; summing up all Item's Status, if sum is 0, no one Item is enabled


    ; ---- Update Item P animation pattern
    ld      a, (ItemAnimation_CurrentFrame)
    and     0000 0111 b         ; mask to get a 0 to 7

    ; set HL to current pattern addr
    ld      hl, SpritePattern_Item_P_Frames_0_to_7
    ld      bc, 64
    ld      d, a
    or      a ; set Z flag if frame is 0
.loop:
    jp      z, .endLoop
    add     hl, bc              ; HL will be incremented 64 bytes x ItemAnimation_CurrentFrame
    dec     d
    jp      .loop
.endLoop:

    push    hl
        ld      a, 0000 0001 b
        ld      hl, SPRPAT + (ITEM_P_SPR_PAT_0_NUMBER * 8)
        call    SetVdp_Write
    pop     hl
    ; unrolled OUTIs
    ld      c, PORT_0
    ; 64x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ; ---- Update Item Bomb animation pattern
    ld      a, (ItemAnimation_CurrentFrame)
    and     0000 0111 b         ; mask to get a 0 to 7

    ; TODO 24/02/2023: this offset is already computed above, optimize
    ; set HL to current pattern addr
    ld      hl, SpritePattern_Item_Bomb_Frames_0_to_7
    ld      bc, 64
    ld      d, a
    or      a ; set Z flag if frame is 0
.loop_1:
    jp      z, .endLoop_1
    add     hl, bc              ; HL will be incremented 64 bytes x ItemAnimation_CurrentFrame
    dec     d
    jp      .loop_1
.endLoop_1:

    push    hl
        ld      a, 0000 0001 b
        ld      hl, SPRPAT + (ITEM_BOMB_SPR_PAT_0_NUMBER * 8)
        call    SetVdp_Write
    pop     hl
    ; unrolled OUTIs
    ld      c, PORT_0
    ; 64x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ; next ItemAnimation_CurrentFrame
    ld      hl, ItemAnimation_CurrentFrame
    inc     (hl)

    ret