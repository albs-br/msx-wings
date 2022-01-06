Player_X:                   rb 1
Player_Y:                   rb 1
Player_Y_Static:            rb 1 ; y coord ignoring scroll



VerticalScroll:             rb 1
CurrentMegaROMPage:         rb 1
CurrentAddrLineScroll:      rw 1
CurrentVRAMAddrLineScroll:  rw 1





SpriteAttrTableBuffer:      rb 32 * 4
.size:  equ $ - SpriteAttrTableBuffer
