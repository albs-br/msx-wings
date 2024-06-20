SFX_EXPLOSION:          equ 0
SFX_SHOT:               equ 1
SFX_GET_ITEM:           equ 2
SFX_GET_DOLLAR_ITEM:    equ 3

;TODO:
; SFX_PAUSE:              equ ?
; SFX_ENEMY_SHOT:         equ ?

SOUND_BANK:
; MsxWingsSfx_Bank:
    INCBIN "Sound/Sfx/MsxWingsSfx_Bank.afb"

; --------------------------

MUSIC_EMPTY:            equ 0
MUSIC_SHUFFLE_ONE:      equ 1
MUSIC_YOU_WIN_1:        equ 2

SONG_TABLE:
	dw	.empty
	dw	.ShuffleOne
	dw	.YouWin1
.empty:
	incbin	"Sound/Music/empty.pt3"
.ShuffleOne:
	incbin	"Sound/Music/RUN23_ShuffleOne.pt3"
.YouWin1:
	incbin	"Sound/Music/RUN23_YouWin1.pt3"
