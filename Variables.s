Player_X:                           rb 1
Player_Y:                           rb 1
Player_Y_Static:                    rb 1 ; y coord ignoring scroll

Player_SideMovementCounter:         rb 1 ; 128: center, < 128: left 128 0: right
Player_SpritePatternNumber:         rb 1

Player_Spr3_Offset_X:               rb 1

; ---------------------------------------

PlayerShot_Temp_Struct:
PlayerShot_Temp_Status:                  rb 1    
PlayerShot_Temp_X:                       rb 1
PlayerShot_Temp_Y:                       rb 1
PlayerShot_Temp_Y_Static:                rb 1 ; y coord ignoring scroll
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
Enemy_Temp_Status:                  rb 1    
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

LevelData_Temp_Struct:
LevelData_Temp_Counter:                     rw 1
LevelData_Temp_ActionType:                  rb 1
LevelData_Temp_Initial_X:                   rb 1
LevelData_Temp_Data_Initial_Addr:           rw 1
LevelData_Temp_EnemyStruct_Addr:            rw 1
LevelData_Temp_SPRCOL_Addr:                 rw 1
LevelData_Temp_EnemyShotStruct_Addr:        rw 1
LevelData_Temp_Struct.size:         equ $ - LevelData_Temp_Struct

; info needed for EnemyShot:
; counter
; actiontype
; delta x addr (delta y will be delta x + N)
; enemy struct addr
; SPRCOL addr
; enemy shot struct addr


; ---------------------------------------

CurrentLevelLastScreen:             rb 1

LevelCounter:                       rw 1

LevelData_CurrentAddr:              rw 1


Screen_Y_Origin:                    rb 1            ; number of first line currently visible on screen


VerticalScroll:             rb 1
CurrentMegaROMPage:         rb 1
CurrentAddrLineScroll:      rw 1
CurrentVRAMAddrLineScroll:  rw 1

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

Debug_Temp_Byte:                 rb 1
Debug_Temp_Word:                 rw 1

FramesSkipped:                   rb 1

CurrentJiffy:                    rb 1





; ---------------------------------------


SpriteAttrTableBuffer:      rb 32 * 4
.size:  equ $ - SpriteAttrTableBuffer
