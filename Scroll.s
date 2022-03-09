BYTES_PER_LINE:         equ 256     ; screen 11
;BYTES_PER_LINE:         equ 128    ; screen 5


ADDR_LAST_LINE_OF_PAGE: equ 0x8000 + (63 * 256)

; Input:
;   A: number of MegaROM page for first page after first screen
InitVariablesForScroll:
    ; initialize variables for scrolling on last line of the next page
    ;ld      a, 13
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

; Input:
;   A: number of MegaROM page for last page of first screen
LoadFirstScreen:
; --------- Load first screen     

    push    af
        dec     a
        call    InitVariablesForScroll
    pop     af


    push    af
        ; -- Load top part of first image on top 64 lines
        ;ld	    a, 14
        ld	    (Seg_P8000_SW), a
        ; write to VRAM bitmap area
        ld		hl, START_ADDR_MEGAROM_PAGE ; ImageData_14        			    ; RAM address (source)
        ld		de, NAMTBL + (0 * (256 * 64))                ; VRAM address (destiny)
        ld		bc, PAGE_SIZE ; ImageData_14.size				    ; Block length
        call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory
    pop     af
    
    inc     a
    push    af
        ; -- Load middle part of first image on middle 64 lines
        ;ld	    a, 15
        ld	    (Seg_P8000_SW), a
        ; write to VRAM bitmap area
        ld		hl, START_ADDR_MEGAROM_PAGE ; ImageData_15      				    ; RAM address (source)
        ld		de, NAMTBL + (1 * (256 * 64))                ; VRAM address (destiny)
        ld		bc, PAGE_SIZE ; ImageData_15.size					; Block length
        call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory
    pop     af

    inc     a
    push    af
        ; -- Load bottom part of first image on last 64 lines
        ;ld	    a, 16
        ld	    (Seg_P8000_SW), a
        ; write to VRAM bitmap area
        ld		hl, START_ADDR_MEGAROM_PAGE ; ImageData_16      				    ; RAM address (source)
        ld		de, NAMTBL + (2 * (256 * 64))                ; VRAM address (destiny)
        ld		bc, PAGE_SIZE ; ImageData_16.size					; Block length
        call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory
    pop     af

    ret


SCROLL_FULL_SPEED:      equ 0000 0000 b
SCROLL_HALF_SPEED:      equ 0000 0001 b

ExecuteScroll:

    ; speed scroll (scroll only on even frames or on all frames)
    ld      a, (BIOS_JIFFY)         ; get only low byte of JIFFY
    and     SCROLL_FULL_SPEED
    ;and     SCROLL_HALF_SPEED
    ret     nz


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
    cp      0x80 - 1                                ; 0x7fff
    jp      z, .decPage
    jp      .dontDecPage
.decPage:
    ; if (CurrentMegaROMPage == CurrentLevelLastScreen) stopScroll
    ld      a, (CurrentLevelLastScreen)
    ld      b, a
    ld      a, (CurrentMegaROMPage)
    cp      b
    jp      z, .stopScroll

    ; if (CurrentMegaROMPage == 1) stopScroll
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


    ld      hl, Screen_Y_Origin
    dec     (hl)

    
    call    AdjustSprites_Y


    ret

.stopScroll:
    jp      .stopScroll
    ;jp      Execute


AdjustSprites_Y:
    ; ajust Y position of sprites to compensate scroll

    ld      hl, Player_Y
    call    .adjustSprite


    ; player shots are so fast that they don't need such a small adjust (let's save some CPU cycles!)
    ; ld      hl, PlayerShot_0_Struct + 2
    ; call    .adjustSprite
    ; ld      hl, PlayerShot_1_Struct + 2
    ; call    .adjustSprite
    ; ld      hl, PlayerShot_2_Struct + 2
    ; call    .adjustSprite
    

    ld      hl, Enemy_0_Struct + 2  ; Y
    call    .adjustSprite
    ld      hl, Enemy_0_Struct + 11 ; Y1
    call    .adjustSprite

    ld      hl, Enemy_1_Struct + 2
    call    .adjustSprite
    ld      hl, Enemy_1_Struct + 11
    call    .adjustSprite

    ld      hl, Enemy_2_Struct + 2
    call    .adjustSprite
    ld      hl, Enemy_2_Struct + 11
    call    .adjustSprite

    ld      hl, Enemy_3_Struct + 2
    call    .adjustSprite
    ld      hl, Enemy_3_Struct + 11
    call    .adjustSprite

    ld      hl, Enemy_4_Struct + 2
    call    .adjustSprite
    ld      hl, Enemy_4_Struct + 11
    call    .adjustSprite

    ld      hl, Enemy_5_Struct + 2
    call    .adjustSprite
    ld      hl, Enemy_5_Struct + 11
    call    .adjustSprite

    ld      hl, Enemy_6_Struct + 2
    call    .adjustSprite
    ld      hl, Enemy_6_Struct + 11
    call    .adjustSprite


    ld      hl, EnemyShot_0_Struct + 2
    call    .adjustSprite
    ld      hl, EnemyShot_1_Struct + 2
    call    .adjustSprite
    ld      hl, EnemyShot_2_Struct + 2
    call    .adjustSprite
    ld      hl, EnemyShot_3_Struct + 2
    call    .adjustSprite
    ld      hl, EnemyShot_4_Struct + 2
    call    .adjustSprite
    ld      hl, EnemyShot_5_Struct + 2
    call    .adjustSprite
    ld      hl, EnemyShot_6_Struct + 2
    call    .adjustSprite

    ret

.adjustSprite:

    ; CAUTION: Adjust is only working when the objects are moving on 1px or 3px increments on Y coord (don't know why)

    ld      a, (hl)
    dec     a
    
    ; commented out because it was causing bug
    ;cp      216             ; avoid value 216 (hide all sprites)
    ;jp      nz, .continue
    ;ld      a, 215
.continue:
    ld      (hl), a
    ret