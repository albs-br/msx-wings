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
                ld      a, 0000 0000 b
                call    SetVdp_Read
                ld      c, PORT_0
                ld      hl, CurrentLineBGPixels
                ; 16x INI
                ini ini ini ini ini ini ini ini ini ini ini ini ini ini ini ini 
            pop     hl
            push    hl
                ; copy source line to current bg line unless bg == 0 (keep bg)
                ld      a, 0000 0000 b
                call    SetVdp_Write
                ld      c, PORT_0
                ;ld      hl, .TestDrawBg
                ex      de, hl          ; HL <= DE (source image on RAM)
                ; ; 16x OUTI
                ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
                ld      de, CurrentLineBGPixels
                ld      b, 16
            .loop_1:
                ld      a, (hl)
                or      a
                jp      nz, .continue_1          ; if (pixel == 0) ignore
            ; .keepBGpixel:
                ld      a, (de)
                jp      .next_1
            .continue_1:
                and     1111 1000 b             ; mask to keep 5 high bits from source
                push    af
                    ld      a, (de)
                    and     0000 0111 b         ; mask to keep 3 low bits from bg
                    ld      ixh, a
                pop     af
                or      ixh
            .next_1:
                out     (c), a
                inc     hl
                inc     de
                djnz    .loop_1

            pop     hl
            ld      bc, 256  ; next line on screen 11
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
; Input:
;   HL: pointer to sprite patterns on RAM (32 bytes for pattern 0, 32 bytes for pattern 1)
;   IX: pointer to sprite colors on RAM (16 bytes for color 0, 16 bytes for color 1)
;   DE: destiny addr on RAM
ConvertMsx2SpritesToSc11:

    ;ld      b, 8        ; 8 lines of 8 pixels
    ld      b, 16        ; 16 lines of 8 pixels
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
                ; 4 high bits: color index from palette
                ; 4 low bits: 1000 (set pixel to RGB palette instead of YJK)
                ; 0x00: transparent (repeat background)

                ex      de, hl
                ld      b, 8    ; number of pixels on destiny
            .loop:
                push    bc
                    push    hl

                        ; RL: Rotates arg1 register to the left with the carry's value put into bit 0 and bit 7 is put into the carry.
                        ; RLA: same, but faster

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
                        ; else Output = Color_1 | Color_1 ; or-color
                        ld      a, (Bit_Pattern_0)
                        sla     a
                        ld      b, a
                        ld      a, (Bit_Pattern_1)
                        or      b

                        or      a
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
                        jp      .saveOutput_differentFrom_0

                    .saveOutput_differentFrom_0:
                        sla     a       ; TODO: improve speed (using RLA)
                        sla     a
                        sla     a
                        sla     a
                        or      0000 1000 b

                    .saveOutput:
                        ;ld      (Output), a

                    pop     hl
                    
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

    inc     hl      ; next line of sprite


    
    dec     b
    jp      nz, .outerLoop

    ret
