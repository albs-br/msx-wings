; index of music on SONG_TABLE
; param a: liiiiiii, where l (MSB) is the loop flag (0 = loop), and iiiiiii is the 0-based song index (0, 1, 2...)
StartMusic:
    push    af
        ; set MegaROM page for SFX/Music data
        ld      a, SFX_MEGAROM_PAGE
        ld	    (Seg_P8000_SW), a
        ;call    Set_and_Save_MegaROM_Page
    pop     af

    ; Starts the music
    ;ld      a, 1 			; index of music on SONG_TABLE
    call	REPLAYER.PLAY 	; param a: liiiiiii, where l (MSB) is the loop flag (0 = loop), and iiiiiii is the 0-based song index (0, 1, 2...)

    ret

StopMusic:

    ; set MegaROM page for SFX data
    ld      a, SFX_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; Stops the music
    ; ld      a, MUSIC_EMPTY 			; index of music on SONG_TABLE
    xor     a
    call	REPLAYER.PLAY 	; param a: liiiiiii, where l (MSB) is the loop flag (0 = loop), and iiiiiii is the 0-based song index (0, 1, 2...)

    ; ; Stops the music
    ; call	REPLAYER.STOP ; is keeping a noise, using empty music instead

    ret
