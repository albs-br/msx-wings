PaletteCycling:

    ; return if no items are active
    xor     a
    ld      hl, Item_0_Struct
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
    add     (hl) ; register A contains sum of status of all items
    ret     z

    ; JIFFY     palette
    ; 00        0
    ; 01        1
    ; 10        2
    ; 11        1

; DONE: this can be optimized (each palette is being loaded 4 times in sequence)
    ld      a, (BIOS_JIFFY)
    and     0000 1111 b
    ; srl     a                 ; shift right A
    ; srl     a                 ; shift right A
    
    ; dec     a       ; if (A == 0)
    or      a
    jp      z, .palette_0

    ; dec     a       ; if (A == 1)
    cp      0000 0100 b
    jp      z, .palette_1
    
    ; dec     a       ; if (A == 2)
    cp      0000 1000 b
    jp      z, .palette_2
    
    ; dec     a       ; if (A == 3)
    cp      0000 1100 b
    jp      z, .palette_1
    
    ; else ret
    ret

    ;jp      .palette_0  ; else

; TODO: only ome of the 16 colors change betwwen these palettes.
; Probably it can be optimized

.palette_0:
    ld      hl, PaletteData_0
    call    LoadPalette
    ret

.palette_1:
    ld      hl, PaletteData_1
    call    LoadPalette
    ret

.palette_2:
    ld      hl, PaletteData_2
    call    LoadPalette
    ret
