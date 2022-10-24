;     ; 4 high bits: color index from palette
;     ; 4 low bits: 1000 (set pixel to RGB palette instead of YJK)
;     ; 0x00: transparent (repeat background)
GroundTargetDestroyed:
    db         0,    0,    0,    0,    0,    0, 0x28, 0x68,    0, 0x68,    0, 0x68,    0, 0x68,    0,    0
    db         0,    0,    0,    0, 0x28,    0, 0x68,    0, 0x38, 0x68, 0x68, 0x68, 0x28,    0,    0,    0
    db         0,    0, 0x38,    0, 0x68, 0x68, 0x38,    0, 0x68, 0x68, 0x68, 0x68,    0, 0x68,    0,    0
    db         0,    0, 0x68, 0x68, 0x68, 0x68, 0x68, 0x28, 0x68, 0x68, 0x38, 0x68, 0x68,    0, 0x68,    0
    db         0, 0x68,    0, 0x68, 0x38, 0x68, 0x68, 0x68, 0x68, 0x68,    0, 0x68, 0x68, 0x38,    0,    0
    db         0, 0x68, 0x68,    0, 0x68, 0x68, 0x28, 0x68, 0x68, 0x68, 0x68, 0x68, 0x28, 0x68, 0x68,    0
    db      0x38, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x28, 0x68, 0x38, 0x68,    0, 0x68, 0x68
    db      0x68,    0, 0x28, 0x68, 0x68, 0x68, 0x68, 0x28, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68,    0
    
    db         0, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68 
    db      0x68,    0, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x28, 0x68, 0x68, 0x68, 0x38, 0x68,    0 
    db      0x68, 0x68, 0x38, 0x68, 0x68, 0x68, 0x28, 0x68, 0x68, 0x68, 0x68, 0x68,    0, 0x68, 0x68,    0
    db         0,    0, 0x68, 0x68,    0, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68,    0,    0
    db      0x28,    0,    0, 0x68, 0x68, 0x68, 0x38, 0x68, 0x68,    0, 0x68, 0x68,    0,    0, 0x68,    0
    db         0, 0x68,    0, 0x68,    0, 0x68, 0x68, 0x68, 0x68, 0x68, 0x68,    0, 0x28,    0,    0,    0
    db         0,    0,    0,    0, 0x68,    0,    0, 0x68, 0x68, 0x68,    0, 0x68,    0,    0,    0,    0
    db         0,    0,    0, 0x68,    0, 0x68,    0,    0, 0x68,    0, 0x38,    0,    0,    0,    0,    0




; char '$' (6x8):

; 011100
; 101010
; 101000
; 011100
; 001010
; 101010
; 011100

; 000010
; 010101
; 010111
; 100010
; 010101
; 010101
; 100011
; 011110
GroundTargetDestroyed_Dollar_0:
    db   0x68,   0xd8,   0xd8,   0xd8,   0x38,  0x68
    db   0xd8,   0x38,   0xd8,   0x38,   0xd8,  0x38
    db   0xd8,   0x38,   0xd8,   0x38,   0x38,  0x38
    db   0x38,   0xd8,   0xd8,   0xd8,   0x38,  0x68
    db   0x68,   0x38,   0xd8,   0x38,   0xd8,  0x38
    db   0xd8,   0x38,   0xd8,   0x38,   0xd8,  0x38
    db   0x38,   0xd8,   0xd8,   0xd8,   0x38,  0x38
    db   0x68,   0x38,   0x38,   0x38,   0x38,  0x68

; ; ------ color 0
; 	db	0x0d
; 	db	0x0d
; 	db	0x08
; 	db	0x08
; 	db	0x0c
; 	db	0x0c
; 	db	0x04
; 	db	0x04
; 	db	0x08
; 	db	0x08
; 	db	0x08
; 	db	0x08
; 	db	0x08
; 	db	0x08
; 	db	0x08
; 	db	0x08
; ; ------ color 1
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03
; 	db	0x03