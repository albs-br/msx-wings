Seed:                               rw 1



Player_X:                           rb 1
Player_Y:                           rb 1
Player_Y_Static:                    rb 1 ; y coord ignoring scroll

Player_Shot_Level:                  rb 1
Player_Shot_Width:                  rb 1

Player_SideMovementCounter:         rb 1 ; 128: center, < 128: left, > 128: right
Player_SpritePatternNumber:         rb 1

Player_Spr3_Offset_X:               rb 1

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
                                            ; otherwise stores the Item Struct Addr (should have the same index as the enemy)
Enemy_Temp_Struct.size:        equ $ - Enemy_Temp_Struct



Enemy_0_Struct:                    rb Enemy_Temp_Struct.size
Enemy_1_Struct:                    rb Enemy_Temp_Struct.size
Enemy_2_Struct:                    rb Enemy_Temp_Struct.size
Enemy_3_Struct:                    rb Enemy_Temp_Struct.size
Enemy_4_Struct:                    rb Enemy_Temp_Struct.size
Enemy_5_Struct:                    rb Enemy_Temp_Struct.size
Enemy_6_Struct:                    rb Enemy_Temp_Struct.size


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
GroundTarget_Temp_Status:                  rb 1     ; 0: disabled, 1: enabled (alive), 2-19: explosion animation, 20-36: item animation frames (get back to 20 when reaches 36)
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
LevelData_Temp_ExtraData_Addr:              rw 1    ; will hold Item Struct Adrr, for enemy entries
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

; TODO: put this buffer table aligned so you can INC only L, saving (128 * 2 = 256) cycles
SPRATR_Buffer:      rb 32 * 4
.size:  equ $ - SPRATR_Buffer

; ---------------------------------------
CurrentLineBGPixels:  rb 16

; ---------------------------------------

; ConvertMsx2SpritesToSc11_Vars:
; .Pattern_0:             rb 1
; .Pattern_1:             rb 1
; .Bit_Pattern_0:         rb 1
; .Bit_Pattern_1:         rb 1

; ConvertMsx2SpritesToSc11_Vars:
Pattern_0:             rb 1
Pattern_1:             rb 1
Color_0:               rb 1
Color_1:               rb 1
Bit_Pattern_0:         rb 1
Bit_Pattern_1:         rb 1
ConvertMsx2SpritesToSc11_Output:                rb 16*16

; ---------------------------------------

LevelInitAnimation_Counter:     rb 1
LevelInitAnimation_Char_1_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_2_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_3_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_4_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_5_LookupTable_Addr:      rw 1
LevelInitAnimation_Char_6_LookupTable_Addr:      rw 1
LevelInitAnimation_Counter_1:     rb 1

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
