FNAME "msx-wings.rom"      ; output file

PageSize:	    equ	0x4000	        ; 16kB
Seg_P8000_SW:	equ	0x7000	        ; Segment switch for page 0x8000-0xBFFF (ASCII 16k Mapper)

; Compilation address
    org 0x4000, 0xbeff	                    ; 0x8000 can be also used here if Rom size is 16kB or less.

    ; Common
    INCLUDE "Include/RomHeader.s"
    INCLUDE "Include/MsxBios.s"
    INCLUDE "Include/MsxConstants.s"
    INCLUDE "Include/CommonRoutines.s"

    ; Game
    INCLUDE "InitVram.s"

    ; Assets
    INCLUDE "Graphics/Sprites/SpriteAssets.s"

Execute:
    call    EnableRomPage2

	; enable page 1
    ld	    a, 1
	ld	    (Seg_P8000_SW), a

    call    InitVram

.endlessLoop:
    jp      .endlessLoop


End:





SpriteAttributes:
    ;   Y, X, Pattern, Reserved

    ; sprites 0 and 1
    db  90, 100, 0 * 4, 0
    db  90, 100, 1 * 4, 0

    ; sprites 2 and 3
    db  90 + 16, 100, 2 * 4, 0
    db  90 + 16, 100, 3 * 4, 0

.size:  equ $ - SpriteAttributes








    db      "End ROM started at 0x4000"

	ds PageSize - ($ - 0x4000), 255	; Fill the unused area with 0xFF




	org	0x8000, 0xBFFF
ImageData_1:
    INCBIN "Graphics/Bitmaps/aerofighters_0.sra.new"
.size:      equ $ - ImageData_1
	ds PageSize - ($ - 0x8000), 255



; RAM
	org     0xc000, 0xe5ff                   ; for machines with 16kb of RAM (use it if you need 16kb RAM, will crash on 8kb machines, such as the Casio PV-7)



