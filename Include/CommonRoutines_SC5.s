; Convert MSX2 sprites (or-color) to SC 5 format to be plotted on screen
; warning: only 8 pixels wide, so must be called twice for a 16x16 sprite
; Input:
;   HL: pointer to sprite patterns on RAM (32 bytes for pattern 0, 32 bytes for pattern 1)
;   IX: pointer to sprite colors on RAM (16 bytes for color 0, 16 bytes for color 1)
;   DE: destiny addr on RAM
;   B:  font height in pixels
ConvertMsx2SpritesToSc5:

    ;ld      b, 8        ; 8 lines of 8 pixels
    ;ld      b, 16        ; 16 lines of 8 pixels
.outerLoop:
    push    bc
        push    hl
            push    de
                
                ; read patterns & colors
                ld      a, (hl)
                ld      (Pattern_0), a

                ld      bc, 32
                add     hl, bc
                ld      a, (hl)
                ld      (Pattern_1), a

                ld      a, (ix)
                ld      (Color_0), a

                ld      a, (ix + 16)
                ld      (Color_1), a

                ; destiny format:
                ;   4 high bits: color index from palette for left pixel
                ;   4 low bits: color index from palette for right pixel
                ;   0x00: transparent (repeat background)

                ex      de, hl
                ld      b, 4    ; number of bytes on destiny (8 pixels)
            .loop:
                push    bc
                    ; push    hl

                    ; --- read left pixel
                    call    .ReadPixel

                    ; shift left 4 bits to position on left pixel
                    or      a ; clear carry, preserving A
                    rla
                    rla
                    rla
                    rla

                    ld      b, a

                    push    bc
                        ; --- read right pixel
                        call    .ReadPixel
                    pop     bc
                    or      b   ; merge left and right pixels together



                    ; pop     hl
                    
                    ld      (hl), a
                    inc     hl          ; next byte (two pixels on SC5)

                pop     bc
                djnz    .loop

            pop     hl      ; from DE to HL
    
            ; next line on screen
            ; DE += 8
            ;ex      de, hl
            ld      bc, 8     ; 16 pixels per line on 16x16 bitmap (8 bytes on SC5)
            add     hl, bc
            ex      de, hl      ; updated value back to DE

        pop     hl

    pop     bc

    inc     hl      ; next line of sprite patterns

    inc     ix      ; next line of sprite colors

    
    ; dec     b
    ; jp      nz, .outerLoop
    djnz    .outerLoop

    ret


; ----------------- sub routine
.ReadPixel:
    ld      a, (Pattern_0)
    rla
    ld      (Pattern_0), a          ; save
    jp      c, .setBitTrue
    xor     a
    jp      .saveBit_Pattern_0
.setBitTrue:
    ld      a, 1
.saveBit_Pattern_0:
    ld      (Bit_Pattern_0), a

    ; do the same for bit of pattern 1
    ld      a, (Pattern_1)
    rla
    ld      (Pattern_1), a          ; save
    jp      c, .setBit_1_True
    xor     a
    jp      .saveBit_Pattern_1
.setBit_1_True:
    ld      a, 1
.saveBit_Pattern_1:
    ld      (Bit_Pattern_1), a

    ; if (Bit_Pattern_0 == 0 && Bit_Pattern_1 == 0) Output = 0
    ; else if (Bit_Pattern_0 == 1 && Bit_Pattern_1 == 0) Output = Color_0
    ; else if (Bit_Pattern_0 == 0 && Bit_Pattern_1 == 1) Output = Color_1
    ; else Output = Color_0 | Color_1 ; or-color
    ld      a, (Bit_Pattern_0)
    sla     a
    ld      b, a
    ld      a, (Bit_Pattern_1)
    or      b

    ; or      a ; is it necessary?
    jp      z, .setOutput_0
    cp      0000 0010 b
    jp      z, .setOutput_Color_0
    cp      0000 0001 b
    jp      z, .setOutput_Color_1
    ;jp      .setOutput_Or_Color

;.setOutput_Or_Color:
    ld      a, (Color_0)
    ld      b, a
    ld      a, (Color_1)
    or      b
    ret     ;jp      .saveOutput

.setOutput_0:
    xor     a
    ret     ;jp      .saveOutput

.setOutput_Color_0:
    ld      a, (Color_0)
    ret     ;jp      .saveOutput

.setOutput_Color_1:
    ld      a, (Color_1)
    ret

; .saveOutput:
;   ret





; Copy 16x16 bmp (SC5) from RAM to VRAM
; Source format:
;     ; 4 high bits: color index from palette for left pixel
;     ; 4 low bits: color index from palette for right pixel
;     ; 0x00: transparent (repeat background)
; Input:
;   DE: source on RAM
;   HL: destiny on VRAM
Copy16x16ImageFromRAMToVRAM_SC5:
    ld      b, 16 ; number of lines
.loop:
    push    bc
        push    de
            push    hl
                ; read current bg line and save it to a temp array
                xor     a ; ld      a, 0000 0000 b
                call    SetVdp_Read
                ld      c, PORT_0
                ld      hl, CurrentLineBGPixels
                ; 8x INI
                ini ini ini ini ini ini ini ini
            pop     hl
            push    hl
                ; copy source line to current bg line unless bg == 0 (keep bg)
                xor     a ; ld      a, 0000 0000 b
                call    SetVdp_Write
                ld      c, PORT_0
                ;ld      hl, .TestDrawBg
                ex      de, hl          ; HL <= DE (source image on RAM)
                ; ; 16x OUTI
                ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

                ld      de, CurrentLineBGPixels
                ld      b, 8


; HL: sprite
; DE: background

;new version (117/112 cycles), 35 cycles saved, per pixel (9000 cycles total !!!)
            .loop_1:
                ld      a, (hl)         
                or      a               
                jp      nz, .continue_1         ; if (pixel == 0) ignore
            ; .keepBGpixel:
                ld      a, (de)
                jp      .next_1
            .continue_1:
            .next_1:
                out     (PORT_0), a
                inc     hl                  ; TODO: if data is table aligned can be replaced by INC L, saving 2 cycles per pixel
                inc     de                  ; TODO: if data is table aligned can be replaced by INC E, saving 2 cycles per pixel
                djnz    .loop_1

            pop     hl
            ld      bc, 128  ; next line on screen 5
            add     hl, bc
        pop     de
        
        ; DE += 8
        push    hl
            ex      de, hl
            ld      bc, 8
            add     hl, bc
            ex      de, hl
        pop     hl
    pop     bc
    djnz    .loop
    
    ret
