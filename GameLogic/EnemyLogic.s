ENEMY_PIXELS_PER_MOV:    equ 3


; Input
;   HL: addr of enemy struct
;   DE: addr of level data struct
Enemy_Init:

    ; init enemy / load some data from Level Data Struct to Enemy Struct

    ld      a, 1
    ld      (hl), a     ; Status

    inc     hl
    ;ld      a, 128
    ; get initial X coord from level data struct
    inc     de
    inc     de
    inc     de
    ld      a, (de)
    ld      (hl), a     ; X

    inc     hl
    ld      a, (Screen_Y_Origin)
    ld      (hl), a     ; Y

    inc     hl
    xor     a
    ld      (hl), a     ; Y static

    inc     hl
    ld      a, ENEMY_SPR_PAT_0_NUMBER
    ld      (hl), a     ; Pattern 0

    inc     hl
    ld      a, ENEMY_SPR_PAT_1_NUMBER
    ld      (hl), a     ; Pattern 1

    ret



; Input
;   HL: addr of enemy struct
Enemy_Reset:
    xor     a
    ld      (hl), a     ; Status

    inc     hl
    ld      a, 255
    ld      (hl), a     ; X

    inc     hl
    ;ld      (hl), a     ; Y

    inc     hl
    ld      a, 192
    ld      (hl), a     ; Y static

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; Pattern 0

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; Pattern 1

    ret



; Input
;   HL: addr of enemy struct
Enemy_Logic:
    ld      a, (hl)                 ; get Status
    or      a
    ret     z                       ; if (Status == 0) ret

    inc     hl
    inc     hl
    inc     hl
    ld      a, (hl)                 ; Y static
    cp      192
    jp      nc, .enemyReset          ; if (Y >= 192) enemyReset
    add     ENEMY_PIXELS_PER_MOV
    ld      (hl), a


    dec     hl
    ld      a, (hl)                 ; Y
    add     ENEMY_PIXELS_PER_MOV
    ld      (hl), a

    ret

.enemyReset:
    dec     hl                      ; back to start of struct
    dec     hl
    dec     hl
    call    Enemy_Reset
    ret
