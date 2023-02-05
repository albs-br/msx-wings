PaletteCycling:

    ; JIFFY     palette
    ; 00        0
    ; 01        1
    ; 10        2
    ; 11        1

    ld      a, (BIOS_JIFFY)
    and     0000 1100 b
    srl     a                 ; shift right A
    srl     a                 ; shift right A
    
    dec     a       ; if (A == 1)
    jp      z, .palette_1
    
    dec     a       ; if (A == 2)
    jp      z, .palette_2
    
    dec     a       ; if (A == 3)
    jp      z, .palette_1
    
    ;jp      .palette_0  ; else

;.palette_0:
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

    ret