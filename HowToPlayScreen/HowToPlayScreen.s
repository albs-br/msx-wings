; CAUTION: THIS ROUTINE CANNOT BE MORE THAN 1 KB LONG, BECAUSE IT WILL BE REALOCATED TO RAM!
HowToPlayScreen:

    ; change to screen 5
    ld      a, 5
    call    BIOS_CHGMOD


    ld 		a, 4      	            ; Foreground color
    ld 		(BIOS_FORCLR), a    
    ld 		a, 4  		            ; Background color
    ld 		(BIOS_BAKCLR), a     
    ld 		a, 4      	            ; Border color
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color

; jp $
ret

    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToTransparent

    ; disable sprites to improve VDP commands speed
    ; call    DisableSprites


    ; ; set MegaROM page for How To Play Screen data
    ; ld      a, HOW_TO_PLAY_SCREEN_DATA_MEGAROM_PAGE
    ; call    Set_and_Save_MegaROM_Page


    ; load bg to all 4 pages (upper screen)


    ret