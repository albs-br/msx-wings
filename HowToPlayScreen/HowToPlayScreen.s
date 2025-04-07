; CAUTION: THIS ROUTINE CANNOT BE MORE THAN 1 KB LONG, BECAUSE IT WILL BE REALOCATED TO RAM!
HowToPlayScreen:

    ; change to screen 5
    ld      a, 5
    call    BIOS_CHGMOD


    ld 		a, 1      	            ; Foreground color
    ld 		(BIOS_FORCLR), a    
    ld 		a, 1  		            ; Background color
    ld 		(BIOS_BAKCLR), a     
    ld 		a, 1      	            ; Border color
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        		; Change Screen Color

; ; jp $
; ret

    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToTransparent

    ; call    BIOS_ENASCR



    ; ---- draw test string with 16x16 chars
    ; starting line 90

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    call    Set_and_Save_MegaROM_Page

    ld      hl, String_HowToPlay
    ld      de, SC5_NAMTBL_PAGE_0 + (128 * 8) + (((256-(11*16))/2)/2) ; line 8, column ?
    call    DrawString_LargeFont_SC5

    ; ld      hl, String_HowToPlay
    ; ld      de, SC5_NAMTBL_PAGE_0 + (128 * 64) + (((256-(11*16))/2)/2)
    ; call    DrawString_MediumFont_SC5


    ld      hl, String_HowToPlay_1
    ld      de, SC5_NAMTBL_PAGE_0 + (128 * 64) + 16
    call    DrawString_SmallFont_SC5

    ld      hl, String_HowToPlay_2
    ld      de, SC5_NAMTBL_PAGE_0 + (128 * 80) + 16
    call    DrawString_SmallFont_SC5

    ld      hl, String_HowToPlay_3
    ld      de, SC5_NAMTBL_PAGE_0 + (128 * 96) + 16
    call    DrawString_SmallFont_SC5

    ld      hl, String_HowToPlay_4
    ld      de, SC5_NAMTBL_PAGE_0 + (128 * 112) + 16
    call    DrawString_SmallFont_SC5



    ld      hl, PaletteData_0
    call    LoadPalette

    call    BIOS_ENASCR

jp $

    ret



String_HowToPlay: db 'HOW TO PLAY', 0
String_HowToPlay_1: db 'Cursors/Joystick: Move plane', 0
String_HowToPlay_2: db 'Spacebar/Button A: Shot', 0
String_HowToPlay_3: db 'Delete key/Button B: Bomb', 0
String_HowToPlay_4: db 'Home key: Pause', 0



