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
    call    LoadFirstScreen

    ld      a, LEVEL_1_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    jp      .continue

.level_2:
    ld      a, LEVEL_2_FIRST_SCREEN_PAGE
    call    LoadFirstScreen

    ld      a, LEVEL_2_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    jp      .continue

.continue:


    ret