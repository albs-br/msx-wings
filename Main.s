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
    INCLUDE "UpdateSpriteAttributesTable.s"
    INCLUDE "InitVariables.s"
    INCLUDE "Scroll.s"
    INCLUDE "ReadInput.s"
    INCLUDE "GameLogic.s"

    ; Assets
    INCLUDE "Graphics/Sprites/SpriteAssets.s"

Execute:
    call    EnableRomPage2

	; enable page 1
    ld	    a, 1
	ld	    (Seg_P8000_SW), a

    call    InitVram



; ---------------------


    call    InitVariables


    call    LoadFirstScreen


    call    BIOS_ENASCR

; --------- 

ADDR_LAST_LINE_OF_PAGE: equ 0x8000 + (63 * 256)


    call    InitVariablesForScroll

    ; ; initialize variables for scrolling on last line of the next page
    ; ld      a, 13
    ; ld      (CurrentMegaROMPage), a
    ; ld      hl, ADDR_LAST_LINE_OF_PAGE
    ; ld      (CurrentAddrLineScroll), hl
    ; ld      hl, 255 * 256
    ; ld      (CurrentVRAMAddrLineScroll), hl


    ; xor     a
    ; ld      (VerticalScroll), a

.gameLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.waitVBlank:
    cp      (hl)
    jr      z, .waitVBlank

    call    ExecuteScroll

    call    AdjustSprites_Y

    call    UpdateSpriteAttributesTable

    call    ReadInput

    call    GameLogic



    ; ; test
    ; ld      a, (Player_X)
    ; inc     a
    ; ld      (Player_X), a


    jp      .gameLoop





End:





InitialSpriteAttributes:
    ;   Y, X, Pattern, Reserved

; ----------- player plane

    ; sprites 0 and 1
    db  90, 100, 0 * 4, 0
    db  90, 100, 1 * 4, 0

    ; sprites 2 and 3
    db  90 + 16, 100, 2 * 4, 0
    db  90 + 16, 100, 3 * 4, 0

; ----------- player shots

    ; sprites 4, 5 and 6
    db  192, 255, EMPTY_SPR_PAT_NUMBER, 0
    db  192, 255, EMPTY_SPR_PAT_NUMBER, 0
    db  192, 255, EMPTY_SPR_PAT_NUMBER, 0

.size:  equ $ - InitialSpriteAttributes








    db      "End ROM started at 0x4000"

	ds PageSize - ($ - 0x4000), 255	; Fill the unused area with 0xFF




; 	org	0x8000, 0xBFFF
; ImageData_1:
;     INCBIN "Graphics/Bitmaps/aerofighters_0.sra.new"
; .size:      equ $ - ImageData_1
; 	ds PageSize - ($ - 0x8000), 255


; MegaROM pages at 0x8000
    INCLUDE "MegaRomPages.s"




; RAM
	org     0xc000, 0xe5ff                   ; for machines with 16kb of RAM (use it if you need 16kb RAM, will crash on 8kb machines, such as the Casio PV-7)

    INCLUDE "Variables.s"
