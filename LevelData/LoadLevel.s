
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

; Level 5: pages 135 to 95
LEVEL_5_FIRST_SCREEN_PAGE:      equ 135 - 2
LEVEL_5_LAST_SCREEN_PAGE:       equ 95

; Level 6: pages 176 to 136
LEVEL_6_FIRST_SCREEN_PAGE:      equ 176 - 2
LEVEL_6_LAST_SCREEN_PAGE:       equ 136

; Level 7: pages 217 to 177
LEVEL_7_FIRST_SCREEN_PAGE:      equ 217 - 2
LEVEL_7_LAST_SCREEN_PAGE:       equ 177

; Level 8: pages 241 to 218
LEVEL_8_FIRST_SCREEN_PAGE:      equ 241 - 2
LEVEL_8_LAST_SCREEN_PAGE:       equ 218

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
    cp      5
    jp      z, .level_5
    cp      6
    jp      z, .level_6
    cp      7
    jp      z, .level_7
    cp      8
    jp      z, .level_8

.level_1:
    ld      a, LEVEL_1_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_1_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_1_Data
    ld      (LevelData_CurrentAddr), hl

    jp      .continue

.level_2:
    ld      a, LEVEL_2_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_2_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_2_Data
    ld      (LevelData_CurrentAddr), hl

    jp      .continue

.level_3:
    ld      a, LEVEL_3_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_3_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_1_Data ; TODO: fix
    ld      (LevelData_CurrentAddr), hl

    jp      .continue

.level_4:
    ld      a, LEVEL_4_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_4_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_1_Data ; TODO: fix
    ld      (LevelData_CurrentAddr), hl

    jp      .continue

.level_5:
    ld      a, LEVEL_5_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_5_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_1_Data ; TODO: fix
    ld      (LevelData_CurrentAddr), hl

    jp      .continue

.level_6:
    ld      a, LEVEL_6_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_6_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_1_Data ; TODO: fix
    ld      (LevelData_CurrentAddr), hl

    jp      .continue

.level_7:
    ld      a, LEVEL_7_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_7_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_1_Data ; TODO: fix
    ld      (LevelData_CurrentAddr), hl

    jp      .continue

.level_8:
    ld      a, LEVEL_8_FIRST_SCREEN_PAGE
    ld      (CurrentLevelFirstScreen), a
    call    LoadFirstScreen

    ld      a, LEVEL_8_LAST_SCREEN_PAGE
    ld      (CurrentLevelLastScreen), a

    ld      hl, Level_1_Data ; TODO: fix
    ld      (LevelData_CurrentAddr), hl

    ;jp      .continue

.continue:

    ; Pre-load all level pages (for sd mapper users, otherwise there would 
    ; be a lag every time a page is read for the first time)

    ld      hl, CurrentLevelLastScreen
    ld      a, (CurrentLevelFirstScreen)
.loop:
    ld	    (Seg_P8000_SW), a

    dec     a
    cp      (hl)

    jp      nz, .loop

    ret



; NextLevel:

;     ld      a, (CurrentLevelNumber)
;     inc     a
;     ld      (CurrentLevelNumber), a

;     call    BIOS_DISSCR

;     call    LoadLevel

;     call    BIOS_ENASCR


;     jp      Execute.gameLoop