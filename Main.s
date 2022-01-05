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


; --------- Load first screen     
    ld	    a, 14
	ld	    (Seg_P8000_SW), a
    ; write to VRAM bitmap area
    ld		hl, ImageData_14        			    ; RAM address (source)
    ld		de, NAMTBL + (0 * (256 * 64))                ; VRAM address (destiny)
    ld		bc, ImageData_14.size				    ; Block length
    call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory
            
    ; -- Load middle part of first image on last 64 lines
    ld	    a, 15
	ld	    (Seg_P8000_SW), a
    ; write to VRAM bitmap area
    ld		hl, ImageData_15      				    ; RAM address (source)
    ld		de, NAMTBL + (1 * (256 * 64))                ; VRAM address (destiny)
    ld		bc, ImageData_15.size					; Block length
    call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory

    ; -- Load bottom part of first image on last 64 lines
    ld	    a, 16
	ld	    (Seg_P8000_SW), a
    ; write to VRAM bitmap area
    ld		hl, ImageData_16      				    ; RAM address (source)
    ld		de, NAMTBL + (2 * (256 * 64))                ; VRAM address (destiny)
    ld		bc, ImageData_16.size					; Block length
    call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory

    call    BIOS_ENASCR

; --------- 

ADDR_LAST_LINE_OF_PAGE: equ 0x8000 + (63 * 256)


.start:
    ; initialize variables for scrolling on last line of the next page
    ld      a, 13
    ld      (CurrentMegaROMPage), a
    ld      hl, ADDR_LAST_LINE_OF_PAGE
    ld      (CurrentAddrLineScroll), hl
    ld      hl, 255 * 256
    ld      (CurrentVRAMAddrLineScroll), hl


    xor     a
    ld      (VerticalScroll), a

.loop:
    ld      a, (BIOS_JIFFY)
    ld      b, a
.waitVBlank:
    ld      a, (BIOS_JIFFY)
    cp      b
    jp      z, .waitVBlank

    ;call    Wait
; .endlessLoop:
;     jp  .endlessLoop

    ; load next line from bitmap on the last line of virtual screen (256 lines)
    ; that will be the next to be shown on top of screen
    ld	    a, (CurrentMegaROMPage)
	ld	    (Seg_P8000_SW), a
    ld      hl, (CurrentAddrLineScroll)             ; RAM address (source)
    ld		de, (CurrentVRAMAddrLineScroll)         ; VRAM address (destiny)
    ld		bc, 256					                ; Block length
    call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory
	; ld	    hl, (CurrentVRAMAddrLineScroll)		; VRAM start address
    ; ld      bc, 256                             ; number of bytes
    ; ld      a, 00011100 b                       ; value
    ; call    BIOS_FILVRM                         ; Fill VRAM

    ; update vars
    ld      de, (CurrentVRAMAddrLineScroll)
    dec     d                                       ; de = de - 256
    ld      hl, (CurrentAddrLineScroll)
    dec     h                                       ; hl = hl - 256
    ld      a, h
    cp      0x80 - 1
    jp      z, .decPage
    jp      .dontDecPage
.decPage:
    ld      a, (CurrentMegaROMPage)
    dec     a
    jp      z, .stopScroll
    ld      (CurrentMegaROMPage), a
    ld      hl, ADDR_LAST_LINE_OF_PAGE
.dontDecPage:
    ld      (CurrentAddrLineScroll), hl
    ld      (CurrentVRAMAddrLineScroll), de


    ; vertical scroll
    ld      hl, VerticalScroll
    dec     (hl)
    ld      b, (hl)         ; data
    ld      c, 23           ; register #
    call    BIOS_WRTVDP


    ; ajust Y position of sprites to compensate scroll
    ld      a, (Player_Y)
    dec     a
    cp      216             ; hide all sprites
    jp      nz, .continue
    ld      a, 215
.continue:
    ld      (Player_Y), a


    ; test
    ld      a, (Player_X)
    inc     a
    ld      (Player_X), a



    call    UpdateSpriteAttributesTable


    jp      .loop

.stopScroll:
    jp      .stopScroll




End:





InitialSpriteAttributes:
    ;   Y, X, Pattern, Reserved

    ; sprites 0 and 1
    db  90, 100, 0 * 4, 0
    db  90, 100, 1 * 4, 0

    ; sprites 2 and 3
    db  90 + 16, 100, 2 * 4, 0
    db  90 + 16, 100, 3 * 4, 0

.size:  equ $ - InitialSpriteAttributes








    db      "End ROM started at 0x4000"

	ds PageSize - ($ - 0x4000), 255	; Fill the unused area with 0xFF




; 	org	0x8000, 0xBFFF
; ImageData_1:
;     INCBIN "Graphics/Bitmaps/aerofighters_0.sra.new"
; .size:      equ $ - ImageData_1
; 	ds PageSize - ($ - 0x8000), 255


; MegaROM pages at 0x8000
; ------- Page 1
	org	0x8000, 0xBFFF
ImageData_1:
    INCBIN "Graphics/Bitmaps/aerofighters_0.sra.new"
    ; INCBIN "Images/aerofighters-bg2_0.sra.new"
.size:      equ $ - ImageData_1
	ds PageSize - ($ - 0x8000), 255

; ------- Page 2
	org	0x8000, 0xBFFF
ImageData_2:
    INCBIN "Graphics/Bitmaps/aerofighters_1.sra.new"
    ;INCBIN "Images/aerofighters-bg2_1.sra.new"
.size:      equ $ - ImageData_2
	ds PageSize - ($ - 0x8000), 255

; ------- Page 3
	org	0x8000, 0xBFFF
ImageData_3:
    INCBIN "Graphics/Bitmaps/aerofighters_2.sra.new"
    ;INCBIN "Images/aerofighters-bg2_2.sra.new"
.size:      equ $ - ImageData_3
	ds PageSize - ($ - 0x8000), 255

; ------- Page 4
	org	0x8000, 0xBFFF
ImageData_4:
    INCBIN "Graphics/Bitmaps/aerofighters_3.sra.new"
    ;INCBIN "Images/aerofighters-bg2_3.sra.new"
.size:      equ $ - ImageData_4
	ds PageSize - ($ - 0x8000), 255

; ------- Page 5
	org	0x8000, 0xBFFF
ImageData_5:
    INCBIN "Graphics/Bitmaps/aerofighters_4.sra.new"
    ;INCBIN "Images/aerofighters-bg2_4.sra.new"
.size:      equ $ - ImageData_5
	ds PageSize - ($ - 0x8000), 255

; ------- Page 6
	org	0x8000, 0xBFFF
ImageData_6:
    INCBIN "Graphics/Bitmaps/aerofighters_5.sra.new"
    ;INCBIN "Images/aerofighters-bg2_5.sra.new"
.size:      equ $ - ImageData_6
	ds PageSize - ($ - 0x8000), 255

; ------- Page 7
	org	0x8000, 0xBFFF
ImageData_7:
    INCBIN "Graphics/Bitmaps/aerofighters_6.sra.new"
    ;INCBIN "Images/aerofighters-bg2_6.sra.new"
.size:      equ $ - ImageData_7
	ds PageSize - ($ - 0x8000), 255

; ------- Page 8
	org	0x8000, 0xBFFF
ImageData_8:
    INCBIN "Graphics/Bitmaps/aerofighters_7.sra.new"
    ;INCBIN "Images/aerofighters-bg2_7.sra.new"
.size:      equ $ - ImageData_8
	ds PageSize - ($ - 0x8000), 255

; ------- Page 9
	org	0x8000, 0xBFFF
ImageData_9:
    INCBIN "Graphics/Bitmaps/aerofighters_8.sra.new"
    ;INCBIN "Images/aerofighters-bg2_8.sra.new"
.size:      equ $ - ImageData_9
	ds PageSize - ($ - 0x8000), 255

; ------- Page 10
	org	0x8000, 0xBFFF
ImageData_10:
    INCBIN "Graphics/Bitmaps/aerofighters_9.sra.new"
    ;INCBIN "Images/aerofighters-bg2_9.sra.new"
.size:      equ $ - ImageData_10
	ds PageSize - ($ - 0x8000), 255

; ------- Page 11
	org	0x8000, 0xBFFF
ImageData_11:
    INCBIN "Graphics/Bitmaps/aerofighters_10.sra.new"
    ;INCBIN "Images/aerofighters-bg2_10.sra.new"
.size:      equ $ - ImageData_11
	ds PageSize - ($ - 0x8000), 255

; ------- Page 12
	org	0x8000, 0xBFFF
ImageData_12:
    INCBIN "Graphics/Bitmaps/aerofighters_11.sra.new"
    ;INCBIN "Images/aerofighters-bg2_11.sra.new"
.size:      equ $ - ImageData_12
	ds PageSize - ($ - 0x8000), 255

; ------- Page 13
	org	0x8000, 0xBFFF
ImageData_13:
    INCBIN "Graphics/Bitmaps/aerofighters_12.sra.new"
    ;INCBIN "Images/aerofighters-bg2_12.sra.new"
.size:      equ $ - ImageData_13
	ds PageSize - ($ - 0x8000), 255

; ------- Page 14
	org	0x8000, 0xBFFF
ImageData_14:
    INCBIN "Graphics/Bitmaps/aerofighters_13.sra.new"
    ;INCBIN "Images/aerofighters-bg2_13.sra.new"
.size:      equ $ - ImageData_14
	ds PageSize - ($ - 0x8000), 255

; ------- Page 15
	org	0x8000, 0xBFFF
ImageData_15:
    INCBIN "Graphics/Bitmaps/aerofighters_14.sra.new"
    ;INCBIN "Images/aerofighters-bg2_14.sra.new"
.size:      equ $ - ImageData_15
	ds PageSize - ($ - 0x8000), 255

; ------- Page 16
	org	0x8000, 0xBFFF
ImageData_16:
    INCBIN "Graphics/Bitmaps/aerofighters_15.sra.new"
    ;INCBIN "Images/aerofighters-bg2_15.sra.new"
.size:      equ $ - ImageData_16
	ds PageSize - ($ - 0x8000), 255



; RAM
	org     0xc000, 0xe5ff                   ; for machines with 16kb of RAM (use it if you need 16kb RAM, will crash on 8kb machines, such as the Casio PV-7)

    INCLUDE "Variables.s"
