; MegaROM pages at 0x8000

; ------- Page 1
	org	0x8000, 0xBFFF
;ImageData_1:
    INCBIN "Graphics/Bitmaps/level1_0.sra.new"
    ; INCBIN "Images/level1-bg2_0.sra.new"
;.size:      equ $ - ImageData_1
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 2
	org	0x8000, 0xBFFF
;ImageData_2:
    INCBIN "Graphics/Bitmaps/level1_1.sra.new"
    ;INCBIN "Images/level1-bg2_1.sra.new"
;.size:      equ $ - ImageData_2
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 3
	org	0x8000, 0xBFFF
;ImageData_3:
    INCBIN "Graphics/Bitmaps/level1_2.sra.new"
    ;INCBIN "Images/level1-bg2_2.sra.new"
;.size:      equ $ - ImageData_3
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 4
	org	0x8000, 0xBFFF
;ImageData_4:
    INCBIN "Graphics/Bitmaps/level1_3.sra.new"
    ;INCBIN "Images/level1-bg2_3.sra.new"
;.size:      equ $ - ImageData_4
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 5
	org	0x8000, 0xBFFF
;ImageData_5:
    INCBIN "Graphics/Bitmaps/level1_4.sra.new"
    ;INCBIN "Images/level1-bg2_4.sra.new"
;.size:      equ $ - ImageData_5
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 6
	org	0x8000, 0xBFFF
;ImageData_6:
    INCBIN "Graphics/Bitmaps/level1_5.sra.new"
    ;INCBIN "Images/level1-bg2_5.sra.new"
;.size:      equ $ - ImageData_6
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 7
	org	0x8000, 0xBFFF
;ImageData_7:
    INCBIN "Graphics/Bitmaps/level1_6.sra.new"
    ;INCBIN "Images/level1-bg2_6.sra.new"
;.size:      equ $ - ImageData_7
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 8
	org	0x8000, 0xBFFF
;ImageData_8:
    INCBIN "Graphics/Bitmaps/level1_7.sra.new"
    ;INCBIN "Images/level1-bg2_7.sra.new"
;.size:      equ $ - ImageData_8
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 9
	org	0x8000, 0xBFFF
;ImageData_9:
    INCBIN "Graphics/Bitmaps/level1_8.sra.new"
    ;INCBIN "Images/level1-bg2_8.sra.new"
;.size:      equ $ - ImageData_9
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 10
	org	0x8000, 0xBFFF
;ImageData_10:
    INCBIN "Graphics/Bitmaps/level1_9.sra.new"
    ;INCBIN "Images/level1-bg2_9.sra.new"
;.size:      equ $ - ImageData_10
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 11
	org	0x8000, 0xBFFF
;ImageData_11:
    INCBIN "Graphics/Bitmaps/level1_10.sra.new"
    ;INCBIN "Images/level1-bg2_10.sra.new"
;.size:      equ $ - ImageData_11
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 12
	org	0x8000, 0xBFFF
;ImageData_12:
    INCBIN "Graphics/Bitmaps/level1_11.sra.new"
    ;INCBIN "Images/level1-bg2_11.sra.new"
;.size:      equ $ - ImageData_12
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 13
	org	0x8000, 0xBFFF
;ImageData_13:
    INCBIN "Graphics/Bitmaps/level1_12.sra.new"
    ;INCBIN "Images/level1-bg2_12.sra.new"
;.size:      equ $ - ImageData_13
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 14
	org	0x8000, 0xBFFF
;ImageData_14:
    INCBIN "Graphics/Bitmaps/level1_13.sra.new"
    ;INCBIN "Images/level1-bg2_13.sra.new"
;.size:      equ $ - ImageData_14
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 15
	org	0x8000, 0xBFFF
;ImageData_15:
    INCBIN "Graphics/Bitmaps/level1_14.sra.new"
    ;INCBIN "Images/level1-bg2_14.sra.new"
;.size:      equ $ - ImageData_15
	ds PAGE_SIZE - ($ - 0x8000), 255

; ------- Page 16
	org	0x8000, 0xBFFF
;ImageData_16:
    INCBIN "Graphics/Bitmaps/level1_15.sra.new"
    ;INCBIN "Images/level1-bg2_15.sra.new"
;.size:      equ $ - ImageData_16
	ds PAGE_SIZE - ($ - 0x8000), 255
