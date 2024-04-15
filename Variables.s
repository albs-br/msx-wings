Seed:                               rw 1


;Player_Status:                   rb 1    ; 0: dead, 1: alive, 2-20: explosion animation, 21-201: respawn invencibility
Player_Status:                    rb 1    ; 0: dead, 1: alive, 2-20: explosion animation, 21-250: respawn invencibility

Player_X:                           rb 1
Player_Y:                           rb 1
Player_Y_Static:                    rb 1 ; y coord ignoring scroll

Player_Shot_Level:                  rb 1
Player_Shot_Width:                  rb 1

Player_SideMovementCounter:         rb 1 ; 128: center, < 128: left, > 128: right
Player_SpritePatternNumber:         rb 1

Player_Spr3_Offset_X:               rb 1

Player_BombsNumber:                 rb 1
Player_BombActive:                  rb 1 ; 0: disabled; >0: enabled (act like a counter)
Player_Bomb_Y:                      rb 1
Player_Bomb_Y_Static:               rb 1
Player_Lives:                       rb 1

Player_Score:                       rw 1 ; BCD coded (0-9999) range. Will be shown on screen x1000

Player_Controls_Enabled:            rb 1 ; 0: disabled; 1: enabled

; ---------------------------------------

PlayerShot_Temp_Struct:
PlayerShot_Temp_Status:                  rb 1    
PlayerShot_Temp_X:                       rb 1
PlayerShot_Temp_Y:                       rb 1
PlayerShot_Temp_Y_Static:                rb 1 ; y coord ignoring scroll
PlayerShot_Temp_PatternNumber_0:         rb 1
PlayerShot_Temp_PatternNumber_1:         rb 1
PlayerShot_Temp_Struct.size:        equ $ - PlayerShot_Temp_Struct



PlayerShot_0_Struct:                    rb PlayerShot_Temp_Struct.size
PlayerShot_1_Struct:                    rb PlayerShot_Temp_Struct.size
PlayerShot_2_Struct:                    rb PlayerShot_Temp_Struct.size
; PlayerShot_3_Struct:                    rb PlayerShot_Temp_Struct.size
; PlayerShot_4_Struct:                    rb PlayerShot_Temp_Struct.size
; PlayerShot_5_Struct:                    rb PlayerShot_Temp_Struct.size


NextShot_Struct_Addr:                   rw 1
Player_FramesSinceLastShot:             rb 1


ENEMY_MODE_SMALL_ENEMIES: equ 0
ENEMY_MODE_BIG_ENEMIES: equ 1
; ENEMY_MODE_BOSS: equ 2
EnemyMode:      rb 1

; ---------------------------------------

Enemy_Temp_Struct:
Enemy_Temp_Status:                  rb 1    ; 0: dead, 1: alive, 2-20: explosion animation, 255: enemy became item
Enemy_Temp_X:                       rb 1
Enemy_Temp_Y:                       rb 1
Enemy_Temp_Y_Static:                rb 1    ; y coord ignoring scroll
Enemy_Temp_Pattern_0:               rb 1
Enemy_Temp_Pattern_1:               rb 1
Enemy_Temp_Data_Current_Addr:       rw 1
Enemy_Temp_SPRCOL_Addr:             rw 1    ; VRAM addr for colors of these two patterns
Enemy_Temp_X1:                      rb 1
Enemy_Temp_Y1:                      rb 1
Enemy_Temp_Frame_Counter:           rw 1
Enemy_Temp_ItemStruct_Addr:         rw 1    ; 0x0000 means that this enemy will not be turned into an item when killed,
                                            ; otherwise it stores the Item Struct Addr (should have the same index as the enemy)
Enemy_Temp_Item_Type:               rb 1    ; item type (Item P or Bomb)
Enemy_Temp_Struct.size:        equ $ - Enemy_Temp_Struct



Enemy_0_Struct:                    rb Enemy_Temp_Struct.size
Enemy_1_Struct:                    rb Enemy_Temp_Struct.size
Enemy_2_Struct:                    rb Enemy_Temp_Struct.size
Enemy_3_Struct:                    rb Enemy_Temp_Struct.size
Enemy_4_Struct:                    rb Enemy_Temp_Struct.size
Enemy_5_Struct:                    rb Enemy_Temp_Struct.size
Enemy_6_Struct:                    rb Enemy_Temp_Struct.size


; ---------------------------------------

BigEnemy_Temp_Struct:
BigEnemy_Temp_Status:                  rb 1    ; 0: dead, 1: alive, 2-20: explosion animation
BigEnemy_Temp_X:                       rb 1
BigEnemy_Temp_Y:                       rb 1
BigEnemy_Temp_Y_Static:                rb 1    ; y coord ignoring scroll
BigEnemy_Temp_Data_Current_Addr:       rw 1
BigEnemy_Temp_SPRCOL_Addr:             rw 1    ; VRAM addr for colors of these two patterns
BigEnemy_Temp_X1:                      rb 1 ; BigEnemy_Temp_Struct + 8
BigEnemy_Temp_Y1:                      rb 1 ; BigEnemy_Temp_Struct + 9
BigEnemy_Temp_X2:                      rb 1 ; BigEnemy_Temp_Struct + 10
BigEnemy_Temp_Y2:                      rb 1 ; BigEnemy_Temp_Struct + 11
BigEnemy_Temp_X3:                      rb 1 ; BigEnemy_Temp_Struct + 12
BigEnemy_Temp_Y3:                      rb 1 ; BigEnemy_Temp_Struct + 13
BigEnemy_Temp_X4:                      rb 1 ; BigEnemy_Temp_Struct + 14
BigEnemy_Temp_Y4:                      rb 1 ; BigEnemy_Temp_Struct + 15
BigEnemy_Temp_X5:                      rb 1 ; BigEnemy_Temp_Struct + 16
BigEnemy_Temp_Y5:                      rb 1 ; BigEnemy_Temp_Struct + 17
BigEnemy_Temp_X6:                      rb 1 ; BigEnemy_Temp_Struct + 18
BigEnemy_Temp_Y6:                      rb 1 ; BigEnemy_Temp_Struct + 19
BigEnemy_Temp_Pattern_0:               rb 1 ; BigEnemy_Temp_Struct + 20
BigEnemy_Temp_Pattern_1:               rb 1 ; BigEnemy_Temp_Struct + 21
BigEnemy_Temp_Pattern_2:               rb 1 ; BigEnemy_Temp_Struct + 22
BigEnemy_Temp_Pattern_3:               rb 1 ; BigEnemy_Temp_Struct + 23
BigEnemy_Temp_Pattern_4:               rb 1 ; BigEnemy_Temp_Struct + 24
BigEnemy_Temp_Pattern_5:               rb 1 ; BigEnemy_Temp_Struct + 25
BigEnemy_Temp_Pattern_6:               rb 1 ; BigEnemy_Temp_Struct + 26
BigEnemy_Temp_Frame_Counter:           rw 1 ; BigEnemy_Temp_Struct + 27 ; counts how long the enemy is alive (in frames)
BigEnemy_Temp_Power:                   rb 1 ; BigEnemy_Temp_Struct + 29 ; energy level of big enemy (decreased at each shot received, it dies when get to 0)
BigEnemy_Temp_Hit:                     rb 1 ; BigEnemy_Temp_Struct + 30 ; flag to indicate big enemy got hit
BigEnemy_Temp_Struct.size:        equ $ - BigEnemy_Temp_Struct


; vars common for both big enemies
BigEnemy_Animation_Counter:           rb 1 ; 0-2 animation frame # (Chopper)
BigEnemy_Type:                        rb 1 ; contants: BIG_ENEMY_TYPE_CHOPPER, BIG_ENEMY_TYPE_TANK, BIG_ENEMY_TYPE_HOVERCRAFT


BigEnemy_0_Struct:                    rb BigEnemy_Temp_Struct.size
BigEnemy_1_Struct:                    rb BigEnemy_Temp_Struct.size


; ---------------------------------------

; Boss_Struct:
; .Status:                           rb 1    ; 0: dead, 1: alive, 2-?: explosion animation

; .X:                                rb 1
; .Y:                                rb 1
; .Y_Static:                         rb 1    ; y coord ignoring scroll

; .SPR_0_X:                          rb 1
; .SPR_0_Y:                          rb 1
; .Pattern_0:                        rb 1

; ; TODO: X1...

; .Data_Current_Addr:                rw 1
; .SPRCOL_Addr:                      rw 1    ; VRAM addr for colors of these 14 patterns

; .Frame_Counter:                    rw 1

; .size:        equ $ - Boss_Struct

; ---------------------------------------

EnemyShot_Temp_Struct:
EnemyShot_Temp_Status:                  rb 1    
EnemyShot_Temp_X:                       rb 1
EnemyShot_Temp_Y:                       rb 1
EnemyShot_Temp_Y_Static:                rb 1 ; y coord ignoring scroll
EnemyShot_Temp_Pattern:                 rb 1
EnemyShot_Temp_Delta_X_Current_Addr:    rw 1
EnemyShot_Temp_Delta_Y_Current_Addr:    rw 1
EnemyShot_Temp_SPRCOL_Addr:             rw 1
EnemyShot_Temp_Struct.size:        equ $ - EnemyShot_Temp_Struct



EnemyShot_0_Struct:                    rb EnemyShot_Temp_Struct.size
EnemyShot_1_Struct:                    rb EnemyShot_Temp_Struct.size
EnemyShot_2_Struct:                    rb EnemyShot_Temp_Struct.size
EnemyShot_3_Struct:                    rb EnemyShot_Temp_Struct.size
EnemyShot_4_Struct:                    rb EnemyShot_Temp_Struct.size
EnemyShot_5_Struct:                    rb EnemyShot_Temp_Struct.size
EnemyShot_6_Struct:                    rb EnemyShot_Temp_Struct.size

; ---------------------------------------

Item_Temp_Struct:
Item_Temp_Status:                  rb 1    
Item_Temp_X:                       rb 1
Item_Temp_Y:                       rb 1
Item_Temp_Y_Static:                rb 1     ; y coord ignoring scroll
Item_Temp_Pattern_0:               rb 1
Item_Temp_Pattern_1:               rb 1
Item_Temp_Data_Current_Addr:       rw 1
Item_Temp_SPRCOL_Addr:             rw 1     ; VRAM addr for colors of these two patterns
Item_Temp_X1:                      rb 1     ; not used
Item_Temp_Y1:                      rb 1     ; not used
Item_Temp_Frame_Counter:           rw 1
Item_Temp_Delta_X:                 rb 1     ; +1 or -1
Item_Temp_Delta_Y:                 rb 1     ; +1 or -1
Item_Temp_Type:                    rb 1    ; item type (Item P or Bomb)
Item_Temp_Struct.size:        equ $ - Item_Temp_Struct



Item_0_Struct:                    rb Item_Temp_Struct.size
Item_1_Struct:                    rb Item_Temp_Struct.size
Item_2_Struct:                    rb Item_Temp_Struct.size
Item_3_Struct:                    rb Item_Temp_Struct.size
Item_4_Struct:                    rb Item_Temp_Struct.size
Item_5_Struct:                    rb Item_Temp_Struct.size
Item_6_Struct:                    rb Item_Temp_Struct.size

; ---------------------------------------

GroundTarget_Temp_Struct:

; 0: disabled
; 1: enabled (alive)
; 2-19: explosion animation
; 20-36: item animation frames (get back to 20 when reaches 36)
; 40-60: 1000 points sprite animation
GroundTarget_Temp_Status:                  rb 1     

GroundTarget_Temp_X:                       rb 1
GroundTarget_Temp_Y:                       rb 1
GroundTarget_Temp_Y_Static:                rb 1     ; y coord ignoring scroll
GroundTarget_Temp_Pattern_0:               rb 1
GroundTarget_Temp_Pattern_1:               rb 1     ; not used
GroundTarget_Temp_Data_Current_Addr:       rw 1     ; not used
GroundTarget_Temp_SPRCOL_Addr:             rw 1     ; not used
GroundTarget_Temp_X1:                      rb 1     ; not used
GroundTarget_Temp_Y1:                      rb 1     ; not used
GroundTarget_Temp_Frame_Counter:           rw 1     ; not used (yet)
GroundTarget_Temp_Delta_X:                 rb 1     ; not used
GroundTarget_Temp_Delta_Y:                 rb 1     ; not used
GroundTarget_Temp_Health:                  rb 1     ; initialized at 10, dec at each shot received; 0 is dead
GroundTarget_Temp_Has_Item:                rb 1     ; 0: no item; 1: item
GroundTarget_Temp_Struct.size:        equ $ - GroundTarget_Temp_Struct



GroundTarget_0_Struct:                    rb GroundTarget_Temp_Struct.size
GroundTarget_1_Struct:                    rb GroundTarget_Temp_Struct.size
GroundTarget_2_Struct:                    rb GroundTarget_Temp_Struct.size
GroundTarget_3_Struct:                    rb GroundTarget_Temp_Struct.size
GroundTarget_4_Struct:                    rb GroundTarget_Temp_Struct.size
GroundTarget_5_Struct:                    rb GroundTarget_Temp_Struct.size

; ---------------------------------------

; sprite for the "blink" effect when an ground target gets hit
GroundTarget_Sprite:
.X:                                       rb 1
.Y:                                       rb 1
.PatternNumber:                           rb 1

; ---------------------------------------

LevelData_Temp_Struct:
LevelData_Temp_Counter:                     rw 1
LevelData_Temp_ActionType:                  rb 1
LevelData_Temp_Initial_X:                   rb 1
LevelData_Temp_Data_Initial_Addr:           rw 1
LevelData_Temp_EnemyStruct_Addr:            rw 1    ; TODO: rename to a more generic name like LevelData_Temp_ObjectStruct_Addr
LevelData_Temp_SPRCOL_Addr:                 rw 1
LevelData_Temp_EnemyShotStruct_Addr:        rw 1
LevelData_Temp_ExtraData_Addr:              rw 1    ; will hold Item Struct Addr, for enemy entries
LevelData_Temp_Item_Type:                   rb 1    ; item type for enemies (Item P or Bomb)
LevelData_Temp_Struct.size:         equ $ - LevelData_Temp_Struct

; info needed for EnemyShot:
; counter
; actiontype
; delta x addr (delta y will be delta x + N)
; enemy struct addr
; SPRCOL addr
; enemy shot struct addr


; ---------------------------------------

CurrentLevelNumber:                 rb 1

CurrentLevelFirstScreen:            rb 1
CurrentLevelLastScreen:             rb 1

LevelCounter:                       rw 1

LevelData_CurrentAddr:              rw 1


Screen_Y_Origin:                    rb 1            ; number of first line currently visible on screen


VerticalScroll:                     rb 1
CurrentMegaROMPage:                 rb 1
CurrentAddrLineScroll:              rw 1
CurrentVRAMAddrLineScroll:          rw 1

ItemAnimation_CurrentFrame:         rb 1

; ---------------------------------------

Temp_Addr:                  rw 1

; ---------------------------------------

;ayFX variables:
ayFX_Variables:
AYREGS:		    rb 14
ayFX_MODE:      rb 1 ;				; ayFX mode
ayFX_BANK:      rb 2 ;				; Current ayFX Bank
ayFX_PRIORITY:  rb 1 ;				; Current ayFX stream priotity
ayFX_POINTER:   rb 2 ;				; Pointer to the current ayFX stream
ayFX_TONE:      rb 2 ;				; Current tone of the ayFX stream
ayFX_NOISE:	    rb 1 ;				; Current noise of the ayFX stream
ayFX_VOLUME: 	rb 1 ;				; Current volume of the ayFX stream
ayFX_CHANNEL: 	rb 1 ;				; PSG channel to play the ayFX stream
ayFX_VT: 	    rb 2 ;				; ayFX relative volume table pointer
VARayFXEND:     rb 1 ; 
ayFX_Variables.size:     equ $ - ayFX_Variables



; ---------------------------------------

; some vars for debugging purposes

Debug_Temp_Byte:                 rb 1
Debug_Temp_Word:                 rw 1

FramesSkipped:                   rb 1

CurrentJiffy:                    rb 1





; ---------------------------------------

; TODO (canceled): put this buffer table aligned so you can INC only L, saving (128 * 2 = 256) cycles
; update: this buffer isn't used on gameplay anymore, only on Level title init animation (no need of performance there)
SPRATR_Buffer:      rb 32 * 4
.size:  equ $ - SPRATR_Buffer

; ---------------------------------------
CurrentLineBGPixels:  rb 16

; ---------------------------------------

; ConvertMsx2SpritesToSc11_Vars:
Pattern_0:             rb 1
Pattern_1:             rb 1
Color_0:               rb 1
Color_1:               rb 1
Bit_Pattern_0:         rb 1
Bit_Pattern_1:         rb 1
ConvertMsx2SpritesToSc11_Output:                rb 16*16

; ---------------------------------------

LevelInitAnimation_Counter:                      rb 1
LevelInitAnimation_Char_1_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_2_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_3_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_4_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_5_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_6_LookupTable_Addr:      rw 1
LevelInitAnimation_Counter_1:                    rb 1

; ---------------------------------------
; Stage clear animation vars
StageClearAnimationVars:

.CharCounter:           rb 1
.FrameCounter:          rb 1

.SPRATR_Address:        rw 1
.SPRPAT_Address:        rw 1
.SPRCOL_Address:        rw 1
.FontSprite_16x16_Addr: rw 1

; ---------------------------------------

GameOverAnimation_Vars:

.Counter:               rb 1

.sprite_0:              rb 6 * 32 ; yEnd, counterStart, xEnd, pattern number, look up table addr (word)

; ---------------------------------------

VDP_HMMM_Params_Buffer:
.Source_X:   rw    1 	    ; Source X (9 bits)
.Source_Y:   rw    1 	    ; Source Y (10 bits)
.Destiny_X:  rw    1 	    ; Destiny X (9 bits)
.Destiny_Y:  rw    1 	    ; Destiny Y (10 bits)
.Cols:       rw    1        ; number of cols (9 bits)
.Lines:      rw    1        ; number of lines (10 bits)
.NotUsed:    rb    1
.Options:    rb    1        ; select destination memory and direction from base coordinate
.Command:    rb    1

; ----------------------------------------

TitleScreen_Counter:  rb 1

TitleScreen_SpaceBarPressed:   rb 1

; vars for line interrupt routine:
Flag_LineInterrupt:	    rb 1        ; these two vars MUST be on sequential addresses 
Counter_LineInterrupt:	rb 1        ; this var MUST be imediately after Flag_LineInterrupt


Color_0_A:              rw 1
Color_0_B:              rw 1

LineNumberScreenSplit:  rb 1

; ----------------------------------------

PauseAnimation_Counter:     rb 1

PauseAnimation_SPRATR_Bkp:  rb 32 * 4
.size:  equ $ - PauseAnimation_SPRATR_Bkp

PauseAnimation_SPRPAT_Bkp:  rb 64 * 32 ; = 2048
.size:  equ $ - PauseAnimation_SPRPAT_Bkp

PauseAnimation_SPRCOL_Bkp:  rb 32 * 16 ; = 512
.size:  equ $ - PauseAnimation_SPRCOL_Bkp

PauseAnimation_TempAddr:    rw 1

; ----------------------------------------

UncompressedData:       rb 4 * 1024 ; 4 kb for uncompressed data buffer
.size: equ $ - UncompressedData

; ----------------------------------------

; vars for Choose Input Screen
CurrentVRAMpage:        rb 1 ; 0 or 1
CurrentFrameNumber:     rb 1
PlaneRotating_Data_CurrentFrame_Addr: rw 1