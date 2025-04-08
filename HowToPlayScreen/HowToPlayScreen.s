; CAUTION: THIS ROUTINE CANNOT BE MORE THAN 1 KB LONG, BECAUSE IT WILL BE REALOCATED TO RAM!
HowToPlayScreen:

    ; change to screen 5
    call    Screen5



    ld      hl, PaletteData_0
    call    LoadPalette


    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    call    Set_and_Save_MegaROM_Page



    ; clear UncompressedData RAM area
    xor     a
    ld      (UncompressedData), a
    ld      hl, UncompressedData
    ld      de, UncompressedData + 1
    ld      bc, UncompressedData.size - 1
    ldir




    ld      hl, String_HowToPlay
    ld      de, SC5_NAMTBL_PAGE_0 + (128 * 8) + (((256-(11*16))/2)/2) ; line 8, column ?
    call    DrawString_LargeFont_SC5

    ; ld      hl, String_HowToPlay
    ; ld      de, SC5_NAMTBL_PAGE_0 + (128 * 32) + (((256-(11*16))/2)/2)
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





    call    BIOS_ENASCR


    ; -----------------------------------------------------------------------------------

    ld      b, 1 * 60       ; 1 second
    call    Wait_B_Vblanks

.loop:

    call    Wait_Vblank

    ld      a, 0                    ; read spacebar
    call    BIOS_GTTRIG
    jp      nz, .triggerPressed

    ld      a, 1                    ; read button A of joystick 1
    call    BIOS_GTTRIG
    jp      nz, .triggerPressed

    ld      a, 3                    ; read button B of joystick 1
    call    BIOS_GTTRIG
    jp      nz, .triggerPressed

    jp      .loop


.triggerPressed:
    ld      a, SFX_EXPLOSION  ; number of sfx in the bank
    ld      c, 15            ; sound priority
    call    PlaySfx
    ret     ; return, exiting this screen



String_HowToPlay: db 'HOW TO PLAY', 0
String_HowToPlay_1: db 'Cursors/Joystick: Move plane', 0
String_HowToPlay_2: db 'Spacebar/Button A: Shot', 0
String_HowToPlay_3: db 'Delete key/Button B: Bomb', 0
String_HowToPlay_4: db 'Home key: Pause', 0



