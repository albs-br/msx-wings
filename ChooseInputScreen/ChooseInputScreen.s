ChooseInputScreen:

    ; change to screen 5
    ld      a, 5
    call    BIOS_CHGMOD


    ld 		a, 15      	            ; Foreground color
    ld 		(BIOS_FORCLR), a    
    ld 		a, 15  		            ; Background color
    ld 		(BIOS_BAKCLR), a     
    ld 		a, 15      	            ; Border color
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color


    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToNonTransparent

    ; disable sprites to improve VDP commands speed


    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a


    ld      hl, PlaneRotating_Palette
    call    LoadPalette


    ; load and unpack zx0 frame 0

    ; put it on page 0

    jp      $

    ret