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
