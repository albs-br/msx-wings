PLANE_ROTATING_DATA_STRUCT_SIZE: equ 6
PlaneRotating_Data:
	;   +--- Megarom page number
	;   |+--- Addr of zx0 packed frame data
	;   ||                                  +--- image width in bytes (SC5)
	;   ||                                  |   +--- image height in pixels
	;   ||                                  |   |           +--- lines at top of screen before image (in bytes SC5)
	;   ||                                  |   |           |
  dw    PlaneRotating_Images_0.frame_0    db 52, 71       dw 3 * 128
  dw    PlaneRotating_Images_0.frame_1    db 52, 72       dw 2 * 128
  dw    PlaneRotating_Images_0.frame_2    db 52, 71       dw 2 * 128
  dw    PlaneRotating_Images_0.frame_3    db 51, 69       dw 2 * 128
  dw    PlaneRotating_Images_0.frame_4    db 53, 67       dw 2 * 128
  dw    PlaneRotating_Images_0.frame_5    db 58, 63       dw 3 * 128
  dw    PlaneRotating_Images_0.frame_6    db 62, 59       dw 4 * 128
  dw    PlaneRotating_Images_0.frame_7    db 67, 55       dw 5 * 128
  dw    PlaneRotating_Images_0.frame_8    db 71, 51       dw 6 * 128
  dw    PlaneRotating_Images_0.frame_9    db 73, 52       dw 7 * 128
  dw    PlaneRotating_Images_0.frame_10   db 74, 52       dw 9 * 128
  dw    PlaneRotating_Images_0.frame_11   db 73, 52       dw 10 * 128
  dw    PlaneRotating_Images_0.frame_12   db 71, 51       dw 12 * 128
  
.end: equ $

; TODO: X and width can be optimized (not really necessary, unpacking takes far longer)
ClearTopScreenArea_Page_0_HMMV_Parameters:    ; R#36 to R#46
   dw    0, 0 	    ; Destiny X (9 bits), Destiny Y (10 bits)
   dw    256, 75	; number of cols (9 bits), number of lines (10 bits)
   db    0x11       ; color of the fill
   db    0, VDP_COMMAND_HMMV

; TODO: X and width can be optimized (not really necessary, unpacking takes far longer)
ClearTopScreenArea_Page_1_HMMV_Parameters:    ; R#36 to R#46
   dw    0, 256	    ; Destiny X (9 bits), Destiny Y (10 bits)
   dw    256, 75	; number of cols (9 bits), number of lines (10 bits)
   db    0x11       ; color of the fill
   db    0, VDP_COMMAND_HMMV
