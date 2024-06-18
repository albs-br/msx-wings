; This routine is called once per frame, it updates patterns of all items on screen, both P and bombs
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



    ; calc offset for pattern addr based on current animation frame and put it on DE
    ld      a, (ItemAnimation_CurrentFrame)
    and     0000 0111 b         ; mask to get a 0 to 7

    ld      hl, 0
    ld      de, 64
.loop:
    jp      z, .endLoop
    add     hl, de              ; HL will be incremented 64 bytes x ItemAnimation_CurrentFrame
    dec     a
    jp      .loop
.endLoop:
    ex      de, hl


    ; set MegaROM page for Sprite Patterns data
    ld      a, SPRITE_PATTERNS_DATA_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ; update Item P animation pattern
    ld      hl, SpritePattern_Item_P_Frames_0_to_7
    add     hl, de

    push    hl
        ld      a, 0000 0001 b
        ld      hl, SPRPAT + (ITEM_P_SPR_PAT_0_NUMBER * 8)
        call    SetVdp_Write
    pop     hl
    ; unrolled OUTIs
    ld      c, PORT_0
    ; 64x OUTI
    call    OUTI_x32
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ; update Item Bomb animation pattern
    ld      hl, SpritePattern_Item_Bomb_Frames_0_to_7
    add     hl, de

    push    hl
        ld      a, 0000 0001 b
        ld      hl, SPRPAT + (ITEM_BOMB_SPR_PAT_0_NUMBER * 8)
        call    SetVdp_Write
    pop     hl
    ; unrolled OUTIs
    ld      c, PORT_0
    ; 64x OUTI
    call    OUTI_x32
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ; next ItemAnimation_CurrentFrame
    ld      hl, ItemAnimation_CurrentFrame
    inc     (hl)

    ret