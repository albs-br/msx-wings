HMMM_Parameters:
.Source_X:   dw    0 	    ; Source X (9 bits)
.Source_Y:   dw    256 	    ; Source Y (10 bits)
.Destiny_X:  dw    0 	    ; Destiny X (9 bits)
.Destiny_Y:  dw    0 	    ; Destiny Y (10 bits)
.Cols:       dw    256      ; number of cols (9 bits)
.Lines:      dw    32       ; number of lines (10 bits)
.NotUsed:    db    0
.Options:    db    0000 0000 b  ; select destination memory and direction from base coordinate
.Command:    db    VDP_COMMAND_HMMM
HMMM_Parameters_size: equ $ - HMMM_Parameters

;    dw    0, 256 	; Source X (9 bits), Source Y (10 bits)
;    dw    0, 0 	    ; Destiny X (9 bits), Destiny Y (10 bits)
;    dw    256, 32   ; number of cols (9 bits), number of lines (10 bits)
;    db    0, 0, VDP_COMMAND_HMMM




;       first byte:  high nibble: red 0-7; low nibble: blue 0-7
;       second byte: high nibble: 0000; low nibble:  green 0-7
TitleColor_0_First:
    db      0x77, 0x07
    db      0x66, 0x06
    db      0x55, 0x05
    db      0x44, 0x04
    db      0x33, 0x03
    db      0x22, 0x02
    db      0x11, 0x01
TitleColor_0_Last:
    db      0x00, 0x00
TitleColor_0_End:
TitleColor_0_Size: equ $ - TitleColor_0_First

TitleColor_1_First:
    db      0x00, 0x00
    db      0x11, 0x01
    db      0x22, 0x02
    db      0x33, 0x03
    db      0x44, 0x04
    db      0x55, 0x05
    db      0x66, 0x06
TitleColor_1_Last:
    db      0x77, 0x07
TitleColor_1_End:


Title_PaletteData:
    ;  data 1 (red 0-7; blue 0-7); data 2 (0000; green 0-7)
    db 0x77, 0x07 ; Color index 0
Title_PaletteData_1:
    db 0x00, 0x00 ; Color index 1
    db 0x11, 0x01 ; Color index 2
    db 0x11, 0x01 ; Color index 3
    db 0x22, 0x02 ; Color index 4
    db 0x22, 0x02 ; Color index 5
    db 0x33, 0x03 ; Color index 6
    db 0x33, 0x03 ; Color index 7
    db 0x44, 0x04 ; Color index 8
    db 0x44, 0x04 ; Color index 9
    db 0x55, 0x05 ; Color index 10 (0xa)
    db 0x55, 0x05 ; Color index 11 (0xb)
    db 0x66, 0x06 ; Color index 12 (0xc)
    db 0x66, 0x06 ; Color index 13 (0xd)
    db 0x77, 0x07 ; Color index 14 (0xe)
Title_PaletteData_End_1:
    db 0x00, 0x00 ; Color index 15 (0xf)

    ; db 0x10, 0x00 ; Color index 2
    ; db 0x20, 0x00 ; Color index 3
    ; db 0x30, 0x00 ; Color index 4
    ; db 0x40, 0x00 ; Color index 5
    
    ; db 0x00, 0x00 ; Color index 6
    
    ; db 0x60, 0x00 ; Color index 7
    ; db 0x70, 0x00 ; Color index 8
    ; db 0x11, 0x01 ; Color index 9
    ; db 0x22, 0x02 ; Color index 10 (0xa)
    ; db 0x33, 0x03 ; Color index 11 (0xb)
    ; db 0x77, 0x07 ; Color index 12 (0xc)
    
    ; db 0x77, 0x07 ; Color index 13 (0xd)
    
    ; db 0x55, 0x05 ; Color index 14 (0xe)
    ; db 0x44, 0x04 ; Color index 15 (0xf)
Title_PaletteData_End: