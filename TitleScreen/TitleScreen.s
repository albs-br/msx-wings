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
    ld      (TitleScreen_Counter), a
    ld      (TitleScreen_SpaceBarPressed), a

    ld      hl, 0x0000
    ld      (Color_0_A), hl
    ld      hl, 0x7707
    ld      (Color_0_B), hl

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


    ld      a, (TitleScreen_Counter)
    inc     a
    ld      (TitleScreen_Counter), a
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
    ld      (TitleScreen_Counter), a

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
    ld      a, (TitleScreen_Counter)
    inc     a
    ld      (TitleScreen_Counter), a
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
    ld      (TitleScreen_Counter), a

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

LINE_INTERRUPT_NUMBER: equ 96


InitLoopRoundPalette:

    ; Init line interrupt variables
    xor  	a
    ld  	(Flag_LineInterrupt), a
    ld  	(Counter_LineInterrupt), a

    call    BIOS_DISSCR

    ; ------------------------ setup line interrupt -----------------------------

    di

    
    ; override HKEYI hook
    ld 		a, 0xc3    ; 0xc3 is the opcode for "jp", so this sets "jp LineInterruptHook" as the interrupt code
    ld 		(HKEYI), a
    ld 		hl, LineInterruptHook
    ld 		(HKEYI + 1), hl

    
    ; enable line interrupts
    ld  	a, (REG0SAV)
    or  	16
    ld  	b, a		; data to write
    ld  	c, 0		; register number
    call  	WRTVDP_without_DI_EI		; Write B value to C register



    ; set the interrupt to happen on line n
    ld  	b, LINE_INTERRUPT_NUMBER - 1 - 3		; data to write
    ld  	c, 19		; register number
    call  	WRTVDP_without_DI_EI		; Write B value to C register


    ei

    ; --------------------------------------------------------------------------

    call    BIOS_ENASCR

.loopRoundPalette:

    call    ReadSpaceBar

    ld      a, (TitleScreen_SpaceBarPressed)
    or      a
    ret     nz

    ld      a, (TitleScreen_Counter)
    inc     a
    ld      (TitleScreen_Counter), a

    cp      10
    jp      z, .setColor_0_White

    cp      20
    jp      z, .setColor_0_Black

    jp      .continue

.setColor_0_Black:
    xor     a
    ld      bc, 0x0000
    ld      (Color_0_A), bc
    call    SetPaletteColor

    ld      hl, 0x7707
    ld      (Color_0_B), hl

    ; reset counter
    xor     a
    ld      (TitleScreen_Counter), a

    call    BorderWhiteAndLeftAdjustFor5Frames

    jp      .continue

.setColor_0_White:
    xor     a
    ld      bc, 0x7707
    ld      (Color_0_A), bc
    call    SetPaletteColor

    ld      hl, 0x0000
    ld      (Color_0_B), hl

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
    jp      .loopRoundPalette

BorderWhiteAndLeftAdjustFor5Frames:

    ; ; disable line interrupt routine
    ; ld      a, 1
    ; ld  	(Flag_LineInterrupt), a

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
.loop:
        ld      a, (BIOS_JIFFY)
        ld      c, a
    .waitVBlank:
        ld      a, (BIOS_JIFFY)
        cp      c
        jp      z, .waitVBlank

    call    ReadSpaceBar

    djnz    .loop
    
    ; set border back to black
    ld      a, 15
    ld      bc, 0x0000
    call    SetPaletteColor

    ; Screen adjust to center
    ld      b, 0             ; (7-1: left; 15-8: right; 0: center)
    ld      c, 18            ; register #
    call    BIOS_WRTVDP

    ; ; re-enable line interrupt routine
    ; xor     a
    ; ld  	(Flag_LineInterrupt), a

    ret

ReadSpaceBar:
    ; read space bar
    ld      a, 8                    ; 8th line
    call    SNSMAT_NO_DI_EI         ; Read Data Of Specified Line From Keyboard Matrix
    bit     0, a                    ; 0th bit (space bar)
   
    ret     nz

    ld      a, 1
    ld      (TitleScreen_SpaceBarPressed), a
    ret

;-------------------
LineInterruptHook:

; Tricks BIOS' KEYINT to skip keyboard scan, TRGFLG, OLDKEY/NEWKEY, ON STRIG...
	xor	a
	ld	[BIOS_SCNCNT], a
	ld	[BIOS_INTCNT], a

            ; Interrupt routine (adapted from https://www.msx.org/forum/development/msx-development/how-line-interrupts-basic#comment-431760)
            ; Make sure that the example interrupt handler does not end up
            ; to infinite loop in case of nested interrupts
            ; if (Flag_LineInterrupt == 0) { 
            ;     Flag_LineInterrupt = 1; 
            ;     execute();
            ;     Flag_LineInterrupt = 0;
            ;     Counter_LineInterrupt = 0;
            ; }
            ; else {
            ;     Counter_LineInterrupt++;
            ;     if (Counter_LineInterrupt == 100) {
            ;         Flag_LineInterrupt = 0;
            ;         Counter_LineInterrupt = 0;
            ;     }
            ; }
            ld  	a, (Flag_LineInterrupt)
            or  	a
            jp  	nz, .else
; .then:
            inc     a ; ld a, 1 ; as A is always 0 here, inc a is the same as ld a, 1
            ld  	(Flag_LineInterrupt), a
            call  	.execute

            ; xor  	a
            ; ld  	(Flag_LineInterrupt), a
            ; ld  	(Counter_LineInterrupt), a
            ld      hl, 0
            ld      (Flag_LineInterrupt), hl ; as these two vars are on sequential addresses, this clear both

            ret     ;jp      .return
.else:
            ; Counter++
            ld  	hl, Counter_LineInterrupt
            inc		(hl)
            
			; if (Counter == 100) { Counter = 0; Flag = 0 }
            ld  	a, (hl)
            cp  	100
            ret  	nz
            ; jp      nz, .return

			; xor  	a
            ; ld  	(Counter_LineInterrupt), a
            ; ld  	(Flag_LineInterrupt), a
            ld      hl, 0
            ld      (Flag_LineInterrupt), hl ; as these two vars are on sequential addresses, this clear both

            ret     ;jp      .return

.execute:
    ; if (VDP(-1) and 1) == 1) ; check if is this a line interrupt
    ld  	b, 1
    call 	ReadStatusReg
    
    ld  	a, 0000 0001 b
    and  	b
    
    ; Code to run on Vblank:
    jp      z, VBlankRoutine

    ; Code to run on line interrupt:
    jp   	LineInterruptRoutine

; ------------

VBlankRoutine:
    ; set color 0 black
    ld      a, 0
    ;ld      bc, 0x0000
    ld      bc, (Color_0_A)
    call    SetPaletteColor_Without_DI_EI


    ret

LineInterruptRoutine:
    ; set color 0 white
    ld      a, 0
    ;ld      bc, 0x7707
    ld      bc, (Color_0_B)
    call    SetPaletteColor_Without_DI_EI
    ret