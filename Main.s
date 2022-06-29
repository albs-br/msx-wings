FNAME "msx-wings.rom"      ; output file

START_ADDR_MEGAROM_PAGE:	    equ	0x8000
PAGE_SIZE:	    equ	0x4000	        ; 16kB
Seg_P8000_SW:	equ	0x7000	        ; Segment switch for page 0x8000-0xBFFF (ASCII 16k Mapper, same for 8k Mapper)


DEBUG:          equ 255             ; defines debug mode, value is irrelevant (comment it out for production version)


; Compilation address
    org 0x4000, 0xbeff	                    ; 0x8000 can be also used here if Rom size is 16kB or less.

    ; Common
    INCLUDE "Include/RomHeader.s"
    INCLUDE "Include/MsxBios.s"
    INCLUDE "Include/MsxConstants.s"
    INCLUDE "Include/CommonRoutines.s"
    INCLUDE "Include/CommonRoutines_SC11.s"
    INCLUDE "Include/ayFXReplayer.s"

    ; Game
    INCLUDE "HTIMI_Hook.s"
    INCLUDE "InitVram.s"
    INCLUDE "Update_SPRATR_Buffer.s"
    INCLUDE "BlitSPRATR.s"
    INCLUDE "InitVariables.s"
    INCLUDE "Scroll.s"
    INCLUDE "ReadInput.s"
    
    INCLUDE "GameLogic/CommonLogic.s"
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

    INCLUDE "GameLogic/GroundTargetLogic/GroundTarget_Init.s"
    INCLUDE "GameLogic/GroundTargetLogic/GroundTarget_Reset.s"
    INCLUDE "GameLogic/GroundTargetLogic/GroundTarget_Logic.s"

    INCLUDE "LevelData/LoadLevel.s"
    ; INCLUDE "LevelData/Level_1.s"         ; moved to a MegaROM page
    ; INCLUDE "EnemyData/EnemyData_1.s"     ; moved to a MegaROM page
    ; INCLUDE "EnemyData/EnemyShotData.s"     ; moved to a MegaROM page
    INCLUDE "Sound/Sfx/PlaySfx.s"
    
    INCLUDE "DebugMessage.s"

    INCLUDE "Graphics/Sprites/Fonts/FontsTest.s"     ; moved to a MegaROM page

    ; Assets
    INCLUDE "Graphics/Sprites/SpriteAssets.s"
    ; INCLUDE "Graphics/Sprites/Fonts/Fonts.s"     ; moved to a MegaROM page
    INCLUDE "Sound/Sfx/MsxWingsSfx_Bank.s"
	INCLUDE "Graphics/Bitmaps/GroundTargetDestroyed.s"
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


    ld      a, 1                        ; level number (1-8)
    ld      (CurrentLevelNumber), a
    call    LoadLevel


    call    BIOS_ENASCR



    ; call    TestFonts_8x8   ; [debug]
    ; call    TestFonts_8x16   ; [debug]
    ; call    TestFonts_16x16   ; [debug]

    ; -------------------------------- test look-up table for circle movement

    ; set MegaROM page for Fonts data
    ld      a, FONTS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ; load sprite pat & colors
    ld      a, 0000 0001 b
    ld      hl, SPRPAT
    call    SetVdp_Write
    ld      b, 32
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, LargeFont_Patterns
    otir
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      b, 16
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, LargeFont_Colors
    otir

    ; int vars
    ld      ix, LOOKUP_TABLE_CIRCLE_MOV

.circleLoop:
    ld      hl, BIOS_JIFFY              ; (v-blank sync)
    ld      a, (hl)
.circleLoop_waitVBlank:
    cp      (hl)
    jr      z, .circleLoop_waitVBlank

    ; load SPRATR buffer
    ld      hl, SPRATR_Buffer
    ld      a, (ix)
    ld      (hl), a         ; y

    inc     hl
    ld      a, (ix+1)
    ld      (hl), a         ; x


    inc     ix              ; next addr on lookup table
    inc     ix

    ; load SPRATR table
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ; ld      b, SpriteAttrTableBuffer.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + ((SpriteAttrTableBuffer.size * 256) + PORT_0)
    ld      c, PORT_0
    ld      hl, SPRATR_Buffer
    ;otir
    ; 4x OUTI
    outi outi outi outi 


    call    Wait

    jp      .circleLoop

LOOKUP_TABLE_CIRCLE_MOV:
        db       0, 128
        db       2, 120
        db       5, 112
        db       8, 104
        db       12, 98
        db       17, 91
        db       22, 85
        db       27, 80
        db       33, 75
        db       39, 71
        db       46, 68
        db       52, 66
        db       58, 63
        db       65, 62
        db       72, 61
        db       78, 61
        db       84, 61
        db       90, 62
        db       96, 64
        db       101, 65
        db       107, 67
        db       112, 69
        db       117, 72
        db       121, 74
        db       125, 77
        db       129, 80
        db       133, 84
        db       136, 88
        db       138, 93
        db       140, 97
        db       142, 102
        db       143, 106
        db       145, 110
        db       145, 115
        db       145, 119
        db       145, 124
        db       144, 128
        db       143, 132
        db       141, 136
        db       139, 140
        db       137, 143
        db       136, 147
        db       133, 150
        db       130, 152
        db       127, 154
        db       124, 156
        db       121, 158
        db       118, 159
        db       114, 160
        db       111, 161
        db       108, 162
        db       105, 162
        db       102, 161
        db       99, 161
        db       95, 160
        db       93, 160
        db       90, 159
        db       87, 159
        db       85, 158
        db       82, 157
        db       80, 155
        db       77, 154
        db       75, 152
        db       73, 150
        db       71, 148
        db       69, 146
        db       68, 144
        db       67, 141
        db       66, 138
        db       65, 136
        db       64, 133
        db       64, 130
        db       64, 127
        db       64, 125
        db       65, 122
        db       65, 119
        db       66, 117
        db       67, 114
        db       69, 112
        db       70, 109
        db       72, 107
        db       74, 105
        db       76, 103
        db       78, 101
        db       80, 100
        db       83, 99
        db       86, 98
        db       88, 97
        db       91, 96
        db       94, 96
; -------------------------------- 

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