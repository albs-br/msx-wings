;  -------------------- callers for relocated code

TitleScreen_RAM_Code:

    ; set MegaROM page for Code to be relocated
    ld      a, CODE_TO_BE_RELOCATED_MEGAROM_PAGE
    ;ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ld      hl, TitleScreen_Start
    ld      de, RAM_Code
    ld      bc, TitleScreen_size
    ldir



    ; Starts the music
    ld      a, MUSIC_SHUFFLE_ONE 			; index of music on SONG_TABLE
    call	StartMusic 	                    ; param a: liiiiiii, where l (MSB) is the loop flag (0 = loop), and iiiiiii is the 0-based song index (0, 1, 2...)



    call    TitleScreen

    call    Clear_RAM_Code_Area



    ; Stops the music
    call    StopMusic



    ret

ChooseInputScreen_RAM_Code:

    ; set MegaROM page for Code to be relocated
    ld      a, CODE_TO_BE_RELOCATED_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ld      hl, ChooseInputScreen_Start
    ld      de, RAM_Code
    ld      bc, ChooseInputScreen_size
    ldir

    call    ChooseInputScreen

    call    Clear_RAM_Code_Area

    ret

StageClearAnimation_RAM_Code:

    ; set MegaROM page for Code to be relocated
    ld      a, CODE_TO_BE_RELOCATED_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a
    call    Set_and_Save_MegaROM_Page

    ld      hl, StageClearAnimation_Start
    ld      de, RAM_Code
    ld      bc, StageClearAnimation_size
    ldir

    call    StageClearAnimation

    call    Clear_RAM_Code_Area

    ret



Clear_RAM_Code_Area:

    ld      hl, RAM_Code            ; source
    xor     a
    ld      (hl), a                 ; clear first byte
    ld      de, RAM_Code + 1        ; destiny
    ld      bc, RAM_Code.size - 1   ; size
    ldir                                    ; Copy BC bytes from HL to DE

    ret
