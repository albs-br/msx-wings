LEVEL_1_FIRST_SCREEN_PAGE:      equ 14
LEVEL_1_LAST_SCREEN_PAGE:       equ 1

LEVEL_2_FIRST_SCREEN_PAGE:      equ 30
LEVEL_2_LAST_SCREEN_PAGE:       equ 17

; Input: 
;   A: level number
LoadLevel:

    cp      1
    jp      z, .level_1
    cp      2
    jp      z, .level_2

.level_1:
    ld      a, LEVEL_1_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_1_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    jp      .continue

.level_2:
    ld      a, LEVEL_2_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_2_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    jp      .continue

.continue:

    ; Pre-load all level pages (for sd mapper users, otherwise there will 
    ; be a lag every time a page is read for the first time)

    ld      hl, CurrentLevelLastScreen
    ld      a, (CurrentLevelFirstScreen)
.loop:
    ld	    (Seg_P8000_SW), a

    dec     a
    cp      (hl)

    jp      nz, .loop

    ret