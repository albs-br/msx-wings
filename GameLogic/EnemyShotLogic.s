; Input
;   HL: addr of enemy shot struct
;   DE: addr of level data struct
EnemyShot_Init:
    ret



; Input
;   HL: addr of enemy shot struct
EnemyShot_Reset:
    xor     a
    ld      (hl), a     ; Status

    ; inc     hl
    ; ld      a, 255
    ; ld      (hl), a     ; X

    ; inc     hl
    ; ;ld      (hl), a     ; Y

    ; inc     hl
    ; ld      a, 192
    ; ld      (hl), a     ; Y static

    ; inc     hl
    ; ld      a, EMPTY_SPR_PAT_NUMBER
    ; ld      (hl), a     ; Pattern 0

    ; inc     hl
    ; ld      a, EMPTY_SPR_PAT_NUMBER
    ; ld      (hl), a     ; Pattern 1

    ret



; Input
;   HL: addr of enemy shot struct
EnemyShot_Logic:

    push    hl

        ; Copy enemy shot struct to temp enemy struct
        ;ld      hl, ?                                          ; source
        ld      de, EnemyShot_Temp_Struct                       ; destiny
        ld      bc, EnemyShot_Temp_Struct.size                  ; size
        ldir                                                    ; Copy BC bytes from HL to DE


; magic here


.return:
        ld      hl, EnemyShot_Temp_Struct                       ; source
    pop     de                                                  ; destiny
    ld      bc, EnemyShot_Temp_Struct.size                      ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret