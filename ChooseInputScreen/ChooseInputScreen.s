ChooseInputScreen:

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


    call    BIOS_DISSCR

    call    ClearVram_MSX2

    call    SetSprites16x16

    call    Set192Lines

    call    SetColor0ToTransparent

    ; disable sprites to improve VDP commands speed
    ; call    DisableSprites


    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0
    ld	    (Seg_P8000_SW), a


    ld      hl, PlaneRotating_Palette
    call    LoadPalette

    ; init some vars / sprite colors
    ld      a, JOYSTICK
    ld      (Player_Tnput), a

    ld      d, 0x0f ; color of joystick sprites
    ld      e, 0x02 ; color of keyboard sprites
    call    .update_SPRCOL



    ; ------------------------------------------------------------------------

    ; --- load sprite chars

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; load "JOYSTICK" and "KEYBOARD" 8x16 char patterns to SPRATR
    ld      hl, STRING_JOYSTICK_AND_KEYBOARD
    push    hl
        ld      a, 0000 0000 b
        ld      hl, SC5_SPRPAT
        call    SetVdp_Write
    pop     hl
.loop_LoadSPRPAT:
    ld      a, (hl) ; get char from string
    or      a       ; check for end of string (value 0)
    jp      z, .end_LoadSPRPAT
    push    hl
        call    Get_MediumFont_PatternAddr
        ld      b, 16 ; load only half of 16x16 sprite (left or right 8x16 half)
        ld      c, PORT_0
        otir
    pop     hl
    inc     hl
    jp      .loop_LoadSPRPAT
.end_LoadSPRPAT:

;     ; set SPRCOL (32 sprites x 16 lines = 512 bytes)
;     ld      a, 0000 0000 b
;     ld      hl, SC5_SPRCOL
;     call    SetVdp_Write
;     ld      c, PORT_0
;     ld      b, 0 ; 0=256
;     ld      a, 0x0f ; color
; .loop_1: ; iterate 256 times
;         out     (c), a
;     djnz    .loop_1
; .loop_2: ; iterate 256 times
;         out     (c), a
;     djnz    .loop_2

    ; show sprites
    ld      a, 0000 0000 b
    ld      hl, SC5_SPRATR
    call    SetVdp_Write
    ld      b, CHOOSE_INPUT_SPRATR.size
    ld      c, PORT_0
    ld      hl, CHOOSE_INPUT_SPRATR
    otir
    ; ------------------------------------------------------------------------


    ; ---- draw "choose input" string with 16x16 chars
    ; starting line 85

    ;ld      hl, LargeFont_Patterns + LARGE_FONT_CHAR_H
    ld      ix, ChooseInputString_Char_Addresses
    ld      de, SC5_NAMTBL_PAGE_0 + (128 * 85) + (((256-(12*16))/2)/2) ; line 85, column ?

    ld      b, 12 ; size of string
.loop_ChooseInputString:
    push    bc
        
        ; HL = (IX)
        ld      l, (ix)
        ld      h, (ix + 1)
        
        push    ix

            call    .drawHalfChar


            ; DE += 4 (8 pixels on SC5)
            push    hl
                ex      de, hl ; HL = DE
                    ld      bc, 4
                    add     hl, bc
                ex      de, hl ; DE = HL
            pop     hl
            
            ; HL += 16 (second half, 8x16 of the sprite)
            ld      bc, 16
            add     hl, bc

            push    de
                call    .drawHalfChar
            pop     de

            ; DE += 4 (8 pixels on SC5)
            ex      de, hl ; HL = DE
                ld      bc, 4
                add     hl, bc
            ex      de, hl ; DE = HL

        pop     ix

        ; next char address
        inc     ix
        inc     ix

    pop     bc
    djnz    .loop_ChooseInputString

    ; ------------------------------------------------------------------------

    call    BIOS_ENASCR


    ; clear UncompressedData RAM area
    ld      hl, UncompressedData            ; source
    xor     a
    ld      (hl), a                         ; clear first byte
    ld      de, UncompressedData + 1        ; destiny
    ld      bc, UncompressedData.size - 1   ; size
    ldir                                    ; Copy BC bytes from HL to DE

; ---- plane animation

    xor     a
    ld      (CurrentVRAMpage), a

.init:

    ld      a, -1 ; must be started at -1 (because of the double buffering, the frame current shown is actually the previous processed)
    ld      (CurrentFrameNumber), a


    ; ; ---- debug

    ; ld      a, 0000 0000 b                      ; highest bit of VRAM addr (bit 16)
    ; ld      hl, 0x0000 + 64
    ; call    SetVdp_Write
    ; ld      b, 16
    ; ld      c, PORT_0
    ; ld      hl, TEST_PIXELS
    ; otir

    ; ld      a, 0000 0000 b                      ; highest bit of VRAM addr (bit 16)
    ; ld      hl, 0x8000 + 64
    ; call    SetVdp_Write
    ; ld      b, 16
    ; ld      c, PORT_0
    ; ld      hl, TEST_PIXELS
    ; otir
    ; ; ---- debug


    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0
    ld	    (Seg_P8000_SW), a

    ld      hl, PlaneRotating_Data
    ld      (PlaneRotating_Data_CurrentFrame_Addr), hl

    ; --------------------------------------

.loop:




    call    Wait_Vblank


    
    ld      a, 0                    ; read spacebar
    call    BIOS_GTTRIG
    ret     nz

    ld      a, 1                    ; read button A of joystick 1
    call    BIOS_GTTRIG
    ret     nz

    ld      a, 3                    ; read button B of joystick 1
    call    BIOS_GTTRIG
    ret     nz

    ; --- read keyboard
    ld      a, 8                    ; 8th line
    call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix
    ld      e, a                    ; save value

    bit     4, e                    ; 4th bit (key left)
    jp      z, .keyLeft

    ; ld      a, e
    bit     7, e                    ; 7th bit (key right)
    jp      z, .keyRight

    ; --- read joystick
    ld      a, 1                    ; read direction of joystick 1
    call    BIOS_GTSTCK
    
    cp      7                       ; joystick left
    jp      z, .keyLeft

    cp      3                       ; joystick right
    jp      z, .keyRight

.readInput_cont:


    ld      a, (CurrentVRAMpage)
    or      a
    jp      nz, .showPage_1

.showPage_0:

    ; set color 15 to light red
    ld      a, 15
    ld      bc, 0x6202
    call    SetPaletteColor ; A: Color number;   B: high nibble: red 0-7; low nibble: blue 0-7;   C: high nibble: 0000; low nibble:  green 0-7

    ; --- set current NAMTBL to page 0 (0x00000)
    ; bits:    16 15        7
    ;           | |         |
    ; 0x00000 = 0 0000 0000 0000 0000
    ; R#2 : 0 a16 a15 1 1 1 1 1
    ld      b, 0001 1111 b  ; data
    ld      c, 2            ; register #
    call    BIOS_WRTVDP

    ; clear page 1 top area
    ; VDP fill command to clear top screen area (no need to wait it ends)
    ld      hl, ClearTopScreenArea_Page_1_HMMV_Parameters
    call    Execute_VDP_HMMV        ; High speed move VDP to VRAM (fills an area with one single color)

    call    .unpackFrame

    ; put Uncompressed image on page 1 NAMTBL (inactive page)
    ld      de, SC5_NAMTBL_PAGE_1
    call    ChooseInputScreen_DrawImage

    ld      a, 1
    ld      (CurrentVRAMpage), a

    jp      .continue


.showPage_1:
    
    ; set color 15 to dark red
    ld      a, 15
    ld      bc, 0x4101
    call    SetPaletteColor ; A: Color number;   B: high nibble: red 0-7; low nibble: blue 0-7;   C: high nibble: 0000; low nibble:  green 0-7

    ; --- set current NAMTBL to page 1 (0x08000)
    ; bits:    16 15        7
    ;           | |         |
    ; 0x08000 = 0 1000 0000 0000 0000
    ; R#2 : 0 a16 a15 1 1 1 1 1
    ld      b, 0011 1111 b  ; data
    ld      c, 2            ; register #
    call    BIOS_WRTVDP

    ; clear page 0 top area
    ; VDP fill command to clear top screen area (no need to wait it ends)
    ld      hl, ClearTopScreenArea_Page_0_HMMV_Parameters
    call    Execute_VDP_HMMV        ; High speed move VDP to VRAM (fills an area with one single color)

    call    .unpackFrame

    ; put Uncompressed image on page 0 NAMTBL (inactive page)
    ld      de, SC5_NAMTBL_PAGE_0
    call    ChooseInputScreen_DrawImage

    ld      a, 0
    ld      (CurrentVRAMpage), a

    ; jp      .continue

.continue:

    ld      hl, CurrentFrameNumber
    inc     (hl)

    ; go to next PlaneRotating_Data
    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      bc, PLANE_ROTATING_DATA_STRUCT_SIZE
    add     hl, bc
    ld      (PlaneRotating_Data_CurrentFrame_Addr), hl

    ; if (PlaneRotating_Data_CurrentFrame_Addr >= PlaneRotating_Data.end) { jp .init; }
    ; ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      de, PlaneRotating_Data.end
    call    BIOS_DCOMPR                 ; Compares HL with DE. Zero flag set if HL and DE are equal. Carry flag set if HL is less than DE.
    jp      nc, .init



    jp      .loop

    ; -------------------

.keyLeft:
    ld      a, JOYSTICK
    ld      (Player_Tnput), a

    ld      d, 0x0f ; color of joystick sprites
    ld      e, 0x02 ; color of keyboard sprites
    call    .update_SPRCOL

    jp      .readInput_cont

.keyRight:
    ld      a, KEYBOARD
    ld      (Player_Tnput), a

    ld      d, 0x02 ; color of joystick sprites
    ld      e, 0x0f ; color of keyboard sprites
    call    .update_SPRCOL

    jp      .readInput_cont



.update_SPRCOL:

    ; update joystick SPRCOL (16 sprites x 16 lines = 256 bytes)
    ld      a, 0000 0000 b
    ld      hl, SC5_SPRCOL
    call    SetVdp_Write
    ld      c, PORT_0
    ld      b, 0 ; 0=256
    ; ld      a, 0x0f ; color
.loop_10: ; iterate 256 times
        nop
        out     (c), d
    djnz    .loop_10

    ; update keyboard SPRCOL (16 sprites x 16 lines = 256 bytes)
    ld      b, 0 ; 0=256
    ; ld      a, 0x02 ; color
.loop_20: ; iterate 256 times
        nop
        out     (c), e
    djnz    .loop_20

    ret



; .setInitFlag:
;     ld      (InitFlag)

.unpackFrame:

    ; unpack next frame using zx0 standard decompressor
    ; ld      hl, PlaneRotating_Images.frame_0
    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)
    ld      b, (hl) ; get MegaRom page

    inc     hl
    ld      a, (hl) ; get address low byte
    ld      e, a
    inc     hl
    ld      a, (hl) ; get address high byte
    ld      d, a
    ex      de, hl  
    ld      de, UncompressedData

    ; set MegaROM page for current frame data
    ld      a, b
    ld	    (Seg_P8000_SW), a

    call    dzx0_standard

    ret


.drawHalfChar:
    push    hl, de
        push    de
            ld      ix, ChooseInputScreen_LargeFont_Colors
            ld      de, UncompressedData
            ld      b, 16
            call    ConvertMsx2SpritesToSc5

            ld      de, UncompressedData
        pop     hl ; from DE to HL
        ; ld      hl, SC5_NAMTBL_PAGE_0 + (128 * 85) + (((256-(12*16))/2)/2) ; line 85, column ?
        push    hl
            ; DE: source on RAM
            ; HL: destiny on VRAM
            call    Copy16x16ImageFromRAMToVRAM_SC5
        pop     hl

        ; HL += 32768 (go to page 1)
        ld      de, 32768
        add     hl, de

        ld      de, UncompressedData
        call    Copy16x16ImageFromRAMToVRAM_SC5
    pop     de, hl
    ret



; Inputs:
;   DE: VRAM destiny addr (lowest 16 bits)
ChooseInputScreen_DrawImage:

    ; set MegaROM page for Choose Input Screen data
    ld      a, CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0
    ld	    (Seg_P8000_SW), a

    ld      hl, (PlaneRotating_Data_CurrentFrame_Addr)

    inc     hl          ; skip packed frame data MegaROM page 

    inc     hl
    inc     hl          ; skip packed frame data address 

    ld      a, (hl)
    ld      ixh, a      ;   IXH: image width in bytes
    inc     hl
    ld      b, (hl)     ;   B: image height in pixels

    inc     hl
    ld      a, (hl)
    ld      iyl, a      ;   IYl: delta x to centralize image (low byte)
    inc     hl
    ld      a, (hl)
    ld      iyh, a      ;   IYh: delta x to centralize image (high byte)

    ; adjust image vertically
    ; DE += "lines at top of screen before image"
    push    bc
        inc     hl
        ld      c, (hl)
        inc     hl
        ld      b, (hl)     ; BC = lines at top of screen before image (word)
        ex      de, hl
            add     hl, bc
        ex      de, hl
    pop     bc

    ; put image horizontally centralized
    ; DE += ((128/2) - IXh/2)
    push    bc
        ld      a, 64
        ld      c, ixh
        srl     c                 ; shift right C
        sub     c
        ld      c, a
        ld      b, 0
        ex      de, hl
            add     hl, bc
        ex      de, hl
    pop     bc

    ;DE += IY
    push    bc
        push    iy
        pop     bc
        ex      de, hl
            add     hl, bc
        ex      de, hl
    pop     bc

    ld		hl, UncompressedData   				    ; RAM address (source)
    ; ld		de, SC5_NAMTBL_PAGE_0                   ; VRAM address (destiny)
    ; ld      b, 71 ; height
.loop:
    push    bc
        push    de
            ; write to VRAM bitmap area
            ld      a, 0000 0000 b                      ; highest bit of VRAM addr (bit 16)
            ex      de, hl
                call    SetVdp_Write
            ex      de, hl
            ; ld      b, 52                       ; width in bytes
            ld      b, ixh                       ; width in bytes
            ld      c, PORT_0
            otir
        pop     de
        
        ; DE += 128
        push    hl
            ex      de, hl
                ld      bc, 128         ; next sc5 line
                add     hl, bc
            ex      de, hl
        pop     hl

    pop     bc

    djnz    .loop
    ret

; ; ---- debug
; TEST_PIXELS: 
;     db 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0, 0xf0
;     db 0xe0, 0xe0, 0xe0, 0xe0, 0xe0, 0xe0, 0xe0, 0xe0

CHOOSE_INPUT_SPRATR:
    ; joystick

    db 160-48,  40-8,        0 * 4, 0
    db 160-48,  40-8+16,     1 * 4, 0
    db 160-48,  40-8+32,     2 * 4, 0
    db 160-48,  40-8+48,     3 * 4, 0

    db 160-32,  40-8,        0 * 4, 0
    db 160-32,  40-8+16,     1 * 4, 0
    db 160-32,  40-8+32,     2 * 4, 0
    db 160-32,  40-8+48,     3 * 4, 0

    db 160-16,  40-8,        0 * 4, 0
    db 160-16,  40-8+16,     1 * 4, 0
    db 160-16,  40-8+32,     2 * 4, 0
    db 160-16,  40-8+48,     3 * 4, 0
    ; joystick string
    db 160,  40-8,        0 * 4, 0
    db 160,  40-8+16,     1 * 4, 0
    db 160,  40-8+32,     2 * 4, 0
    db 160,  40-8+48,     3 * 4, 0


    ; keyboard 
    db 160-48, 152+8,        4 * 4, 0
    db 160-48, 152+8+16,     5 * 4, 0
    db 160-48, 152+8+32,     6 * 4, 0
    db 160-48, 152+8+48,     7 * 4, 0

    db 160-32, 152+8,        4 * 4, 0
    db 160-32, 152+8+16,     5 * 4, 0
    db 160-32, 152+8+32,     6 * 4, 0
    db 160-32, 152+8+48,     7 * 4, 0

    db 160-16, 152+8,        4 * 4, 0
    db 160-16, 152+8+16,     5 * 4, 0
    db 160-16, 152+8+32,     6 * 4, 0
    db 160-16, 152+8+48,     7 * 4, 0
    ; keyboard string
    db 160, 152+8,        4 * 4, 0
    db 160, 152+8+16,     5 * 4, 0
    db 160, 152+8+32,     6 * 4, 0
    db 160, 152+8+48,     7 * 4, 0
.size: equ $ - CHOOSE_INPUT_SPRATR

STRING_JOYSTICK_AND_KEYBOARD:    db 'JOYSTICKKEYBOARD', 0

ChooseInputString_Char_Addresses:
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_C
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_H
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_O
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_O
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_S
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_E
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_Z
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_I
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_N
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_P
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_U
    dw  LargeFont_Patterns + LARGE_FONT_CHAR_T

ChooseInputScreen_LargeFont_Colors:
; ------ color 0
	db	0x05
	db	0x05
	db	0x0e
	db	0x0e
	db	0x09
	db	0x09
	db	0x0d
	db	0x0d
	db	0x04
	db	0x04
	db	0x0c
	db	0x0c
	db	0x08
	db	0x08
	db	0x0d
	db	0x0d
; ------ color 1
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03
	db	0x03

