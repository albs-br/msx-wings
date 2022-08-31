TitleScreen:

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

    call    DisableSprites

    ; ; test - write pixel at 0, 0
    ; ld      a, 0000 0000 b
    ; ld      hl, NAMTBL
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      a, 0x60
    ; out     (c), a


    ; init vars
    xor     a
    ld      (Title_Counter), a

    ; --------------- fill screen with color 1
    xor     a           	; set vram write base address
    ld      hl, 0x0000     	;  to 1st byte of page 1...
    call    SetVDP_Write
    ld      c, PORT_0
    ld      d, 96               ; 96 x 256 = all 256x192 pixels of screen 5
    ld      b, 0                ; 
    ld      a, 0x11
.loop_2:
    out     (c), a
    djnz    .loop_2
    dec     d
    jp      nz, .loop_2



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

; -------------------- animation title entering screen from right border

    ; copy from initial HMMM parameters to buffer
    ld      hl, HMMM_Parameters
    ld      de, VDP_HMMM_Params_Buffer
    ld      bc, HMMM_Parameters_size
    ldir


    ; load palette
    ld      hl, Title_PaletteData
    call    LoadPalette


    ; ; test
    ; ld      hl, TitleColor_0_First + 10
    ; ld      a, 0x0d
    ; call    SetPaletteColor_FromAddress


.initLoop:
    ld      a, 248
    ld      (VDP_HMMM_Params_Buffer.Destiny_X), a

.titleAnimationLoop:
    call    Wait_Vblank


    ; Save Jiffy to check if previous frame ended
    ld      a, (BIOS_JIFFY)
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
    ; jp      z, .changeToGoingUp
    jp      z, .screenAdjustAnimationLoop
    ld      (VDP_HMMM_Params_Buffer.Destiny_Y), a

    ld      a, (VDP_HMMM_Params_Buffer.Source_Y)
    add     32
    ld      (VDP_HMMM_Params_Buffer.Source_Y), a

    jp      .initLoop

;.paletteAnimation:

    ; ld      ix, TitleColor_0_First
    ; ld      iyh, 0                      ; IYH: control direction. 0: going up; 1: going down

; -------------------- animation screen shaking left and right


.screenAdjustAnimationLoop:
    call    Wait_Vblank


    ld      a, (Title_Counter)
    inc     a
    ld      (Title_Counter), a
    cp      128
    jp      z, .exitScreenAdjustAnimationLoop

    ; switch between left and right adjust
    ld      a, (BIOS_JIFFY)         ; get only low byte of JIFFY
    and     0000 0001 b
    jp      nz, .scrLeft

    ; Screen adjust to the right
    ld      b, 15            ; (7-1: left; 15-8: right; 0: center)
    ld      c, 18            ; register #
    call    BIOS_WRTVDP

    jp      .screenAdjustAnimationLoop

.exitScreenAdjustAnimationLoop:
    ; Screen adjust to center
    ld      b, 0             ; (7-1: left; 15-8: right; 0: center)
    ld      c, 18            ; register #
    call    BIOS_WRTVDP

    ; reset counter
    xor     a
    ld      (Title_Counter), a

    jp      .changeToGoingUp

.scrLeft:
    ; Screen adjust to the left
    ld      b, 1             ; (7-1: left; 15-8: right; 0: center)
    ld      c, 18            ; register #
    call    BIOS_WRTVDP

    jp      .screenAdjustAnimationLoop


; -------------------- animation fading in and out from/to black and white

.paletteAnimationLoop:
    call    Wait_Vblank


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
        
        ; push    hl
        ;     ld      a, 0x06
        ;     call    SetPaletteColor_FromAddress
        ; pop     hl

        ld      a, 0x00
        call    SetPaletteColor_FromAddress

    pop     hl

    ld      de, TitleColor_0_Size
    add     hl, de


    ; set this color to color indexes 1 to 14
    ld      a, 1
.loop_3:
    push    af
        push    hl
            call    SetPaletteColor_FromAddress
        pop     hl
    pop     af
    inc     a
    cp      15
    jp      nz, .loop_3



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

    ; if (counter == 3) endAnimation
    ld      a, (Title_Counter)
    inc     a
    ld      (Title_Counter), a
    cp      2
    jp      z, .endAnimation

    ld      ix, TitleColor_0_Last
    ld      iyh, 1                      ; IYH: control direction. 0: going up; 1: going down
    jp      .paletteAnimationLoop

.changeToGoingUp:
    ld      ix, TitleColor_0_First
    ld      iyh, 0                      ; IYH: control direction. 0: going up; 1: going down
    jp      .paletteAnimationLoop

.endAnimation:
    xor     a
    ld      (Title_Counter), a

    call    EnableSprites

    jp      InitloopRoundPalette



; .testLoop:
;     jp .testLoop

;     ret

.frameSkip:
    ld      hl, FramesSkipped
    inc     (hl)
    ret

; -------------------- animation looping round palette

InitLoopRoundPalette:

    ld      a, (Title_Counter)
    inc     a
    ld      (Title_Counter), a

    cp      10
    jp      z, .setColor_0_White

    cp      20
    jp      z, .setColor_0_Black

    jp      .continue

.setColor_0_Black:
    xor     a
    ld      bc, 0x0000
    call    SetPaletteColor

    ; reset counter
    xor     a
    ld      (Title_Counter), a

    call    BorderWhiteAndLeftAdjustFor5Frames

    jp      .continue

.setColor_0_White:
    xor     a
    ld      bc, 0x7707
    call    SetPaletteColor

    call    BorderWhiteAndLeftAdjustFor5Frames

    ;jp      .continue

.continue:
    ld	    hl, Title_PaletteData_1

.init:
    call    Wait_Vblank

    ld	    ixl, 1			; first color index

    push    hl

.loop:
    
    ld	    b, (hl)
    inc	    hl
    ld	    c, (hl)
    inc	    hl
    ld	    a, ixl

    cp	    14 + 1          ; last color index + 1
    jp	    z, .next

    inc	    ixl
    push	    hl
        call	SetPaletteColor
    pop	    hl

    ld	    de, Title_PaletteData_End_1
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp	    nz, .loop

    ld	    hl, Title_PaletteData_1
    jp	    .loop

.next:
    ; call    BIOS_BEEP

    pop     hl

    inc     hl
    inc     hl

    ld	    de, Title_PaletteData_End_1
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp	    nz, .init
    jp      InitLoopRoundPalette

BorderWhiteAndLeftAdjustFor5Frames:
    ; set border white
    ld      a, 15
    ld      bc, 0x7707
    call    SetPaletteColor

    ; Screen adjust to the left
    ld      b, 7             ; (7-1: left; 15-8: right; 0: center)
    ld      c, 18            ; register #
    call    BIOS_WRTVDP

    ; wait 5 frames
    ld      b, 5
    call    Wait_B_Vblanks
    
    ; set border back to black
    ld      a, 15
    ld      bc, 0x0000
    call    SetPaletteColor

    ; Screen adjust to center
    ld      b, 0             ; (7-1: left; 15-8: right; 0: center)
    ld      c, 18            ; register #
    call    BIOS_WRTVDP

    ret
