FNAME "msx-wings.rom"      ; output file

START_ADDR_MEGAROM_PAGE:	    equ	0x8000
PAGE_SIZE:	    equ	0x4000	        ; 16kB
Seg_P8000_SW:	equ	0x7000	        ; Segment switch for page 0x8000-0xBFFF (ASCII 16k Mapper, same for 8k Mapper)


; DEBUG:          equ 255             ; defines debug mode, value is irrelevant (comment it out for production version)


; Compilation address
    org 0x4000, 0x7fff	                    ; 0x8000 can be also used here if Rom size is 16kB or less.

    ; Common
    INCLUDE "Include/RomHeader.s"

    ; code to force ASCII16 mapper auto detection on openMSX (not working)
    ; https://www.msx.org/forum/msx-talk/development/how-to-create-a-long-rom-file?page=2#comment-456529
    ;db 0x32, 0, 0x70, 0x32, 0xFF, 0x77
    ; ld (7000h),a
    ; ld (77ffh),a

    INCLUDE "Include/MsxBios.s"
    INCLUDE "Include/MsxConstants.s"
    INCLUDE "Include/CommonRoutines.s"
    INCLUDE "Include/CommonRoutines_SC11.s"
    INCLUDE "Include/CommonRoutines_SC5.s"
    INCLUDE "Include/ayFXReplayer.s"
    INCLUDE "Include/dzx0_standard.asm"

    ; Game
    INCLUDE "HTIMI_Hook.s"
    INCLUDE "InitVram.s"
    INCLUDE "Update_SPRATR.s"
    ;INCLUDE "BlitSPRATR.s"
    INCLUDE "InitVariables/InitVariables_GameStart.s"
    INCLUDE "InitVariables/InitVariables_LevelStart.s"
    INCLUDE "InitVariables/InitVariables_PlayerStart.s"
    INCLUDE "Scroll.s"
    INCLUDE "ReadInput.s"
    INCLUDE "PaletteCycling.s"

    INCLUDE "GameLogic/CommonLogic.s"
    INCLUDE "GameLogic/GameLogic.s"
    INCLUDE "GameLogic/PlayerLogic.s"
    INCLUDE "GameLogic/PlayerBombLogic.s"

    INCLUDE "GameLogic/PlayerShotLogic/PlayerShot_Init.s"
    INCLUDE "GameLogic/PlayerShotLogic/PlayerShot_Reset.s"
    INCLUDE "GameLogic/PlayerShotLogic/PlayerShot_Logic.s"

    INCLUDE "GameLogic/EnemyLogic/Enemy_Init.s"
    INCLUDE "GameLogic/EnemyLogic/Enemy_Reset.s"
    INCLUDE "GameLogic/EnemyLogic/Enemy_Logic.s"

    INCLUDE "GameLogic/BigEnemyLogic/BigEnemy_Init.s"
    INCLUDE "GameLogic/BigEnemyLogic/BigEnemy_Reset.s"
    INCLUDE "GameLogic/BigEnemyLogic/BigEnemy_Logic.s"
    INCLUDE "GameLogic/BigEnemyLogic/UpdateBigEnemiesPatterns.s"

    INCLUDE "GameLogic/EnemyShotLogic/EnemyShot_Init.s"
    INCLUDE "GameLogic/EnemyShotLogic/EnemyShot_Reset.s"
    INCLUDE "GameLogic/EnemyShotLogic/EnemyShot_Logic.s"

    INCLUDE "GameLogic/ItemLogic/Item_Init.s"
    INCLUDE "GameLogic/ItemLogic/Item_Reset.s"
    INCLUDE "GameLogic/ItemLogic/Item_Logic.s"
    INCLUDE "GameLogic/ItemLogic/ItemAnimation.s"

    INCLUDE "GameLogic/GroundTargetLogic/GroundTarget_Init.s"
    INCLUDE "GameLogic/GroundTargetLogic/GroundTarget_Reset.s"
    INCLUDE "GameLogic/GroundTargetLogic/GroundTarget_Logic.s"

    ; INCLUDE "GameLogic/BossLogic/Boss_Init.s"
    ; INCLUDE "GameLogic/BossLogic/Boss_Reset.s"
    ; INCLUDE "GameLogic/BossLogic/Boss_Logic.s"

    INCLUDE "Data/LevelData/LoadLevel.s"
    ; INCLUDE "LevelData/Level_1.s"         ; moved to a MegaROM page
    ; INCLUDE "EnemyData/EnemyData_1.s"     ; moved to a MegaROM page
    ; INCLUDE "EnemyData/EnemyShotData.s"     ; moved to a MegaROM page
    INCLUDE "Sound/Sfx/PlaySfx.s"

    INCLUDE "Animations/PauseAnimation/PauseAnimation.s" ; 623 bytes ; candidate to be moved to CODE_TO_BE_RELOCATED_MEGAROM_PAGE

    INCLUDE "Animations/LevelTitleAnimation/LevelTitleAnimation.s" ; 437 bytes ; candidate to be moved to CODE_TO_BE_RELOCATED_MEGAROM_PAGE
    INCLUDE "Animations/LevelTitleAnimation/Data.s" ; 125 bytes ; candidate to be moved to CODE_TO_BE_RELOCATED_MEGAROM_PAGE

    ; INCLUDE "Animations/StageClearAnimation/StageClearAnimation.s" ; 905 bytes ; ; moved to MegaROM page, to be relocated to RAM later
    ;INCLUDE "Animations/StageClearAnimation/SPRATR_Data.s" ; moved to a MegaROM page
    ;INCLUDE "Graphics/Sprites/StageClearAnimation/StageClearAnimation.s" ; moved to a MegaROM page
    
    INCLUDE "Animations/GameOverAnimation/GameOverAnimation.s" ; 347 bytes ; candidate to be moved to CODE_TO_BE_RELOCATED_MEGAROM_PAGE
    ; INCLUDE "Animations/GameOverAnimation/GameOverAnimation_Data.s" ; moved to a MegaROM page

    INCLUDE "DebugMessage.s"

    ; INCLUDE "Graphics/Sprites/Fonts/FontsTest.s" ; 353 bytes ; commented out to save space
    INCLUDE "Graphics/Sprites/Fonts/Fonts_CommonRoutines.s"
    INCLUDE "Graphics/Sprites/Fonts/Fonts_Constants.s"

    ; moved to MegaROM page, to be relocated to RAM later
    ; INCLUDE "TitleScreen/TitleScreen.s" ; 759 bytes
    ; INCLUDE "TitleScreen/Data.s" ; 79 bytes

    INCLUDE "ChooseInputScreen/ChooseInputScreen.s" ; ? bytes

    ; Assets
    INCLUDE "Graphics/Sprites/SpritePalettes.s"
    ; INCLUDE "Graphics/Sprites/SpritePatterns.s" ; moved to a MegaROM page
SpriteColors_start:    
    INCLUDE "Graphics/Sprites/SpriteColors.s"
SpriteColors_size: equ $ - SpriteColors_start ; 0x3d0 = 976 bytes (it is not easy to move to a MegaROM page cos it is referenced in many places)
    ; INCLUDE "Graphics/Sprites/Fonts/Fonts.s"     ; moved to a MegaROM page
    INCLUDE "Sound/Sfx/MsxWingsSfx_Bank.s" ;moved to a MegaROM page ATTENTION: MOVED BACK cos it was causing bug (sound tone keeps playing after sfx ended)
	; INCLUDE "Graphics/Bitmaps/GroundTargetDestroyed.s" ; moved to a MegaROM page
    ; background bitmaps are on MegaRomPages.s

    INCLUDE "Relocated_Code_Callers.s"



Execute:
    ; init interrupt mode and stack pointer (in case the ROM isn't the first thing to be loaded)
	di                          ; disable interrupts
	im      1                   ; interrupt mode 1
    ld      sp, (BIOS_HIMEM)    ; init SP


    ; disable keyboard click
    xor     a
    ld 		(BIOS_CLIKSW), a     ; Key Press Click Switch 0:Off 1:On (1B/RW)


    call    EnableRomPage2


	; enable page 1
    ld	    a, 1
	ld	    (Seg_P8000_SW), a


    call    ClearRam





    ; call    TitleScreen_RAM_Code ; debug


    call    ChooseInputScreen ; debug


    ; install the interrupt routine
	di
        ld	    a, 0xc3 ; opcode for "JP nn"
        ld	    (HTIMI), a
        ld	    hl, HOOK
        ld	    (HTIMI + 1), hl
	ei









    call    InitVram



; ---------------------
    ; call    ClearRam


    call    InitVariables_GameStart



    ; ; set MegaROM page for SFX data
    ; ld      a, SFX_MEGAROM_PAGE
    ; ld	    (Seg_P8000_SW), a

    ; Setup ayFXreplayer
    ld      hl, MsxWingsSfx_Bank
    ld      a, 200
    ld      (ayFX_VOLUME), a
    call    ayFX_SETUP




    ; 1: Tokyo
    ; 2: USSR
    ; 3: Japan classic
    ; 4: Jungle
    ; 5: NY
    ; 6: Paris
    ; 7: Sidney
    ; 8: Mexico
    ld      a, 1                        ; level number (1-8)
    ld      (CurrentLevelNumber), a
    call    LoadLevel



    ; ; fonts test
    ; call    BIOS_ENASCR
    ; call    TestFonts_8x8   ; [debug]
    ; call    TestFonts_8x16   ; [debug]
    ; call    TestFonts_16x16   ; [debug]
    ; jp $




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
        ; Start profiling a frame with in a,(2dh), end with out (2dh),a.
        in a, (2dh)
    ENDIF

    IFDEF DEBUG
        ld 		a, 4       	            ; Border color
        ld 		(BIOS_BDRCLR), a
        call 	BIOS_CHGCLR        		; Change Screen Color
    ENDIF

    call    ExecuteScroll

    ; call    Update_SPRATR_Buffer

    ; call    BlitSPRATR

    call    PaletteCycling

    IFDEF DEBUG
        ld 		a, 7       	            ; Border color
        ld 		(BIOS_BDRCLR), a
        call 	BIOS_CHGCLR        		; Change Screen Color
    ENDIF


    call    ReadInput

    call    GameLogic

    ; --------------------------------------

    ; old
    ;call    Update_SPRATR_Buffer ; 3791 cycles
    ;call    BlitSPRATR           ; 2360 cycles
    ;                             = 6151 cycles

    ; new
    call    Update_SPRATR ; 3766 cycles (2385 cycles saved)

    ; --------------------------------------


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

    IFDEF DEBUG
        ; Start profiling a frame with in a,(2dh), end with out (2dh),a.
        out (2dh) ,a
    ENDIF

    jp      .gameLoop

.frameSkip:
    ld      hl, FramesSkipped
    inc     (hl)
    ret

End:



; InitialSpriteAttributes:
;     ;   Y, X, Pattern, Reserved

; ; ----------- player plane

;     ; sprites 0 and 1
;     db  PLAYER_INITIAL_Y, PLAYER_INITIAL_X, PLAYER_SPR_PAT_0_NUMBER, 0
;     db  PLAYER_INITIAL_Y, PLAYER_INITIAL_X, PLAYER_SPR_PAT_1_NUMBER, 0

;     ; sprites 2 and 3
;     db  PLAYER_INITIAL_Y + 16, PLAYER_INITIAL_X, PLAYER_SPR_PAT_2_NUMBER, 0
;     db  PLAYER_INITIAL_Y + 16, PLAYER_INITIAL_X, PLAYER_SPR_PAT_3_NUMBER, 0

; ; ; ----------- player shots

; ;     ; sprites 4, 5 and 6
; ;     db  192, 255, EMPTY_SPR_PAT_NUMBER, 0
; ;     db  192, 255, EMPTY_SPR_PAT_NUMBER, 0
; ;     db  192, 255, EMPTY_SPR_PAT_NUMBER, 0

; ; ----------- enemy planes

;     ; ; TODO: enemy pattern number should be loaded on Enemy_Init
;     ; ; sprites 7 and 8
;     ; db  0, 0, ENEMY_SPR_PAT_0_NUMBER, 0
;     ; db  0, 0, ENEMY_SPR_PAT_1_NUMBER, 0
;     ; ; sprites 9 and 10
;     ; db  192, 255, ENEMY_SPR_PAT_0_NUMBER, 0
;     ; db  192, 255, ENEMY_SPR_PAT_1_NUMBER, 0
;     ; ; sprites 11 and 12
;     ; db  192, 255, ENEMY_SPR_PAT_0_NUMBER, 0
;     ; db  192, 255, ENEMY_SPR_PAT_1_NUMBER, 0
;     ; ; sprites 13 and 14
;     ; db  30, 0, ENEMY_SPR_PAT_0_NUMBER, 0
;     ; db  30, 0, ENEMY_SPR_PAT_1_NUMBER, 0
;     ; ; sprites 15 and 16
;     ; db  60, 0, ENEMY_SPR_PAT_0_NUMBER, 0
;     ; db  60, 0, ENEMY_SPR_PAT_1_NUMBER, 0
;     ; ; sprites 17 and 18
;     ; db  90, 0, ENEMY_SPR_PAT_0_NUMBER, 0
;     ; db  90, 0, ENEMY_SPR_PAT_1_NUMBER, 0

; ; hide all sprites from here onwards
;     db  216, 0, 0, 0

; .size:  equ $ - InitialSpriteAttributes



    ; db      "End ROM started at 0x4000"

PAGE_0x4000_size:          equ $ - 0x4000   ; 0x36d2 bytes (more than 2kb free)
	ds PAGE_SIZE - ($ - 0x4000), 255	; Fill the unused area with 0xFF



; MegaROM pages at 0x8000
    INCLUDE "MegaRomPages.s"



; RAM
	org     0xc000, 0xe5ff                   ; for machines with 16kb of RAM (use it if you need 16kb RAM, will crash on 8kb machines, such as the Casio PV-7)

; 0xc000 = 49152
; 0xe5ff = 58879

; total =  9727 bytes
RamStart:
    INCLUDE "Variables.s"
RamEnd:
Ram_size:          equ $ - RamStart ; 0x23c6 (9158 bytes)
