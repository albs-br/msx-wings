TitleScreen:

    ; change to screen 5
    ld      a, 5
    call    BIOS_CHGMOD

    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToTransparent

    ; load palette

    ; --------------- load title screen on the second page (not visible)
    xor     a           	; set vram write base address
    ld      hl, 0x8000     	;  to 1st byte of page 1...
    call    SetVDP_Write

    ld	    a, TITLE_SCREEN_FIRST_MEGAROM_PAGE
	ld	    (Seg_P8000_SW), a
    ld      hl, 0x8000      ;TitleScreen_Image
    ld      c, PORT_0
    ld      d, 64               ; 64 x 256 = 16kb
    ld      b, 0                ; 
.loop:
    otir
    dec     d
    jp      nz, .loop
    ; ---------------         


    ; copy image from second page to first page
    ld      hl, .HMMM_Parameters
    call    Execute_VDP_HMMM


    call    BIOS_ENASCR


.testLoop:
    jp .testLoop

    ret

.HMMM_Parameters:
   dw    0, 256 	; Source X (9 bits), Source Y (10 bits)
   dw    0, 0 	    ; Destiny X (9 bits), Destiny Y (10 bits)
   dw    256, 128   ; number of cols (9 bits), number of lines (10 bits)
   db    0, 0, VDP_COMMAND_HMMM
