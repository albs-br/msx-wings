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
