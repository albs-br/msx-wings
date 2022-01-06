InitVariablesForScroll:
    ; initialize variables for scrolling on last line of the next page
    ld      a, 13
    ld      (CurrentMegaROMPage), a
    ld      hl, ADDR_LAST_LINE_OF_PAGE
    ld      (CurrentAddrLineScroll), hl
    ld      hl, 255 * 256
    ld      (CurrentVRAMAddrLineScroll), hl

    ; VerticalScroll: byte
    xor     a
    ld      (VerticalScroll), a

    ; VerticalScroll: word
    ; ld      hl, 0
    ; ld      (VerticalScroll), hl

    ret

LoadFirstScreen:
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


    ret



ExecuteScroll:

    ; TODO: use VDP command to gain speed

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


    ; -------------- do vertical scroll

    ; VerticalScroll: word
    ; ld      hl, (VerticalScroll)
    ; dec     hl
    ; ld      (VerticalScroll), hl
    ; ld      b, l            ; data

    ; VerticalScroll: byte
    ld      hl, VerticalScroll
    dec     (hl)
    ld      b, (hl)         ; data

    ld      c, 23           ; register #
    call    BIOS_WRTVDP

    ret

.stopScroll:
    jp      .stopScroll



AdjustSprites_Y:
    ; ajust Y position of sprites to compensate scroll

    ld      hl, Player_Y
    call    .adjustSprite
;     ld      a, (Player_Y)
;     dec     a
;     cp      216             ; avoid value 216 (hide all sprites)
;     jp      nz, .continue
;     ld      a, 215
; .continue:
;     ld      (Player_Y), a


    ld      hl, PlayerShot_0_Struct + 2
    call    .adjustSprite
;     ld      a, (PlayerShot_0_Struct + 2)    ; Y
;     dec     a
;     cp      216             ; avoid value 216 (hide all sprites)
;     jp      nz, .continue_1
;     ld      a, 215
; .continue_1:
;     ld      (PlayerShot_0_Struct + 2), a
    
    ret

.adjustSprite:
    ld      a, (hl)
    dec     a
    cp      216             ; avoid value 216 (hide all sprites)
    jp      nz, .continue
    ld      a, 215
.continue:
    ld      (hl), a
    ret