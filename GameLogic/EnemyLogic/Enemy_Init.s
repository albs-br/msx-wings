; ; Input
; ;   DE: addr of level data struct
; Enemy_Init_old:

;     ; init enemy / load some data from Level Data Struct to Enemy Struct

;     ; get enemy number from Level Data struct and point HL to the corresponding Enemy Struct
;     push    de
;         inc     de
;         inc     de
;         inc     de
;         inc     de
;         inc     de
;         inc     de
        
;         ; HL = EnemyStruct_Addr
;         ld      a, (de)
;         ld      l, a
;         inc     de
;         ld      a, (de)
;         ld      h, a

;         inc     de

;         ; BC = SPRCOL_Addr
;         ld      a, (de)
;         ld      c, a
;         inc     de
;         ld      a, (de)
;         ld      b, a

;     pop     de


;     ; Load enemy colors
;     push    bc
;         push    hl
;             ld      a, 0000 0001 b
;             ld      h, b
;             ld      l, c
;             call    SetVdp_Write
;             ;ld      b, SpriteColors_EnemyPlane_0_and_1.size
;             ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
;             ld      hl, SpriteColors_EnemyPlane_0_and_1
;             ;otir
;             ; 32x OUTI
;             outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
;             outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
;         pop     hl



;         IFDEF DEBUG
;             ; debug trap (get if an enemy is being initialized before its lifecycle ends)
;             ld      a, (hl)      ; get Status
;             cp      1
;         .debugTrap:
;             jp      z, .debugTrap
;         ENDIF    



;         ld      a, 1
;         ld      (hl), a     ; Status

;         inc     hl
;         ;ld      a, 128
;         ; get initial X coord from level data struct
;         inc     de
;         inc     de
;         inc     de
;         ld      a, (de)
;         ld      ixh, a
;         ld      (hl), a     ; X

;         inc     hl
;         ld      a, (Screen_Y_Origin)
;         ld      ixl, a
;         ld      (hl), a     ; Y

;         inc     hl
;         xor     a
;         ld      (hl), a     ; Y static

;         inc     hl
;         ld      a, ENEMY_SPR_PAT_0_NUMBER
;         ld      (hl), a     ; Pattern 0

;         inc     hl
;         ld      a, ENEMY_SPR_PAT_1_NUMBER
;         ld      (hl), a     ; Pattern 1

;         inc     hl
;         ; get  Delta X Initial Addr from level data struct
;         inc     de
;         ld      a, (de)
;         ld      (hl), a     ; Delta X Current Addr (low byte)

;         inc     hl
;         inc     de
;         ld      a, (de)
;         ld      (hl), a     ; Delta X Current Addr (high byte)

;         ; ex      de, hl
;         ;     ; Delta Y data is always n bytes after Delta X data. n = EnemyDeltaX_size
;         ;     ld      bc, EnemyDeltaX_size - 1        ; -1 to return to start of addr
;         ;     add     hl, bc
;         ; ex      de, hl

;     pop     bc

;     inc     hl
;     ld      (hl), c     ; SPRCOL Addr (low byte)

;     inc     hl
;     ld      (hl), b     ; SPRCOL Addr (high byte)

;     inc     hl
;     ld      a, ixh
;     ;add     1          ; X offset for sprite 1
;     ld      (hl), a     ; X1

;     inc     hl
;     ld      a, ixl
;     add     8           ; Y offset for sprite 1
;     ld      (hl), a     ; Y1

;     ret



; Input
;   DE: addr of level data struct
Enemy_Init:
    ; init Enemy / load some data from Level Data Struct to Enemy Struct

    ; Copy Level Data struct to temp Level Data struct
    ex      de, hl                                          ; HL receives addr of level data struct
    ;ld      hl, ?                                          ; source
    ld      de, LevelData_Temp_Struct                       ; destiny
    ld      bc, LevelData_Temp_Struct.size                  ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ; Copy Enemy struct to temp Enemy struct
    ld      hl, (LevelData_Temp_EnemyStruct_Addr)           ; source
    ld      de, Enemy_Temp_Struct                           ; destiny
    ld      bc, Enemy_Temp_Struct.size                      ; size
    ldir                                                    ; Copy BC bytes from HL to DE


    IFDEF DEBUG
        ; debug trap (get if an enemy is being initialized before its lifecycle ends)
        ld      a, (Enemy_Temp_Status)      ; get Status
        cp      1
    .debugTrap:
        jp      z, .debugTrap
    ENDIF    



    ; Load enemy colors
    ld      a, 0000 0001 b
    ld      hl, (LevelData_Temp_SPRCOL_Addr)
    ; ld      h, b
    ; ld      l, c
    call    SetVdp_Write
    ;ld      b, SpriteColors_EnemyPlane_0_and_1.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteColors_EnemyPlane_0_and_1
    ;otir
    ; 32x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


    ld      a, 1
    ld      (Enemy_Temp_Status), a     ; Status

    ; get initial X coord from level data struct
    ld      a, (LevelData_Temp_Initial_X)
    ld      (Enemy_Temp_X), a

    ;add     1          ; X offset for sprite 1
    ld      (Enemy_Temp_X1), a            ; X1

    ld      a, (Screen_Y_Origin)
    ld      (Enemy_Temp_Y), a

    add     8           ; Y offset for sprite 1
    ld      (Enemy_Temp_Y1), a            ; Y1

    xor     a
    ld      (Enemy_Temp_Y_Static), a      ; Y static

    ld      a, ENEMY_SPR_PAT_0_NUMBER
    ld      (Enemy_Temp_Pattern_0), a     ; Pattern 0

    ld      a, ENEMY_SPR_PAT_1_NUMBER
    ld      (Enemy_Temp_Pattern_1), a     ; Pattern 1

    ; get  Delta X Initial Addr from level data struct
    ld      hl, (LevelData_Temp_Delta_X_Initial_Addr)
    ld      (Enemy_Temp_Delta_X_Current_Addr), hl           ; Delta X addr

    ; Delta Y data is always n bytes after Delta X data. n = EnemyDeltaX_size
    ld      bc, EnemyDeltaX_size
    add     hl, bc
    ld      (Enemy_Temp_Delta_Y_Current_Addr), hl           ; Delta Y addr



    ld      hl, (LevelData_Temp_SPRCOL_Addr)
    ld      (Enemy_Temp_SPRCOL_Addr), hl




.return:

    ld      hl, Enemy_Temp_Struct                               ; source
    ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, Enemy_Temp_Struct.size                          ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret
