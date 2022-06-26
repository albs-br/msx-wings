SmallFont_Patterns:
    INCLUDE "Graphics/Sprites/Fonts/Small_8x8/patterns.s"
SmallFont_Colors:
    INCLUDE "Graphics/Sprites/Fonts/Small_8x8/colors.s"


TestFonts_8x8:

    ld      hl, SmallFont_Patterns
    ld      de, NAMTBL
    ld      b, 23       ; number of chars

.loop:
    push    bc
        push    hl
            push    de
                ;ld      hl, SmallFont_Patterns
                ld      ix, SmallFont_Colors
                ld      de, ConvertMsx2SpritesToSc11_Output
                call    ConvertMsx2SpritesToSc11

            pop     hl
            push    hl
                ld      de, ConvertMsx2SpritesToSc11_Output
                ;ld      hl, NAMTBL
                call    Copy16x16ImageFromRAMToVRAM
            pop     hl
            ld      bc, 8      ; next char locantion on screen (equal width of the font)
            add     hl, bc
            ex      de, hl

        pop     hl
        ld      bc, 64      ; next sprite pattern (2x number of sprite lines)
        add     hl, bc
    pop     bc
    djnz    .loop

    ; ld      hl, SmallFont_Patterns
    ; ld      ix, SmallFont_Colors
    ; ld      de, ConvertMsx2SpritesToSc11_Output
    ; call    ConvertMsx2SpritesToSc11

    ; ld      de, ConvertMsx2SpritesToSc11_Output
    ; ld      hl, NAMTBL
    ; call    Copy16x16ImageFromRAMToVRAM
    ; ;

    ; ld      hl, SmallFont_Patterns + 64
    ; ld      ix, SmallFont_Colors
    ; ld      de, ConvertMsx2SpritesToSc11_Output
    ; call    ConvertMsx2SpritesToSc11

    ; ld      de, ConvertMsx2SpritesToSc11_Output
    ; ld      hl, NAMTBL + 8
    ; call    Copy16x16ImageFromRAMToVRAM

    ret