STRING_DEBUG_ENEMY_INIT_ERROR:          db "Enemy is being initialized before its lifecycle ends", 0
;STRING_DEBUG_BIG_ENEMY_INIT_ERROR:      db "Big enemy is being initialized before its lifecycle ends", 0
STRING_DEBUG_ENEMY_SHOT_INIT_ERROR:     db "Enemy shot is being initialized before its lifecycle ends", 0


; Input:
;   HL: pointer to string
DebugMessage:

    push    hl
        ; define screen colors
        ld 		a, 15      	            ; Foreground color
        ld 		(BIOS_FORCLR), a    
        ld 		a, 1  		            ; Background color
        ld 		(BIOS_BAKCLR), a     
        ld 		a, 1      	            ; Border color
        ld 		(BIOS_BDRCLR), a    
        call 	BIOS_CHGCLR        		; Change Screen Color

        call    BIOS_INITXT     ; initialize screen 0
    pop     hl

.mainLoop:
    ld      a, (hl)
    cp      0
    ; ret     z
    jp      z, .endlessLoop
    call    BIOS_CHPUT
    inc     hl
    jr      .mainLoop

.endlessLoop:
    jp      .endlessLoop
