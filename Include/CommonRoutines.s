; Common routines for MSX 2 (some work on MSX 1)
; v.0.1.0 (when changed remember to update file on other projects)

; Fill all RAM with 0x00
ClearRam:
    ld      hl, RamStart        ; RAM start address
    ld      de, RamEnd + 1      ; RAM end address

.loop:
    xor     a                   ; same as ld a, 0, but faster
    ld      (hl), a

    inc     hl
    call    BIOS_DCOMPR         ; Compare Contents Of HL & DE, Set Z-Flag IF (HL == DE), Set CY-Flag IF (HL < DE)
    ret     z
    jp      .loop



; Input:
;   A: Color number
;   B: high nibble: red 0-7; low nibble: blue 0-7
;   C: high nibble: 0000; low nibble:  green 0-7
SetPaletteColor:
    push    bc
        ; set palette register number in register R#16 (Color palette address pointer)
        ld      b, a        ; data
        ld      c, 16       ; register #
        call    BIOS_WRTVDP
        ld      c, 0x9a          ; v9938 port #2
    pop     de

    ld      a, d                 ; data 1 (red 0-7; blue 0-7)
    di
    out     (c), a
    ld      a, e                 ; data 2 (0000; green 0-7)
    ei
    out     (c), a

    ret



; Load palette data pointed by HL
LoadPalette:
    ; set palette register number in register R#16 (Color palette address pointer)
    ld      b, 0    ; data
    ld      c, 16   ; register #
    call    BIOS_WRTVDP
    ld      c, PORT_2 ; V9938 port #2

    ld      b, 16
.loop:
    di
        ld    a, (hl)
        out   (c), a
        inc   hl
        ld    a, (hl)
        out   (c), a
    ei
    inc     hl
    djnz    .loop
    
    ret



; Typical routine to select the ROM on page 8000h-BFFFh from page 4000h-7FFFh
EnableRomPage2:
; source: https://www.msx.org/wiki/Develop_a_program_in_cartridge_ROM#Typical_examples_to_make_a_32kB_ROM

	call	BIOS_RSLREG
	rrca
	rrca
	and	    3	;Keep bits corresponding to the page 4000h-7FFFh
	ld	    c,a
	ld	    b,0
	ld	    hl, BIOS_EXPTBL
	add	    hl,bc
	ld	    a,(hl)
	and	    80h
	or	    c
	ld	    c,a
	inc	    hl
	inc	    hl
	inc	    hl
	inc	    hl
	ld	    a,(hl)
	and	    0Ch
	or	    c
	ld	    h,080h
	call	BIOS_ENASLT		; Select the ROM on page 8000h-BFFFh

    ret


; Input:
;   B: number of VBlanks to wait
; Destroys:
;   A
Wait_B_Vblanks:
	
    push    bc
    
    .loop:

        ld      a, (BIOS_JIFFY)
        ld      c, a
    .waitVBlank:
        ld      a, (BIOS_JIFFY)
        cp      c
        jp      z, .waitVBlank

        djnz    .loop
    
    pop     bc

	ret

Wait:
	ld		c, 15

	.loop:
		ld      a, (BIOS_JIFFY)
		ld      b, a
	.waitVBlank:
		ld      a, (BIOS_JIFFY)
		cp      b
		jp      z, .waitVBlank

	dec		c
	jp		nz, .loop

;
; Set VDP address counter to write from address AHL (17-bit)
; Enables the interrupts
;
SetVdp_Write:
    rlc     h
    rla
    rlc     h
    rla
    srl     h
    srl     h
    di
    out     (PORT_1), a
    ld      a, 14 + 128
    out     (PORT_1), a
    ld      a, l
    nop
    out     (PORT_1), a
    ld      a, h
    or      64
    ei
    out     (PORT_1), a
    ret

;
; Set VDP address counter to read from address AHL (17-bit)
; Enables the interrupts
;
SetVdp_Read:
    rlc h
    rla
    rlc h
    rla
    srl h
    srl h
    di
    out (PORT_1),a
    ld a,14 + 128
    out (PORT_1),a
    ld a,l
    nop
    out (PORT_1),a
    ld a,h
    ei
    out (PORT_1),a
    ret


; TODO:
; ClearVram_MSX2:
;     ; clear VRAM
;     ; set address counter (bits 16 to 14)
;     ld      b, 0000 0000 b  ; data
;     ld      c, 6            ; register #
;     call    BIOS_WRTVDP

;     ; set address counter (bits 7 to 0)
;     ld      c, PORT_1
;     ld      a, 0000 0000 b
;     di
;     out     (c), a
;     ; set address counter (bits 13 to 8) and operation mode
;     ;           0: read, 1: write
;     ;           |
;     ld      a, 0100 0000 b
;     ei
;     out     (c), a
;     ; write to VRAM
;     xor     a
;     ld      b, 0 ;256 iterations
;     ld      c, PORT_0
; .loop:
;     di
;         out (c), a
;     ei
;     dec     b
;     jp      nz, .loop
	
; 	ret

; ClearVram_MSX2:

; 	ld		d, 7

; .loop:

;     ; set 3 upper bits of VRAM addr (bits 16 to 14)
;     ld      b, 1; d  			; data
;     ld      c, 14           ; register #
;     call    BIOS_WRTVDP

; 	; Set register #14
; 	; DI
; 	; LD    A, 1;d   ; Base adress #4000
; 	; OUT   (PORT_1), A
; 	; LD    A, 14 + 128 ; Write regster #14 (BIT 7 is set for writing)
; 	; OUT   (PORT_1), A
; 	; EI

; 	xor		a
; 	ld		hl, 0
; 	ld		bc, 16384 * 2
; 	call	BIOS_BIGFIL
; 	; dec		d
; 	; jp		nz, .loop


; 	ret


ClearVram_MSX2:
    xor     a           ; set vram write base address
    ld      hl, 0     	; to 1st byte of page 0
    call    SetVDP_Write

;     xor a
; FillL1:
;     ld c, 64          ; fill 1st 8 lines of page 1
; FillL2:
;     ld b, 0        ;
;     out (PORT_0),a     ; could also have been done with
;     djnz FillL2     ; a vdp command (probably faster)
;     dec c           ; (and could also use a fast loop)
;     jp nz,FillL1

	xor		a

    ; TODO: use VDP command

    ; clear all 128kb of VRAM
	ld		d, 2		; 2 repetitions
.loop_2:
	ld		c, 0		; 256 repetitions
.loop_1:
	ld		b, 0		; 256 repetitions
.loop:
	out		(PORT_0), a
	djnz	.loop
	dec		c
	jp		nz, .loop_1
	dec		d
	jp		nz, .loop_2

	ret


Screen11:
    ; change to screen 11
    ; it's needed to set screen 8 and change the YJK and YAE bits of R#25 manually
    ld      a, 8
    call    BIOS_CHGMOD
    ld      b, 0001 1000 b  ; data
    ld      c, 25            ; register #
    call    BIOS_WRTVDP
	ret

SetSprites16x16:
    ld      a, (REG1SAV)
    or      0000 0010 b
    ld      b, a
    ld      c, 1            ; register #
    call    BIOS_WRTVDP
	ret

Set192Lines:
    ; set 192 lines
    ; ld      b, 0000 0000 b  ; data
    ; ld      c, 9            ; register #
    ; call    BIOS_WRTVDP
    ld      a, (REG9SAV)
    and     0111 1111 b
    ld      b, a
    ld      c, 9            ; register #
    call    BIOS_WRTVDP
	ret

SetColor0ToTransparent:
    ; set color 0 to transparent
    ; ld      b, 0000 1000 b  ; data
    ; ld      c, 8            ; register #
    ; call    BIOS_WRTVDP
    ld      a, (REG8SAV)
    and     1101 1111 b
    ld      b, a
    ld      c, 8            ; register #
    call    BIOS_WRTVDP
	ret

; Inputs:
; 	HL: source addr in RAM
; 	ADE: 17 bits destiny addr in VRAM
; 	C: number of bytes x 256 (e.g. C=64, total = 64 * 256 = 16384)
LDIRVM_MSX2:
    ;ld      a, 0000 0000 b
    ex		de, hl
	;ld      hl, NAMTBL + (0 * (256 * 64))
    call    SetVdp_Write
    ex		de, hl
    ld      d, c
    ;ld      hl, ImageData_1
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      b, 0
.loop_1:
    otir
    dec     d
    jp      nz, .loop_1
	ret



;Random number generator:
; In: nothing
; Out: A with a random number
; Destroys: nothing
;Author: Ricardo Bittencourt aka RicBit (BrMSX, Tetrinet and several other projects)
; choose a random number in the set [0,255] with uniform distribution
RandomNumber:
    push    hl
        ld      hl, (Seed)
        add     hl, hl
        sbc     a, a
        and     0x83
        xor     l
        ld      l, a
        ld      (Seed), hl
    pop     hl
    ret

    ; The random number generated will be any number from 0 to FFh.
    ; Despite be a random number generator routine, your results will pass in several statistical tests.
    ; Before the first call, the SEED value must be initiated with a value different of 0.
    ; For a deterministic behavior (the sequence of values will be the same if the program was initiated), use a fixed SEED value.
    ; For a somewhat more random sequence, use:
    ; LD A,(JIFFY);MSX BIOS time variable
    ; OR 80H ;A value different of zero is granted
    ; LD A,(SEED)

    ; The values obtained from this method is much more *random* that what you get from LD A,R.



;  Calculates whether a collision occurs between two 16x16 objects
; IN: 
;    B = x1; C = y1
;    D = x2; E = y2
; OUT: Carry set if collision
; CHANGES: AF
CheckCollision_16x16_16x16:

        ld      a, d                        ; get x2
        sub     b                           ; calculate x2 - x1
        jr      c, .x1IsLarger              ; jump if x2 < x1
        sub     16                          ; compare with size 1
        ret     nc                          ; return if no collision
        jp      .checkVerticalCollision
.x1IsLarger:
        neg                                 ; use negative value (Z80)
        ; emulate neg instruction (Gameboy)
        ; ld      b, a
        ; xor     a                           ; same as ld a, 0
        ; sub     a, b
    
        sub     16                          ; compare with size 2
        ret     nc                          ; return if no collision

.checkVerticalCollision:
        ld      a, e                        ; get y2
        sub     c                           ; calculate y2 - y1
        jr      c, .y1IsLarger              ; jump if y2 < y1
        sub     16                          ; compare with size 1
        ret                                 ; return collision or no collision
.y1IsLarger:
        neg                                 ; use negative value (Z80)
        ; emulate neg instruction (Gameboy)
        ; ld      c, a
        ; xor     a                           ; same as ld a, 0
        ; sub     a, c
    
        sub     16                          ; compare with size 2
        ret                                 ; return collision or no collision




;  Calculates whether a collision occurs between a 8x8 and a 16x16 object
; IN: 
;    B = x1; C = y1 (8x8 box)
;    D = x2; E = y2 (16x16 box)
; OUT: Carry set if collision
; CHANGES: AF
CheckCollision_8x8_16x16:

        ld      a, d                        ; get x2
        sub     b                           ; calculate x2 - x1
        jr      c, .x1IsLarger              ; jump if x2 < x1
        sub     8                          ; compare with size 1
        ret     nc                          ; return if no collision
        jp      .checkVerticalCollision
.x1IsLarger:
        neg                                 ; use negative value (Z80)
        ; emulate neg instruction (Gameboy)
        ; ld      b, a
        ; xor     a                           ; same as ld a, 0
        ; sub     a, b
    
        sub     16                          ; compare with size 2
        ret     nc                          ; return if no collision

.checkVerticalCollision:
        ld      a, e                        ; get y2
        sub     c                           ; calculate y2 - y1
        jr      c, .y1IsLarger              ; jump if y2 < y1
        sub     8                          ; compare with size 1
        ret                                 ; return collision or no collision
.y1IsLarger:
        neg                                 ; use negative value (Z80)
        ; emulate neg instruction (Gameboy)
        ; ld      c, a
        ; xor     a                           ; same as ld a, 0
        ; sub     a, c
    
        sub     16                          ; compare with size 2
        ret                                 ; return collision or no collision





; TODO: not working (use Dezog unit tests)

;  Calculates whether a collision occurs between a point and a 16x16 object
; IN: 
;    B = x1; C = y1 (point)
;    D = x2; E = y2 (16x16 box)
; OUT: Carry set if collision
; CHANGES: AF
CheckCollision_Point_16x16:

        ; cp b
        ; if (a >= b) NC
        ; if (a < b) C

        ; check X
        ld      a, d
        cp      b
        ret     nc      ; if (B <= D) ret             if (x1 <= x2) ret

        ld      a, b
        add     16      ; x1 = x1 + width2
        cp      d
        ret     nc      ; if (D <= B) ret             if (x2 <= (x1 + width2)) ret

        ; check Y
        ld      a, e
        cp      c
        ret     nc      ; if (C <= E) ret             if (y1 <= y2) ret

        ; if (a < b) C
        ; if (y1 < (y2 + height2)) C

        ld      a, e
        add     16
        ld      e, a
        ld      a, c
        cp      e
        ret

        ; C = 100 ; E = 98
        ; cp      98, 100         carry true
        ; cp      100, 98+16      carry true

        ; C = 120 ; E = 98
        ; cp      98, 120         carry true
        ; cp      120, 98+16      carry false

        ; C = 30 ; E = 32
        ; cp      32, 30         carry false

        ; C = 50 ; E = 32
        ; cp      32, 50         carry true
        ; cp      50, 32+16      carry false



; ; Fade from black screen to palette pointed by HL
; ; PS: early try, it's a bit strange, but I prefer to keep
; ; Official FadeIn routine is below
; FadeIn_Strange:

;     ; save destiny palette
;     ld      (FadeInDestinyPaletteAddr), hl

;     ; reset temp palette
;     ld      de, FadeInTempPalette
;     ld      b, FadeInTempPalette.size
;     xor     a
; .loop_ResetPalette:
;     ld      (de), a
;     inc     de
;     djnz    .loop_ResetPalette


;     ld      b, 7
; .loopPalette:
;     push    bc

;         ld      de, FadeInTempPalette
;         ld      b, 0 + (FadeInTempPalette.size / 2)

;         ; restore destiny palette
;         ld      hl, (FadeInDestinyPaletteAddr)

;         push    hl
;             push    de
;                 push    bc
;                     ex      de, hl
;                     call    LoadPalette
                    
;                     call    BIOS_ENASCR

;                     ld      b, 5
;                     call    Wait_B_Vblanks
;                 pop     bc
;             pop     de
;         pop     hl


;     ; loop through all temp palette incrementing each component (RGB) of each color
;     .loopColors:
;         push    bc

;             ;ld      ixh, b

;             push    hl
;                 push    de
;                     ; read from temp palette
;                     ld      a, (de)
;                     ld      b, a
;                     inc     de
;                     ld      a, (de)
;                     ld      c, a
                    
;                     ; ; set palette
;                     ; push    de
;                     ;     push    bc
;                     ;         ld      a, ixh
;                     ;         call    SetPaletteColor
;                     ;     pop     bc
;                     ; pop     de

;                     ; IYH = Red (0rrr 0000)
;                     ; get RED component
;                     ld      a, b
;                     and     0111 0000b
;                     ld      iyh, a

;                     ; compare with destiny palette
;                     ld      a, (hl)
;                     and     0111 0000b
;                     cp      iyh                       ; if (a >= n) NC      ; if (a < n) C
;                     ;ld      a, 
;                     jp      z, .dontIncrementRed

;                     ; increment RED
;                     ld      a, iyh
;                     ld      b, 0x10
;                     add     a, b
;                     ld      iyh, a

; .dontIncrementRed:


;                     ; IYL = Blue (0000 0bbb)
;                     ; get BLUE component
;                     dec     de
;                     ld      a, (de)
;                     and     0000 0111b
;                     ld      iyl, a

;                     ; compare with destiny palette
;                     ld      a, (hl)
;                     and     0000 0111b
;                     cp      iyl                       ; if (a >= n) NC      ; if (a < n) C
;                     jp      z, .dontIncrementBlue

;                     ; increment BLUE
;                     ;ld      a, iyl
;                     ; ld      b, 0x01
;                     ; add     a, b
;                     inc     iyl
;                     ;ld      iyh, a


; .dontIncrementBlue:

;                     ; save updated RED (IYH) and BLUE (IYL)
;                     ld      a, iyh
;                     or      iyl
;                     ld      (de), a




;                     ; B = Green
;                     ; get GREEN component
;                     inc     de
;                     ld      a, (de)
;                     and     0000 0111b
;                     ld      b, a

;                     ; compare with destiny palette
;                     inc     hl
;                     ld      a, (hl)
;                     and     0000 0111b
;                     cp      b                       ; if (a >= n) NC      ; if (a < n) C
;                     jp      z, .dontIncrementGreen

;                     ; increment GREEN
;                     inc     b

; .dontIncrementGreen:
;                     ; save updated GREEN
;                     ld      a, b
;                     ld      (de), a


;                 pop     de
;             pop     hl
            

;             ; increment pointers by 2
;             inc     hl
;             inc     hl
;             inc     de
;             inc     de



;         pop     bc
;         djnz    .loopColors



;     pop     bc
;     djnz    .loopPalette



;     ret



; CreateFadeInOutPalette:


;     ; reset 8 temp palettes
;     ld      de, FadeInTemp_8_Palettes
;     ld      b, 0 ; FadeInTemp_8_Palettes.size        ; B=0 for 256 iterations
;     xor     a
; .loop_ResetPalettes:
;     ld      (de), a
;     inc     de
;     djnz    .loop_ResetPalettes



;     ; copy game palette to first position in FadeInTemp_8_Palettes
;     ld      hl, GamePalette
;     ld      de, FadeInTemp_8_Palettes
;     ld      bc, 32
;     ldir


;     ld      hl, FadeInTemp_8_Palettes
;     ld      de, FadeInTemp_8_Palettes + 32



;     ld      b, 7
; .loop_Palettes:
;     push    bc


;         ld      b, 32
;     .loop_Colors:

;         ; high nibble
;         ld      c, 0
;         ld      a, (hl)
;         and     0111 0000b
;         or      a
;         jp      z, .skipHighNibble

;         ; decrement and save it to C
;         ld      c, 0x10
;         sub     a, c
;         ld      c, a

;     .skipHighNibble:

;         ; low nibble
;         ld      a, (hl)
;         and     0000 0111b
;         or      a
;         jp      z, .skipLowNibble

;         ; decrement and keep it in A
;         dec     a

;     .skipLowNibble:

;         ; join high and low nibbles and save it to destiny
;         or      c
;         ld      (de), a

;         ; next byte
;         inc     hl
;         inc     de

;         djnz    .loop_Colors

;     pop     bc
;     djnz    .loop_Palettes

;     ret


; FadeIn:
;     ld      hl, FadeInTemp_8_Palettes + (7 * 32)

;     ld      b, 8
; .loop:
;     push    bc
;         push    hl
;             call    LoadPalette
        
;             call    BIOS_ENASCR
;         pop    hl

;         ld      de, 32
;         or      a       ;clear carry flag
;         sbc     hl, de
        
;         ld      b, 5
;         call    Wait_B_Vblanks
;     pop     bc
;     djnz    .loop

;     ret



; FadeOut:
;     ld      hl, FadeInTemp_8_Palettes

;     ld      b, 8
; .loop:
;     push    bc
;         push    hl
;             call    LoadPalette
        
;             call    BIOS_ENASCR
;         pop    hl

;         ld      de, 32
;         add     hl, de
        
;         ld      b, 5
;         call    Wait_B_Vblanks
;     pop     bc
;     djnz    .loop

;     ret



; Fast DoCopy, by Grauw
;   Input:  HL = pointer to 15-byte VDP command data
;   Output: HL = updated
;   Destroys: A, B, C
DoCopy:
    ld      a, 32
    di
    out     (PORT_1), a
    ld      a, 17 + 128
    out     (PORT_1), a
    ld      c, 0x9B
.vdpReady:
    ld      a, 2
    di
    out     (PORT_1), a     ; select s#2
    ld      a, 15 + 128
    out     (PORT_1), a
    in      a, (PORT_1)
    rra
    ld      a, 0          ; back to s#0, enable ints
    out     (PORT_1), a
    ld      a, 15 + 128
    ei
    out     (PORT_1), a     ; loop if vdp not ready (CE)
    jp      c, .vdpReady
    outi            ; 15x OUTI
    outi            ; (faster than OTIR)
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    ret