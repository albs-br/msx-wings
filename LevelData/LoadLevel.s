
; Level 1: pages 16 to 1
LEVEL_1_FIRST_SCREEN_PAGE:      equ 16 - 2  ; actually this is the third page, as level one goes from 16 to 1 pages (backwards)
LEVEL_1_LAST_SCREEN_PAGE:       equ 1

; Level 2: pages 32 to 17
LEVEL_2_FIRST_SCREEN_PAGE:      equ 32 - 2
LEVEL_2_LAST_SCREEN_PAGE:       equ 17

; Level 3: pages 63 to 33
LEVEL_3_FIRST_SCREEN_PAGE:      equ 63 - 2
LEVEL_3_LAST_SCREEN_PAGE:       equ 33

; Level 4: pages 94 to 64
LEVEL_4_FIRST_SCREEN_PAGE:      equ 94 - 2
LEVEL_4_LAST_SCREEN_PAGE:       equ 64

; Input: 
;   A: level number
LoadLevel:

    cp      1
    jp      z, .level_1
    cp      2
    jp      z, .level_2
    cp      3
    jp      z, .level_3
    cp      4
    jp      z, .level_4

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

.level_3:
    ld      a, LEVEL_3_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_3_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    jp      .continue

.level_4:
    ld      a, LEVEL_4_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_4_LAST_SCREEN_PAGE
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