Player_X:                           rb 1
Player_Y:                           rb 1
Player_Y_Static:                    rb 1 ; y coord ignoring scroll

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
Enemy_Temp_Y_Static:                rb 1 ; y coord ignoring scroll
Enemy_Temp_Struct.size:        equ $ - Enemy_Temp_Struct



Enemy_0_Struct:                    rb Enemy_Temp_Struct.size
Enemy_1_Struct:                    rb Enemy_Temp_Struct.size
Enemy_2_Struct:                    rb Enemy_Temp_Struct.size
Enemy_3_Struct:                    rb Enemy_Temp_Struct.size
Enemy_4_Struct:                    rb Enemy_Temp_Struct.size
Enemy_5_Struct:                    rb Enemy_Temp_Struct.size


; ---------------------------------------


LevelCounter:                       rw 1




VerticalScroll:             rb 1
CurrentMegaROMPage:         rb 1
CurrentAddrLineScroll:      rw 1
CurrentVRAMAddrLineScroll:  rw 1



; ---------------------------------------


SpriteAttrTableBuffer:      rb 32 * 4
.size:  equ $ - SpriteAttrTableBuffer
