TitleScreen:

    ; change to screen 5
    ld      a, 5
    call    BIOS_CHGMOD


    ; ; debug:
    ; ld 		a, 1      	            ; Foreground color
    ; ld 		(BIOS_FORCLR), a    
    ; ld 		a, 5  		            ; Background color
    ; ld 		(BIOS_BAKCLR), a     
    ; ld 		a, 15      	            ; Border color
    ; ld 		(BIOS_BDRCLR), a    
    ; call 	BIOS_CHGCLR        		; Change Screen Color


    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToTransparent

    ; ; test - write pixel at 0, 0
    ; ld      a, 0000 0000 b
    ; ld      hl, NAMTBL
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      a, 0x60
    ; out     (c), a



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
    ; ld      hl, HMMM_Parameters
    ; call    Execute_VDP_HMMM


    call    BIOS_ENASCR

    ; -------------------- animation

    ; copy from initial HMMM parameters to buffer
    ld      hl, HMMM_Parameters
    ld      de, VDP_HMMM_Params_Buffer
    ld      bc, HMMM_Parameters_size
    ldir


    ; load palette
    ld      hl, PaletteData
    call    LoadPalette


    ; ; test
    ; ld      hl, TitleColor_0_First + 10
    ; ld      a, 0x0d
    ; call    SetPaletteColor_FromAddress


.initLoop:
    ld      a, 248
    ld      (VDP_HMMM_Params_Buffer.Destiny_X), a

.titleAnimationLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.titleAnimationLoop_waitVBlank:
    cp      (hl)
    jr      z, .titleAnimationLoop_waitVBlank



    ; Save Jiffy to check if previous frame ended
    ld      a, (hl)
    ld      (CurrentJiffy), a



    ld      a, (VDP_HMMM_Params_Buffer.Destiny_X)

    sub     a, 8

    ld      (VDP_HMMM_Params_Buffer.Destiny_X), a

    ; copy image from second page to first page
    ld      hl, VDP_HMMM_Params_Buffer
    call    Execute_VDP_HMMM


    ; if (X_destiny == 0) jp .next
    ld      a, (VDP_HMMM_Params_Buffer.Destiny_X)
    or      a
    jp      z, .next

    ; Checks if loop takes more than one frame to run
    ld      a, (BIOS_JIFFY)
    ld      b, a
    ld      a, (CurrentJiffy)
    cp      b
    call    nz, .frameSkip


    jp      .titleAnimationLoop


.next:

    ld      a, (VDP_HMMM_Params_Buffer.Destiny_Y)
    add     32
    cp      192
    jp      z, .changeToGoingUp
    ld      (VDP_HMMM_Params_Buffer.Destiny_Y), a

    ld      a, (VDP_HMMM_Params_Buffer.Source_Y)
    add     32
    ld      (VDP_HMMM_Params_Buffer.Source_Y), a

    jp      .initLoop

;.paletteAnimation:

    ; ld      ix, TitleColor_0_First
    ; ld      iyh, 0                      ; IYH: control direction. 0: going up; 1: going down

.paletteAnimationLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.paletteAnimationLoop_waitVBlank:
    cp      (hl)
    jr      z, .paletteAnimationLoop_waitVBlank


    ; animation only at each 4 frames
    ld      a, (BIOS_JIFFY)         ; get only low byte of JIFFY
    and     0000 0111 b
    jp      nz, .paletteAnimationLoop


    ; HL = IX
    ld      a, ixh
    ld      h, a
    ld      a, ixl
    ld      l, a

    push    hl
        ;ld      a, 0x06
        ld      a, 0x0d
        call    SetPaletteColor_FromAddress
    pop     hl

    ld      de, TitleColor_0_Size
    add     hl, de
    ld      a, 0x06
    call    SetPaletteColor_FromAddress

    ld      a, iyh
    or      a
    jp      nz, .goingDown

;.goingUp:
    inc     ix
    inc     ix

    ; ; HL = IX
    ; ld      a, ixh
    ; ld      h, a
    ; ld      a, ixl
    ; ld      l, a

    ; HL = IX
    push    ix
    pop     hl

    ; ; IX = HL
    ; ld      a, h
    ; ld      ixh, a
    ; ld      a, l
    ; ld      ixl, a

    ld      de, TitleColor_0_End
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp      z, .changeToGoingDown

    jp      .paletteAnimationLoop

.goingDown:
    dec     ix
    dec     ix

    ; HL = IX
    push    ix
    pop     hl

    ld      de, TitleColor_0_First - 2
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp      z, .changeToGoingUp

    jp      .paletteAnimationLoop

.changeToGoingDown:
    ld      ix, TitleColor_0_Last
    ld      iyh, 1                      ; IYH: control direction. 0: going up; 1: going down
    jp      .paletteAnimationLoop

.changeToGoingUp:
    ld      ix, TitleColor_0_First
    ld      iyh, 0                      ; IYH: control direction. 0: going up; 1: going down
    jp      .paletteAnimationLoop

.endAnimation:

.testLoop:
    jp .testLoop

    ret

.frameSkip:
    ld      hl, FramesSkipped
    inc     (hl)
    ret


HMMM_Parameters:
.Source_X:   dw    0 	    ; Source X (9 bits)
.Source_Y:   dw    256 	    ; Source Y (10 bits)
.Destiny_X:  dw    0 	    ; Destiny X (9 bits)
.Destiny_Y:  dw    0 	    ; Destiny Y (10 bits)
.Cols:       dw    256      ; number of cols (9 bits)
.Lines:      dw    32       ; number of lines (10 bits)
.NotUsed:    db    0, 0
.Command:    db    VDP_COMMAND_HMMM
HMMM_Parameters_size: equ $ - HMMM_Parameters

;    dw    0, 256 	; Source X (9 bits), Source Y (10 bits)
;    dw    0, 0 	    ; Destiny X (9 bits), Destiny Y (10 bits)
;    dw    256, 32   ; number of cols (9 bits), number of lines (10 bits)
;    db    0, 0, VDP_COMMAND_HMMM




;       first byte:  high nibble: red 0-7; low nibble: blue 0-7
;       second byte: high nibble: 0000; low nibble:  green 0-7
TitleColor_0_First:
    db      0x77, 0x07
    db      0x66, 0x06
    db      0x55, 0x05
    db      0x44, 0x04
    db      0x33, 0x03
    db      0x22, 0x02
    db      0x11, 0x01
TitleColor_0_Last:
    db      0x00, 0x00
TitleColor_0_End:
TitleColor_0_Size: equ $ - TitleColor_0_First

TitleColor_1_First:
    db      0x00, 0x00
    db      0x11, 0x01
    db      0x22, 0x02
    db      0x33, 0x03
    db      0x44, 0x04
    db      0x55, 0x05
    db      0x66, 0x06
TitleColor_1_Last:
    db      0x77, 0x07
TitleColor_1_End: