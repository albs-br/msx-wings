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
PlayerShot_3_Struct:                    rb PlayerShot_Temp_Struct.size
PlayerShot_4_Struct:                    rb PlayerShot_Temp_Struct.size
PlayerShot_5_Struct:                    rb PlayerShot_Temp_Struct.size


; ---------------------------------------

VerticalScroll:             rb 1
CurrentMegaROMPage:         rb 1
CurrentAddrLineScroll:      rw 1
CurrentVRAMAddrLineScroll:  rw 1



; ---------------------------------------


SpriteAttrTableBuffer:      rb 32 * 4
.size:  equ $ - SpriteAttrTableBuffer
