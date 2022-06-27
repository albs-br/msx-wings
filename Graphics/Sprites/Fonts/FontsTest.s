
TestFonts_8x8:

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ld      hl, SmallFont_Patterns
    ld      de, NAMTBL
    ld      b, 32                                   ; number of chars
    call    TestFonts_8x8_WriteLine

    ld      hl, SmallFont_Patterns + (64 * 32)      ; skip 32 chars
    ld      de, NAMTBL + (256 * 8)                  ; skip 8 lines
    ld      b, 32                                   ; number of chars
    call    TestFonts_8x8_WriteLine

    ld      hl, SmallFont_Patterns + (64 * 64)      ; skip 64 chars
    ld      de, NAMTBL + (256 * 16)                 ; skip 16 lines
    ld      b, 32                                   ; number of chars
    call    TestFonts_8x8_WriteLine

    ld      hl, SmallFont_Patterns + (64 * 96)      ; skip 96 chars
    ld      de, NAMTBL + (256 * 24)                 ; skip 24 lines
    ld      b, 3                                    ; number of chars
    call    TestFonts_8x8_WriteLine

    ret

; Inputs:
;   HL: fonts start addr on RAM
;   DE: destiny NAMTBL addr on VRAM
;   B: number of chars (max 32)
TestFonts_8x8_WriteLine:

    ; ld      hl, SmallFont_Patterns
    ; ld      de, NAMTBL
    ; ld      b, 32       ; number of chars

.loop:
    push    bc
        push    hl
            push    de

                ; set MegaROM page for Fonts data
                ld      a, FONTS_DATA_MEGAROM_PAGE
                ld	    (Seg_P8000_SW), a

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
