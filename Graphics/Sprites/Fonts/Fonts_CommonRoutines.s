; Input:
;   HL: SPRPAT addr
;   DE: SPRCOL addr
;   IX: source sprite pattern addr on RAM
LargeFont_LoadSpritePatternsAndColors:

    ; load sprite patterns
    ld      a, 0000 0001 b ; highest bit of the 17-bit VRAM address
    call    SetVdp_Write
    ld      bc, 0 + (32 * 256) + PORT_0 ; B = 32, C = PORT_0
    ; HL = IX
    ; ld      a, ixh
    ; ld      h, a
    ; ld      a, ixl
    ; ld      l, a
    push    ix
    pop     hl
    
    otir

    ex      de, hl

    ; load sprite colors
    ld      a, 0000 0001 b ; highest bit of the 17-bit VRAM address
    call    SetVdp_Write
    ld      bc, 0 + (16 * 256) + PORT_0 ; B = 16, C = PORT_0
    ld      hl, LargeFont_Colors
    otir

    ret



; Input:
;   HL: SPRPAT addr
;   DE: SPRCOL addr
;   IX: source sprite pattern addr on RAM
SmallFont_LoadSpritePatternsAndColors:

    ; load sprite patterns
    ld      a, 0000 0001 b ; highest bit of the 17-bit VRAM address
    call    SetVdp_Write
    ld      bc, 0 + (32 * 256) + PORT_0 ; B = 32, C = PORT_0
    ; HL = IX
    push    ix
    pop     hl
    
    otir

    ex      de, hl

    ; load sprite colors
    ld      a, 0000 0001 b ; highest bit of the 17-bit VRAM address
    call    SetVdp_Write
    ld      bc, 0 + (16 * 256) + PORT_0 ; B = 16, C = PORT_0
    ld      hl, SmallFont_Colors
    otir

    ret




; Convert a number value in an sprite pattern address for the
; corresponding char font, using small font
; Input:
;   A: number
; Output:
;   HL: sprite pattern address
ConvertNumberToSpriteChar_SmallFont:
    ; set hl to 0-9 char correponding to bombs number
    ld      hl, SmallFont_Patterns + SMALL_FONT_CHAR_0
    ld      de, 64  ;each char uses 64 bytes
    
    ; if (number == 0) ret
    or      a
    ret     z ;jp      z, .bombsNumber_0
    
    ; TODO: maybe show a :) when bombs > 9
    cp      9 
    jp      c, .less_than_9 ; if (A >= 9) A = 9
    ld      a, 9
    
.less_than_9:
    ld      b, a
.loop:
    add     hl, de
    djnz    .loop
    ret



; Inputs:
;   A: ascii code ('A'-'Z')
; Output:
;   HL: ROM base addr of font pattern (2x 16x16 sprite patterns). 
Get_SmallFont_PatternAddr:
    sub     65 - 37 ; 65 = ASCII code for 'A'; 37 = 'A' char position on fonts file
    ld      b, a

    ld      hl, SmallFont_Patterns

    ; HL = HL + (64 * B)
    ld      de, 64
.loop:
    add     hl, de
    djnz    .loop

    ret

; Inputs:
;   A: ascii code ('A'-'Z')
; Output:
;   HL: ROM base addr of font pattern (2x 16x16 sprite patterns). 
Get_MediumFont_PatternAddr:
    sub     65 - 10 ; 65 = ASCII code for 'A'; 10 = 'A' char position on fonts file
    ld      b, a

    ld      hl, MediumFont_Patterns

    ; HL = HL + (64 * B)
    ld      de, 64
.loop:
    add     hl, de
    djnz    .loop

    ret

; Inputs:
;   A: ascii code ('A'-'Z')
; Output:
;   HL: ROM base addr of font pattern (2x 16x16 sprite patterns). 
Get_LargeFont_PatternAddr:
    sub     65 - 10 ; 65 = ASCII code for 'A'; 10 = 'A' char position on fonts file
    ld      b, a

    ld      hl, LargeFont_Patterns

    ; HL = HL + (64 * B)
    ld      de, 64
.loop:
    add     hl, de
    djnz    .loop

    ret

; -------------------------------------------------------------------------------------------------------------------

; Inputs:
;   HL: Zero terminated string addr
;   DE: VRAM NAMTBL addr (SC5)
DrawString_LargeFont_SC5:

.loop:
    ld      a, (hl)
    or      a
    ret     z        
    
    push    hl

        ; if(A == ' ') skipDrawChar
        cp      32
        jp      z, .skipDrawChar ; efectivelly is like a space on string

        push    de
            call    Get_LargeFont_PatternAddr
        pop     de

        ; sub     65 ; ASCII code for A
        ; ld      l, a
        ; ld      h, 0
        ; ; multiply HL by 64 (shift left 6x)
        ; add     hl, hl
        ; add     hl, hl
        ; add     hl, hl
        ; add     hl, hl
        ; add     hl, hl
        ; add     hl, hl        

        ; ld      bc, LARGE_FONT_CHAR_A
        ; add     hl, bc

        ; ld      bc, LargeFont_Patterns
        ; add     hl, bc

        call    .drawHalfChar


        ; HL += 16 (second half, 8x16 of the sprite)
        ld      bc, 16
        add     hl, bc

        call    .drawHalfChar

.return_from_skipDrawChar:

    pop     hl
    inc     hl
    jp      .loop

.skipDrawChar:
    ; DE += 8 (16 pixels on SC5)
    ld      bc, 8
    call    DE_Plus_BC

    jp      .return_from_skipDrawChar

.drawHalfChar:

    push    hl, de
        push    de
            ld      ix, LargeFont_Colors
            ld      de, UncompressedData
            ld      b, 16
            call    ConvertMsx2SpritesToSc5

            ld      de, UncompressedData
        pop     hl ; from DE to HL
        ; ld      hl, SC5_NAMTBL_PAGE_0 + (128 * 85) + (((256-(12*16))/2)/2) ; line 85, column ?
        push    hl
            ; DE: source on RAM
            ; HL: destiny on VRAM
            call    Copy16x16ImageFromRAMToVRAM_SC5
        pop     hl
    pop     de, hl

    ; DE += 4 (8 pixels on SC5)
    ld      bc, 4
    call    DE_Plus_BC

    ret


; -------------------------------------------------------------------------------------------------------------------

; Inputs:
;   HL: Zero terminated string addr
;   DE: VRAM NAMTBL addr (SC5)
DrawString_MediumFont_SC5:

.loop:
    ld      a, (hl)
    or      a
    ret     z        
    
    push    hl

        ; if(A == ' ') skipDrawChar
        cp      32
        jp      z, .skipDrawChar ; efectivelly is like a space on string

        push    de
            call    Get_MediumFont_PatternAddr
        pop     de

        call    .drawChar

.return_from_skipDrawChar:

    pop     hl
    inc     hl
    jp      .loop

.skipDrawChar:
    ; DE += 4 (8 pixels on SC5)
    ld      bc, 4
    call    DE_Plus_BC

    jp      .return_from_skipDrawChar

.drawChar:

    push    hl, de
        push    de
            ld      ix, MediumFont_Colors
            ld      de, UncompressedData
            ld      b, 16
            call    ConvertMsx2SpritesToSc5

            ld      de, UncompressedData
        pop     hl ; from DE to HL
        push    hl
            ; DE: source on RAM
            ; HL: destiny on VRAM
            call    Copy16x16ImageFromRAMToVRAM_SC5
        pop     hl
    pop     de, hl

    ; DE += 4 (8 pixels on SC5)
    ld      bc, 4
    call    DE_Plus_BC

    ret

; -------------------------------------------------------------------------------------------------------------------

; Inputs:
;   HL: Zero terminated string addr
;   DE: VRAM NAMTBL addr (SC5)
DrawString_SmallFont_SC5:

.loop:
    ld      a, (hl)
    or      a
    ret     z        
    
    push    hl

        ; if(A == ' ') skipDrawChar
        cp      32
        jp      z, .skipDrawChar ; efectivelly is like a space on string

        push    de
            call    Get_SmallFont_PatternAddr
        pop     de

        call    .drawChar

.return_from_skipDrawChar:

    pop     hl
    inc     hl
    jp      .loop

.skipDrawChar:
    ; DE += 4 (8 pixels on SC5)
    ld      bc, 3
    call    DE_Plus_BC

    jp      .return_from_skipDrawChar

.drawChar:

    push    hl, de
        push    de
            ld      ix, MediumFont_Colors
            ld      de, UncompressedData
            ld      b, 16
            call    ConvertMsx2SpritesToSc5

            ld      de, UncompressedData
        pop     hl ; from DE to HL
        ; ld      hl, SC5_NAMTBL_PAGE_0 + (128 * 85) + (((256-(12*16))/2)/2) ; line 85, column ?
        push    hl
            ; DE: source on RAM
            ; HL: destiny on VRAM
            call    Copy16x16ImageFromRAMToVRAM_SC5
        pop     hl
    pop     de, hl

    ; DE += 4 (8 pixels on SC5)
    ld      bc, 3
    call    DE_Plus_BC

    ret


DE_Plus_BC:
    ; DE += BC
    ex      de, hl ; HL = DE
        ;ld      bc, 4
        add     hl, bc
    ex      de, hl ; DE = HL
    ret
