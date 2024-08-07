; Copy 16x16 bmp (SC11) from RAM to VRAM
; Source format:
;     ; 4 high bits: color index from palette
;     ; 4 low bits: 1000 (set pixel to RGB palette instead of YJK)
;     ; 0x00: transparent (repeat background)
; Input:
;   DE: source on RAM
;   HL: destiny on VRAM
Copy16x16ImageFromRAMToVRAM:
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
                ; 16x INI
                ini ini ini ini ini ini ini ini ini ini ini ini ini ini ini ini ; as this is inside a loop (which will run at gameplay - ground target), speed is more critical than space, so using unrolled INIs makes sense
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
                ld      b, 16

; ; old version (152/147 cycles)
;             .loop_1:
;                 ld      a, (hl)         ; TODO: or (hl) is 5 pixels faster per pixel (256 pixels) on blank pixels
;                 or      a               ; on the other hand will need a ld a, (HL) on non-blank pixels
;                 jp      nz, .continue_1          ; if (pixel == 0) ignore
;             ; .keepBGpixel:
;                 ld      a, (de)
;                 jp      .next_1
;             .continue_1:
;                 ; TODO: put this mask on a register (if possible), saving 3 cycles per pixel
;                 and     1111 1000 b             ; mask to keep 5 high bits from source
;                 push    af; TODO: this push/pop can be replaced by putting the value on C register
;                     ld      a, (de)
;                     ; TODO: put this mask on a register (if possible), saving 3 cycles per pixel
;                     and     0000 0111 b         ; mask to keep 3 low bits from bg
;                     ld      ixh, a ; TODO: ld C,A is 5 cycles faster, per pixel
;                 pop     af
;                 or      ixh     ; TODO: or C is 5 cycles faster, per pixel
;             .next_1:
;                 out     (c), a      ; TODO: out (port_0),a is 2 cycles faster per pixel (256 pixels)
;                 inc     hl
;                 inc     de
;                 djnz    .loop_1

;new version (117/112 cycles), 35 cycles saved, per pixel (9000 cycles total !!!)
            .loop_1:
                ld      a, (hl)         
                or      a               
                jp      nz, .continue_1         ; if (pixel == 0) ignore
            ; .keepBGpixel:
                ld      a, (de)
                jp      .next_1
            .continue_1:
                and     1111 1000 b             ; mask to keep 5 high bits from source
                ld      c, a
                ld      a, (de)
                and     0000 0111 b             ; mask to keep 3 low bits from bg
                or      c
            .next_1:
                out     (PORT_0), a
                inc     hl                  ; TODO: if data is table aligned can be replaced by INC L, saving 2 cycles per pixel
                inc     de                  ; TODO: if data is table aligned can be replaced by INC E, saving 2 cycles per pixel
                djnz    .loop_1

; TNIASM ALIGN directive: https://www.msx.org/forum/msx-talk/development/tniasm-align
; If you want to keep using tniASM and you want to use something like ALIGN, you can easily replicate its functionality with the
; ds command (define space). For example, if you wanted to write align #4000, you could write ds (((($-1)/#4000)+1)*#4000-$), 
; which does exactly the same thing.
; GuyveR800 says this works: ds (($-1) & -4000h) + 4000h - $


            pop     hl
            ld      bc, 256  ; next line on screen 11 ; TODO: may be changed to a simple INC H
            add     hl, bc
        pop     de
        
        ; DE += 16
        push    hl
            ex      de, hl
            ld      bc, 16
            add     hl, bc
            ex      de, hl
        pop     hl
    pop     bc
    djnz    .loop
    
    ret



; Convert MSX2 sprites (or-color) to SC 11 format to be plotted on screen
; warning: only 8 pixels wide, so must be called twice for a 16x16 sprite
; Input:
;   HL: pointer to sprite patterns on RAM (32 bytes for pattern 0, 32 bytes for pattern 1)
;   IX: pointer to sprite colors on RAM (16 bytes for color 0, 16 bytes for color 1)
;   DE: destiny addr on RAM
;   B:  font height in pixels
ConvertMsx2SpritesToSc11:

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
                ;   4 high bits: color index from palette
                ;   4 low bits: 1000 (set pixel to RGB palette instead of YJK)
                ;   0x00: transparent (repeat background)

                ex      de, hl
                ld      b, 8    ; number of pixels on destiny
            .loop:
                push    bc
                    ; push    hl ; not really necessary, HL is not touched

                        ; RL: Rotates arg1 register to the left with the carry's value put into bit 0 and bit 7 is put into the carry.
                        ; RLA: same, but faster

                        ; TODO: improve speed by changing Bit_Pattern_0 to register B (already shifted 1 bit left)
                        ; and Bit_Pattern_1 to register A

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
                        jp      .saveOutput_differentFrom_0

                    .setOutput_0:
                        xor     a
                        jp      .saveOutput

                    .setOutput_Color_0:
                        ld      a, (Color_0)
                        jp      .saveOutput_differentFrom_0

                    .setOutput_Color_1:
                        ld      a, (Color_1)
                        ; jp      .saveOutput_differentFrom_0

                    .saveOutput_differentFrom_0:
                        ; sla     a       ; 40 cycles
                        ; sla     a
                        ; sla     a
                        ; sla     a
                        ; scf ; set carry flag                        ; 30 cycles ; this will run once per bit, so on a 16x16 sprite is 10 x 16 x 16 cycles saved (2560!)
                        ; ccf ; complement (invert) carry flag
                        or      a ; clear carry preserving A            ; 25 cycles ; this will run once per bit, so on a 16x16 sprite is 15 x 16 x 16 cycles saved (3840!)
                        rla
                        rla
                        rla
                        rla
                        or      0000 1000 b     ; mask for SC 11 pixel format

                    .saveOutput:
                        ;ld      (Output), a

                    ; pop     hl ; not really necessary, HL is not touched
                    
                    ld      (hl), a
                    inc     hl

                pop     bc
                djnz    .loop

            pop     hl      ; from DE to HL
    
            ; next line on screen
            ; DE += 16
            ;ex      de, hl
            ld      bc, 16     ; 16 pixels per line on 16x16 bitmap
            add     hl, bc
            ex      de, hl      ; updated value back to DE

        pop     hl

    pop     bc

    inc     hl      ; next line of sprite patterns

    inc     ix      ; next line of sprite colors

    
    dec     b
    jp      nz, .outerLoop ; djnz not possible (destiny is more than 128 bytes away)

    ret
