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
