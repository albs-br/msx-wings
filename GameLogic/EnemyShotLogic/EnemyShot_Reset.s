; Input
;   HL: addr of enemy shot struct
EnemyShot_Reset:

    ; reset all struct fields
    push    hl
        ld      b, EnemyShot_Temp_Struct.size
        call    ClearRamArea
    pop     hl


    xor     a
    ld      (hl), a     ; Status

    inc     hl
    ld      a, 255
    ld      (hl), a     ; X

    inc     hl
    ;ld      a, 192      ; place sprite off screen
    ld      a, (VerticalScroll)     ; place sprite off screen
    add     192
    ld      (hl), a     ; Y

    inc     hl
    ld      a, 192
    ld      (hl), a     ; Y static

    inc     hl
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (hl), a     ; Pattern

    xor     a
    
    inc     hl          ; Delta_X_Current_Addr
    ld      (hl), a
    inc     hl
    ld      (hl), a

    inc     hl          ; Delta_Y_Current_Addr
    ld      (hl), a
    inc     hl
    ld      (hl), a

    inc     hl          ; SPRCOL_Addr
    ld      (hl), a
    inc     hl
    ld      (hl), a

    ret
