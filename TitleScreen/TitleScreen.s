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

    ; --------------- load title screen (first 16kb) on the second page (not visible)
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

    ; --------------- load title screen (second 8kb) on the second page (not visible)
    xor     a           	; set vram write base address
    ld      hl, 0xc000     	; line 128
    call    SetVDP_Write

    ld	    a, TITLE_SCREEN_FIRST_MEGAROM_PAGE + 1
	ld	    (Seg_P8000_SW), a
    ld      hl, 0x8000      ;TitleScreen_Image
    ld      c, PORT_0
    ld      d, 32               ; 32 x 256 = 8kb
    ld      b, 0                ; 
.loop_1:
    otir
    dec     d
    jp      nz, .loop_1
    ; ---------------         



    ; ; copy image from second page to first page
    ; ld      hl, .HMMM_Parameters
    ; call    Execute_VDP_HMMM


    call    BIOS_ENASCR

    ; -------------------- animation

    ; copy from initial HMMM parameters to buffer
    ld      hl, .HMMM_Parameters
    ld      de, VDP_HMMM_Parameters
    ld      bc, .HMMM_Parameters_size
    ldir


    ld      ixh, 255                    ; variable for image X destiny

.titleAnimationLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.titleAnimationLoop_waitVBlank:
    cp      (hl)
    jr      z, .titleAnimationLoop_waitVBlank

    ld      hl, VDP_HMMM_Parameters + 4    ; HMMM parameter Destiny X
    ld      a, ixh
    ld      (hl), a

    dec     a
    jp      z, .exit

    ld      ixh, a

    ; copy image from second page to first page
    ld      hl, VDP_HMMM_Parameters
    call    Execute_VDP_HMMM

    jp      .titleAnimationLoop


.exit:

.testLoop:
    jp .testLoop

    ret

.HMMM_Parameters:
   dw    0, 256 	; Source X (9 bits), Source Y (10 bits)
   dw    0, 0 	    ; Destiny X (9 bits), Destiny Y (10 bits)
   dw    256, 192   ; number of cols (9 bits), number of lines (10 bits)
   db    0, 0, VDP_COMMAND_HMMM
.HMMM_Parameters_size: equ $ - .HMMM_Parameters