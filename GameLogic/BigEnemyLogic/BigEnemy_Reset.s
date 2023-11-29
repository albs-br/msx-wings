; Input
;   HL: addr of big enemy struct
BigEnemy_Reset:

    ; reset all struct fields
    push    hl
        ld      b, BigEnemy_Temp_Struct.size
        call    ClearRamArea
    pop     hl


    xor     a
    ld      (hl), a     ; Status
    inc     hl

    ld      a, 255
    ld      (hl), a     ; X
    inc     hl

    ld      e, a      ; save value for all X's

    ld      a, (VerticalScroll)     ; place sprite off screen
    add     192
    ld      (hl), a     ; Y
    inc     hl

    ld      d, a      ; save value for all Y's

    ld      a, 192
    ld      (hl), a     ; Y static
    inc     hl


    ; skip words BigEnemy_Temp_Data_Current_Addr and BigEnemy_Temp_SPRCOL_Addr
    ld      bc, 4
    add     hl, bc


    ; reset (X,Y) coords of sprites # 1 to 6
    ld      b, 6    ; there are 6 (X,Y) pairs
.loop:
    ld      (hl), e     ; X
    inc     hl
    ld      (hl), d     ; Y
    inc     hl
    djnz    .loop


    ; reset sprites patterns of all 7 sprites
    ld      b, 7    ; there are 7 patterns
    ld      a, EMPTY_SPR_PAT_NUMBER
.loop_1:
    ld      (hl), a     ; Pattern
    inc     hl
    djnz    .loop_1


    ret
