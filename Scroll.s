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

    ld      b, a         ; data

    ld      c, 23        ; register #
    call    BIOS_WRTVDP

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
        ; ld	    (Seg_P8000_SW), a
        call    Set_and_Save_MegaROM_Page

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
        ; ld	    (Seg_P8000_SW), a
        call    Set_and_Save_MegaROM_Page

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
        ; ld	    (Seg_P8000_SW), a
        call    Set_and_Save_MegaROM_Page

        ; write to VRAM bitmap area
        ld		hl, START_ADDR_MEGAROM_PAGE ; ImageData_16      				    ; RAM address (source)
        ld		de, NAMTBL + (2 * (256 * 64))                ; VRAM address (destiny)
        ld		bc, PAGE_SIZE ; ImageData_16.size					; Block length
        call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory
    pop     af

    ret


SCROLL_FULL_SPEED:          equ 0000 0000 b
SCROLL_HALF_SPEED:          equ 0000 0001 b
SCROLL_ONE_FOURTH_SPEED:    equ 0000 0011 b

SCROLL_SPEED:           equ SCROLL_ONE_FOURTH_SPEED

ExecuteScroll:

    ; speed scroll (scroll only on even frames or on all frames, or at 1/4 of frames)
    ld      a, (BIOS_JIFFY)         ; get only low byte of JIFFY
    and     SCROLL_SPEED
    ret     nz


    IFDEF DEBUG
        ; Start profiling a section with in a,(2ch), end with out (2ch),a. ID in A.
        xor a
        in a, (2ch)
    ENDIF


    ; load next line from bitmap on the last line of virtual screen (256 lines)
    ; that will be the next to be shown on top of screen
    ld	    a, (CurrentMegaROMPage)
	; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ; old (slow)
    ; ld      hl, (CurrentAddrLineScroll)             ; RAM address (source)
    ; ld		de, (CurrentVRAMAddrLineScroll)         ; VRAM address (destiny)
    ; ld		bc, 256					                ; Block length
    ; call 	BIOS_LDIRVM        						; Block transfer to VRAM from memory

    ; new (optimized) OTIR = 23 cycles/byte = 256x23 = 5888 cycles/frame ; OUTI = 18 cycles/byte = 256x18 = 4608 cycles/frame
    ld      a, 0000 0000 b
    ld		hl, (CurrentVRAMAddrLineScroll)         ; VRAM address (destiny)
    call    SetVdp_Write
    ; unrolled OUTIs
    ld      hl, (CurrentAddrLineScroll)             ; RAM address (source)
    ld      c, PORT_0
    ld      d, 8
.loopOUTI:
        ; 32x OUTI
        call    OUTI_x32
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
        ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    dec     d
    jp      nz, .loopOUTI



    ; TODO: use VDP command to gain speed (HMMC copies data from your ram to the vram)
    ; info: HMMC VDP command currently is not working, check msx-tests POC
    ; 
    ; ld      hl, LMMM_Parameters
    ; call    Execute_VDP_LMMM        ; Logical move CPU to VRAM (copies data from your ram to the vram)



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


    IFDEF DEBUG
        ; Start profiling a section with in a,(2ch), end with out (2ch),a. ID in A.
        xor a
        out (2ch), a
    ENDIF

    ret

.stopScroll:
    call    StageClearAnimation_RAM_Code
    call    NextLevel
    ret

AdjustSprites_Y:
    ; adjust Y position of sprites to compensate scroll

    ld      hl, Player_Y
    dec     (hl) ; call    .adjustSprite


    ; player shots are so fast that they don't need such a small adjust (let's save some CPU cycles!)
    ; ld      hl, PlayerShot_0_Struct + 2
    ; call    .adjustSprite
    ; ld      hl, PlayerShot_1_Struct + 2
    ; call    .adjustSprite
    ; ld      hl, PlayerShot_2_Struct + 2
    ; call    .adjustSprite
    

    ; TODO: if (EnemyMode == ENEMY_MODE_SMALL_ENEMIES)

    ld      hl, Enemy_0_Struct + 2  ; Y
    dec     (hl) ; call    .adjustSprite
    ld      hl, Enemy_0_Struct + 11 ; Y1
    dec     (hl) ; call    .adjustSprite

    ld      hl, Enemy_1_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Enemy_1_Struct + 11
    dec     (hl) ; call    .adjustSprite

    ld      hl, Enemy_2_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Enemy_2_Struct + 11
    dec     (hl) ; call    .adjustSprite

    ld      hl, Enemy_3_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Enemy_3_Struct + 11
    dec     (hl) ; call    .adjustSprite

    ld      hl, Enemy_4_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Enemy_4_Struct + 11
    dec     (hl) ; call    .adjustSprite

    ld      hl, Enemy_5_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Enemy_5_Struct + 11
    dec     (hl) ; call    .adjustSprite

    ld      hl, Enemy_6_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Enemy_6_Struct + 11
    dec     (hl) ; call    .adjustSprite


    ; adjust all Ys of Big Enemies
    ld      hl, BigEnemy_0_Struct + 2  ; Y
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_0_Struct + 9  ; Y1
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_0_Struct + 11 ; Y2
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_0_Struct + 13 ; Y3
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_0_Struct + 15 ; Y4
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_0_Struct + 17 ; Y5
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_0_Struct + 19 ; Y6
    dec     (hl) ; call    .adjustSprite

    ld      hl, BigEnemy_1_Struct + 2  ; Y
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_1_Struct + 9  ; Y1
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_1_Struct + 11 ; Y2
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_1_Struct + 13 ; Y3
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_1_Struct + 15 ; Y4
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_1_Struct + 17 ; Y5
    dec     (hl) ; call    .adjustSprite
    ld      hl, BigEnemy_1_Struct + 19 ; Y6
    dec     (hl) ; call    .adjustSprite



    ld      hl, EnemyShot_0_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, EnemyShot_1_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, EnemyShot_2_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, EnemyShot_3_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, EnemyShot_4_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, EnemyShot_5_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, EnemyShot_6_Struct + 2
    dec     (hl) ; call    .adjustSprite


    ld      hl, Item_0_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ; ld      hl, Item_0_Struct + 11        ; y1 isn't used for items
    ; call    .adjustSprite
    ld      hl, Item_1_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Item_2_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Item_3_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Item_4_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Item_5_Struct + 2
    dec     (hl) ; call    .adjustSprite
    ld      hl, Item_6_Struct + 2
    dec     (hl) ; call    .adjustSprite


    ld      hl, GroundTarget_Sprite.Y
    dec     (hl) ; call    .adjustSprite

    ret

; .adjustSprite:

;     ; CAUTION: Adjust is only working when the objects are moving on 1px or 3px increments on Y coord (don't know why)

;     ; TODO: if this routine has only one instruction, 
;     ; substitute the call by the instruction itself saving 18 (call) + 11 (ret) = 29 cycles per object (!), aprox 900 cycles, pretty good optimization
;     dec     (hl)

; ;     ld      a, (hl)
; ;     dec     a
    
; ;     ; commented out because it was causing bug
; ;     ;cp      216             ; avoid value 216 (hide all sprites)
; ;     ;jp      nz, .continue
; ;     ;ld      a, 215
; ; .continue:
; ;     ld      (hl), a
;     ret