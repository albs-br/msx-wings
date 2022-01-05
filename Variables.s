Player_X:                   rb 1
Player_Y:                   rb 1



VerticalScroll:             rb 1
CurrentMegaROMPage:         rb 1
CurrentAddrLineScroll:      rw 1
CurrentVRAMAddrLineScroll:  rw 1





SpriteAttrTableBuffer:      rb 32 * 4
.size:  equ $ - SpriteAttrTableBuffer
