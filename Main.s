FNAME "msx-wings.rom"      ; output file

START_ADDR_MEGAROM_PAGE:	    equ	0x8000
PAGE_SIZE:	    equ	0x4000	        ; 16kB
Seg_P8000_SW:	equ	0x7000	        ; Segment switch for page 0x8000-0xBFFF (ASCII 16k Mapper, same for 8k Mapper)


; DEBUG:          equ 255             ; defines debug mode, value is irrelevant (comment it out for production version)


; Compilation address
    org 0x4000, 0xbeff	                    ; 0x8000 can be also used here if Rom size is 16kB or less.

    ; Common
    INCLUDE "Include/RomHeader.s"
    INCLUDE "Include/MsxBios.s"
    INCLUDE "Include/MsxConstants.s"
    INCLUDE "Include/CommonRoutines.s"
    INCLUDE "Include/ayFXReplayer.s"

    ; Game
    INCLUDE "HTIMI_Hook.s"
    INCLUDE "InitVram.s"
    INCLUDE "Update_SPRATR_Buffer.s"
    INCLUDE "BlitSPRATR.s"
    INCLUDE "InitVariables.s"
    INCLUDE "Scroll.s"
    INCLUDE "ReadInput.s"
    INCLUDE "GameLogic/GameLogic.s"
    INCLUDE "GameLogic/PlayerLogic.s"
    INCLUDE "GameLogic/PlayerShotLogic/PlayerShot_Init.s"
    INCLUDE "GameLogic/PlayerShotLogic/PlayerShot_Reset.s"
    INCLUDE "GameLogic/PlayerShotLogic/PlayerShot_Logic.s"
    INCLUDE "GameLogic/EnemyLogic/Enemy_Init.s"
    INCLUDE "GameLogic/EnemyLogic/Enemy_Reset.s"
    INCLUDE "GameLogic/EnemyLogic/Enemy_Logic.s"
    INCLUDE "GameLogic/EnemyShotLogic/EnemyShot_Init.s"
    INCLUDE "GameLogic/EnemyShotLogic/EnemyShot_Reset.s"
    INCLUDE "GameLogic/EnemyShotLogic/EnemyShot_Logic.s"
    INCLUDE "GameLogic/ItemLogic/Item_Init.s"
    INCLUDE "GameLogic/ItemLogic/Item_Reset.s"
    INCLUDE "GameLogic/ItemLogic/Item_Logic.s"
    INCLUDE "LevelData/LoadLevel.s"
    INCLUDE "LevelData/Level_1.s"
    INCLUDE "EnemyData/EnemyData_1.s"
    INCLUDE "EnemyData/EnemyShotData.s"
    INCLUDE "Sound/Sfx/PlaySfx.s"

    ; Assets
    INCLUDE "Graphics/Sprites/SpriteAssets.s"
    INCLUDE "Sound/Sfx/MsxWingsSfx_Bank.s"
    ; background bitmaps are on MegaRomPages.s




Execute:
    ; init interrupt mode and stack pointer (in case the ROM isn't the first thing to be loaded)
	di                          ; disable interrupts
	im      1                   ; interrupt mode 1
    ld      sp, (BIOS_HIMEM)    ; init SP


    ; install the interrupt routine
	di
	ld	    a, 0xc3 ; opcode for "JP nn"
	ld	    (HTIMI), a
	ld	    hl, HOOK
	ld	    (HTIMI + 1), hl
	ei


    call    EnableRomPage2


	; enable page 1
    ld	    a, 1
	ld	    (Seg_P8000_SW), a


    call    InitVram



; ---------------------
    call    ClearRam


    call    InitVariables

    
    ; Setup ayFXreplayer
    ld      hl, MsxWingsSfx_Bank
    ld      a, 200
    ld      (ayFX_VOLUME), a
    call    ayFX_SETUP


    ld      a, 8            ; level number (1-8)
    call    LoadLevel


    call    BIOS_ENASCR


; --------- 


.gameLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.waitVBlank:
    cp      (hl)
    jr      z, .waitVBlank




    IFDEF DEBUG
        ; Save Jiffy to check if previous frame ended
        ld      a, (hl)
        ld      (CurrentJiffy), a
    ENDIF    





    IFDEF DEBUG
        ld 		a, 4       	            ; Border color
        ld 		(BIOS_BDRCLR), a    
        call 	BIOS_CHGCLR        		; Change Screen Color
    ENDIF

    call    ExecuteScroll

    ; call    Update_SPRATR_Buffer

    ; call    BlitSPRATR


    IFDEF DEBUG
        ld 		a, 7       	            ; Border color
        ld 		(BIOS_BDRCLR), a    
        call 	BIOS_CHGCLR        		; Change Screen Color
    ENDIF


    call    ReadInput

    call    GameLogic

    call    Update_SPRATR_Buffer

    call    BlitSPRATR



    IFDEF DEBUG
        ld 		a, 8       	            ; Border color
        ld 		(BIOS_BDRCLR), a    
        call 	BIOS_CHGCLR        		; Change Screen Color
    ENDIF




    IFDEF DEBUG
        ; Checks if main loop takes more than one frame to run
        ld      a, (BIOS_JIFFY)
        ld      b, a
        ld      a, (CurrentJiffy)
        cp      b
        call    nz, .frameSkip
    ENDIF

    jp      .gameLoop

.frameSkip:
    ld      hl, FramesSkipped
    inc     (hl)
    ret

End:



InitialSpriteAttributes:
    ;   Y, X, Pattern, Reserved

; ----------- player plane

    ; sprites 0 and 1
    db  PLAYER_INITIAL_Y, PLAYER_INITIAL_X, PLAYER_SPR_PAT_0_NUMBER, 0
    db  PLAYER_INITIAL_Y, PLAYER_INITIAL_X, PLAYER_SPR_PAT_1_NUMBER, 0

    ; sprites 2 and 3
    db  PLAYER_INITIAL_Y + 16, PLAYER_INITIAL_X, PLAYER_SPR_PAT_2_NUMBER, 0
    db  PLAYER_INITIAL_Y + 16, PLAYER_INITIAL_X, PLAYER_SPR_PAT_3_NUMBER, 0

; ; ----------- player shots

;     ; sprites 4, 5 and 6
;     db  192, 255, EMPTY_SPR_PAT_NUMBER, 0
;     db  192, 255, EMPTY_SPR_PAT_NUMBER, 0
;     db  192, 255, EMPTY_SPR_PAT_NUMBER, 0

; ----------- enemy planes

    ; ; TODO: enemy pattern number should be loaded on Enemy_Init
    ; ; sprites 7 and 8
    ; db  0, 0, ENEMY_SPR_PAT_0_NUMBER, 0
    ; db  0, 0, ENEMY_SPR_PAT_1_NUMBER, 0
    ; ; sprites 9 and 10
    ; db  192, 255, ENEMY_SPR_PAT_0_NUMBER, 0
    ; db  192, 255, ENEMY_SPR_PAT_1_NUMBER, 0
    ; ; sprites 11 and 12
    ; db  192, 255, ENEMY_SPR_PAT_0_NUMBER, 0
    ; db  192, 255, ENEMY_SPR_PAT_1_NUMBER, 0
    ; ; sprites 13 and 14
    ; db  30, 0, ENEMY_SPR_PAT_0_NUMBER, 0
    ; db  30, 0, ENEMY_SPR_PAT_1_NUMBER, 0
    ; ; sprites 15 and 16
    ; db  60, 0, ENEMY_SPR_PAT_0_NUMBER, 0
    ; db  60, 0, ENEMY_SPR_PAT_1_NUMBER, 0
    ; ; sprites 17 and 18
    ; db  90, 0, ENEMY_SPR_PAT_0_NUMBER, 0
    ; db  90, 0, ENEMY_SPR_PAT_1_NUMBER, 0

; hide all sprites from here onwards
    db  216, 0, 0, 0

.size:  equ $ - InitialSpriteAttributes



    db      "End ROM started at 0x4000"

	ds PAGE_SIZE - ($ - 0x4000), 255	; Fill the unused area with 0xFF



; MegaROM pages at 0x8000
    INCLUDE "MegaRomPages.s"



; RAM
	org     0xc000, 0xe5ff                   ; for machines with 16kb of RAM (use it if you need 16kb RAM, will crash on 8kb machines, such as the Casio PV-7)

RamStart:
    INCLUDE "Variables.s"
RamEnd: