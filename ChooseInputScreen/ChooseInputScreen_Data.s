PLANE_ROTATING_DATA_STRUCT_SIZE: equ 7
PlaneRotating_Data:
	;   +--- Megarom page number
	;   |                                          +--- Addr of zx0 packed frame data
	;   |                                          |                                    +--- image width in bytes (SC5)
	;   |                                          |                                    |   +--- image height in pixels
	;   |                                          |                                    |   |           +--- lines at top of screen before image (in bytes SC5)
	;   |                                          |                                    |   |           |
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_0    db 52, 71       dw 3 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_1    db 52, 72       dw 2 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_2    db 52, 71       dw 2 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_3    db 51, 69       dw 2 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_4    db 53, 67       dw 2 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_5    db 58, 63       dw 3 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_6    db 62, 59       dw 4 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_7    db 67, 55       dw 5 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_8    db 71, 51       dw 6 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_9    db 73, 52       dw 7 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_10   db 74, 52       dw 9 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_11   db 73, 52       dw 10 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_12   db 71, 51       dw 12 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_13   db 70, 51       dw 11 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_0    dw PlaneRotating_Images_0.frame_14   db 68, 49       dw 13 * 128
  
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_15   db 66, 48       dw 15 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_16   db 63, 46       dw 16 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_17   db 58, 45       dw 18 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_18   db 55, 45       dw 20 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_19   db 55, 47       dw 19 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_20   db 56, 47       dw 19 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_21   db 57, 47       dw 19 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_22   db 58, 47       dw 18 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_23   db 58, 47       dw 18 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_24   db 57, 47       dw 19 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_25   db 56, 47       dw 19 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_26   db 55, 46       dw 20 * 128  

  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_27   db 55, 45       dw 20 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_28   db 58, 45       dw 18 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_29   db 63, 46       dw 16 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_1    dw PlaneRotating_Images_1.frame_30   db 66, 48       dw 15 * 128

  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_31   db 68, 49       dw 13 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_32   db 70, 51       dw 11 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_33   db 71, 51       dw 9 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_34   db 73, 52       dw 7 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_35   db 74, 52       dw 6 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_36   db 73, 53       dw 4 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_37   db 71, 51       dw 3 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_38   db 67, 55       dw 2 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_39   db 62, 59       dw 2 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_40   db 58, 63       dw 1 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_41   db 53, 67       dw 0 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_42   db 51, 69       dw 0 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_43   db 52, 71       dw 0 * 128
  db CHOOSE_INPUT_SCREEN_DATA_MEGAROM_PAGE_2    dw PlaneRotating_Images_2.frame_44   db 52, 72       dw 0 * 128

.end: equ $

; TODO: X and width can be optimized (not really necessary, unpacking takes far longer)
ClearTopScreenArea_Page_0_HMMV_Parameters:    ; R#36 to R#46
   dw    0, 0+1 	    ; debug
   ; dw    0, 0 	    ; Destiny X (9 bits), Destiny Y (10 bits)
   dw    256, 75	; number of cols (9 bits), number of lines (10 bits)
   db    0x11       ; color of the fill
   db    0, VDP_COMMAND_HMMV

; TODO: X and width can be optimized (not really necessary, unpacking takes far longer)
ClearTopScreenArea_Page_1_HMMV_Parameters:    ; R#36 to R#46
   dw    0, 256+1	    ; debug
   ; dw    0, 256      ; Destiny X (9 bits), Destiny Y (10 bits)
   dw    256, 75	; number of cols (9 bits), number of lines (10 bits)
   db    0x11       ; color of the fill
   db    0, VDP_COMMAND_HMMV
