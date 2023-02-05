PaletteCycling:

    ld      a, (BIOS_JIFFY)
    and     0000 0011 b         ; get value on 0-3 range
    dec     a       ; if (A == 1)
    jp      z, .palette_1
    dec     a       ; if (A == 2)
    jp      z, .palette_2
    dec     a       ; if (A == 3)
    jp      z, .palette_3
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

.palette_3:
    ld      hl, PaletteData_3
    call    LoadPalette
    ret