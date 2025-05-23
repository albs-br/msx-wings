
TestFonts_8x8:

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ld      hl, SmallFont_Patterns
    ld      iy, SmallFont_Colors
    ld      de, NAMTBL
    ld      b, 32                                   ; number of chars
    ld      ixh, 8                                  ; font width in pixels
    ld      ixl, 8                                  ; font height in pixels
    call    TestFonts_WriteLine

    ld      hl, SmallFont_Patterns + (64 * 32)      ; skip 32 chars
    ld      iy, SmallFont_Colors
    ld      de, NAMTBL + (256 * 8)                  ; skip 8 lines
    ld      b, 32                                   ; number of chars
    ld      ixh, 8                                  ; font width in pixels
    ld      ixl, 8                                  ; font height in pixels
    call    TestFonts_WriteLine

    ld      hl, SmallFont_Patterns + (64 * 64)      ; skip 64 chars
    ld      iy, SmallFont_Colors
    ld      de, NAMTBL + (256 * 16)                 ; skip 16 lines
    ld      b, 32                                   ; number of chars
    ld      ixh, 8                                  ; font width in pixels
    ld      ixl, 8                                  ; font height in pixels
    call    TestFonts_WriteLine

    ld      hl, SmallFont_Patterns + (64 * 96)      ; skip 96 chars
    ld      iy, SmallFont_Colors
    ld      de, NAMTBL + (256 * 24)                 ; skip 24 lines
    ld      b, 3                                    ; number of chars
    ld      ixh, 8                                  ; font width in pixels
    ld      ixl, 8                                  ; font height in pixels
    call    TestFonts_WriteLine

    ret

TestFonts_8x16:

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ld      hl, MediumFont_Patterns
    ld      iy, MediumFont_Colors
    ld      de, NAMTBL + (256 * 32)                 ; skip 32 lines
    ld      b, 32                                   ; number of chars
    ld      ixh, 8                                  ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine

    ld      hl, MediumFont_Patterns + (64 * 32)     ; skip 32 chars
    ld      iy, MediumFont_Colors
    ld      de, NAMTBL + (256 * 48)                 ; skip 48 lines
    ld      b, 15                                   ; number of chars
    ld      ixh, 8                                  ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine

    ret

TestFonts_16x16:

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ; 8 left pixels of the chars
    ld      hl, LargeFont_Patterns
    ld      iy, LargeFont_Colors
    ld      de, NAMTBL + (256 * 64)                 ; skip 64 lines
    ld      b, 16                                   ; number of chars
    ld      ixh, 16                                 ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine

    ; 8 right pixels of the chars
    ld      hl, LargeFont_Patterns + 16
    ld      iy, LargeFont_Colors
    ld      de, NAMTBL + (256 * 64) + 8             ; skip 64 lines (+ 8 pixels)
    ld      b, 16                                   ; number of chars
    ld      ixh, 16                                 ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine



    ; 8 left pixels of the chars
    ld      hl, LargeFont_Patterns + (64 * 16)
    ld      iy, LargeFont_Colors
    ld      de, NAMTBL + (256 * 80)                 ; skip 80 lines
    ld      b, 16                                   ; number of chars
    ld      ixh, 16                                 ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine

    ; 8 right pixels of the chars
    ld      hl, LargeFont_Patterns + (64 * 16) + 16
    ld      iy, LargeFont_Colors
    ld      de, NAMTBL + (256 * 80) + 8             ; skip 80 lines (+ 8 pixels)
    ld      b, 16                                   ; number of chars
    ld      ixh, 16                                 ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine



    ; 8 left pixels of the chars
    ld      hl, LargeFont_Patterns + (64 * 32)
    ld      iy, LargeFont_Colors
    ld      de, NAMTBL + (256 * 96)                 ; skip 96 lines
    ld      b, 14                                   ; number of chars
    ld      ixh, 16                                 ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine

    ; 8 right pixels of the chars
    ld      hl, LargeFont_Patterns + (64 * 32) + 16
    ld      iy, LargeFont_Colors
    ld      de, NAMTBL + (256 * 96) + 8             ; skip 96 lines (+ 8 pixels)
    ld      b, 14                                   ; number of chars
    ld      ixh, 16                                 ; font width in pixels
    ld      ixl, 16                                 ; font height in pixels
    call    TestFonts_WriteLine

    ret

; Inputs:
;   HL: font patterns start addr on RAM
;   IY: font colors addr on RAM
;   DE: destiny NAMTBL addr on VRAM
;   B: number of chars (max 32)
;   IXH: font width in pixels (currently working just the spacing between chars)
;   IXL: font height in pixels
TestFonts_WriteLine:

.loop:
    push    bc
        push    hl
            push    ix
                push    iy
                    push    de

                        ; set MegaROM page for Fonts data
                        ld      a, FONTS_DATA_MEGAROM_PAGE
                        ; ld	    (Seg_P8000_SW), a
                        call    Set_and_Save_MegaROM_Page

                        ;ld      hl, SmallFont_Patterns
                        ld      b, ixl
                        ; ld      ix, SmallFont_Colors
                        ld      a, iyh
                        ld      ixh, a
                        ld      a, iyl
                        ld      ixl, a
                        ld      de, ConvertMsx2SpritesToSc11_Output
                        call    ConvertMsx2SpritesToSc11

                    pop     hl
                    push    hl
                        ld      de, ConvertMsx2SpritesToSc11_Output
                        ;ld      hl, NAMTBL
                        call    Copy16x16ImageFromRAMToVRAM
                    pop     hl
                pop     iy
            pop     ix

            ; next char location on screen (equal width of the font)
            ld      b, 0
            ld      c, ixh
            
            add     hl, bc
            ex      de, hl

        pop     hl
        ld      bc, 64      ; next sprite pattern (2x number of sprite lines)
        ;ld      bc, 16      ; next sprite pattern (2x number of sprite lines)
        add     hl, bc
    pop     bc
    djnz    .loop
`
    ret

; Inputs:

DrawString:
    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ld      hl, SmallFont_Patterns
    ld      iy, SmallFont_Colors
    ld      de, NAMTBL
    ld      b, 8                                   ; number of chars
    ld      ixh, 8                                  ; font width in pixels
    ld      ixl, 8                                  ; font height in pixels
    call    TestFonts_WriteLine

    ret


