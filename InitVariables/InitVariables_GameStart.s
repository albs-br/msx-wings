PLAYER_INITIAL_X:               equ 128 - (PLANE_PLAYER_WIDTH/2)
PLAYER_INITIAL_Y:               equ 192 - 32

PLAYER_SHOT_LEVEL_0:            equ 0   ; single width; thin pattern
PLAYER_SHOT_LEVEL_1:            equ 1   ; single width; fat pattern
PLAYER_SHOT_LEVEL_2:            equ 2   ; double width; thin pattern
PLAYER_SHOT_LEVEL_3:            equ 3   ; double width; fat pattern

PLAYER_SHOT_WIDTH_SINGLE:       equ 0
PLAYER_SHOT_WIDTH_DOUBLE:       equ 1



InitVariables_GameStart:

    ld      hl, (BIOS_JIFFY)                    ; msx bios time variable
    ld      a, l
    or      0x80                                ; a value different of zero is granted
    ld      (Seed), a
    ld      a, h
    ld      (Seed + 1), a



    ld      a, 3
    ld      (Player_Lives), a

    ld      a, 3
    ld      (Player_BombsNumber), a

    ld      hl, 0x0000
    ld      (Player_Score), hl

    ; xor     a
    ; ld      (GameOverAnimation_Vars.Counter), a



    ; call    InitAyFxVariables ; moved to main.s



    ; --------- Ground target item
    ; copy from initial HMMM parameters to buffer
    ld      hl, GroundTarget_HMMM_Parameters
    ld      de, VDP_HMMM_Params_Buffer
    ;ld      bc, HMMM_Parameters_size
    ;ldir
    ;HMMM_Parameters_size: equ 0Fh ; last def. pass 3
    ; 15x LDI
    ldi ldi ldi ldi ldi ldi ldi ldi 
    ldi ldi ldi ldi ldi ldi ldi



    ; ; TODO: this isnt necessary anymore (SPRATR buffer is not used on gmaeplay)
    ; ; copy from initial sprite attributes to buffer
    ; ld      hl, InitialSpriteAttributes
    ; ld      de, SPRATR_Buffer
    ; ld      bc, InitialSpriteAttributes.size
    ; ldir

    ret