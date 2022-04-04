; Input
;   HL: addr of enemy shot struct
EnemyShot_Logic:

    ; check status before copying to temp vars to save cycles when disabled
    ld      a, (hl)     ; get Status
    or      a
    ret     z           ; if (Status == 0) ret

    ; set MegaROM page for Enemy Shot data
    ld      a, ENEMY_SHOT_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    push    hl

        ; Copy enemy shot struct to temp enemy shot struct
        ;ld      hl, ?                                          ; source
        ld      de, EnemyShot_Temp_Struct                       ; destiny
        ld      bc, EnemyShot_Temp_Struct.size                  ; size
        ldir                                                    ; Copy BC bytes from HL to DE


        ; ld      a, (EnemyShot_Temp_Status)      ; get Status
        ; or      a
        ; jp      z, .return                      ; if (Status == 0) ret

        ; --------------------------- enemy shot movement -------------------------

        ; Delta X
        ld      hl, (EnemyShot_Temp_Delta_X_Current_Addr)                 ; Delta X
        ; ld      a, l
        ; or      h                       ; if (Delta X addr == 0) ----  not necessary, as Delta X is mandatory
        ; jp      z, .ignoreDeltaX
        
        ld      b, (hl)                 ; get delta X value
        ld      a, (EnemyShot_Temp_X)   ; get current X value
        add     a, b                    ; add to delta X
        ; test if sides of screen were reached
        or      a
        jp      z, .enemyShotReset
        cp      255
        jp      z, .enemyShotReset
        ld      (EnemyShot_Temp_X), a   ; save it

        inc     hl                      ; next Delta X addr
        ld      (EnemyShot_Temp_Delta_X_Current_Addr), hl
        
        ; Delta Y
        ld      hl, (EnemyShot_Temp_Delta_Y_Current_Addr)                 ; Delta Y

        ld      a, (EnemyShot_Temp_Y_Static)    ; get current Y static value
        cp      192
        jp      nc, .enemyShotReset             ; if (Y_Static >= 192) enemyShotReset

        ld      b, (hl)                         ; get delta Y value
        add     a, b                            ; add to delta Y
        ld      (EnemyShot_Temp_Y_Static), a

        ld      a, (EnemyShot_Temp_Y)           ; Y
        add     a, b
        ld      (EnemyShot_Temp_Y), a

        inc     hl                      ; next Delta Y addr
        ld      (EnemyShot_Temp_Delta_Y_Current_Addr), hl

    ; .ignoreDeltaX:

        ; --------------------------- pattern/color cycling of enemy shot --------------

    .patternAndColorCycling:
 ;jp .checkCollision ; debug

        ld      a, (BIOS_JIFFY)
        
        and     0000 0011 b
        ; and     0000 1100 b
        ; srl     a
        ; srl     a

        
        dec     a
        jp      z, .enemyShotColor_0    ; if (A == 1) enemyShotColor_0
        dec     a
        jp      z, .enemyShotColor_1    ; if (A == 2) enemyShotColor_1
                                        ; else enemyShotColor_3

    ;.enemyShotColor_3:
        ; Load enemy colors
        ld      a, 0000 0001 b
        ld      hl, (EnemyShot_Temp_SPRCOL_Addr)
        call    SetVdp_Write
        ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
        ld      hl, SpriteColors_EnemyShot_0_to_2 + 32
        ; 8x OUTI (only first 8 lines are necessary)
        outi outi outi outi outi outi outi outi

        ld      a, ENEMY_SHOT_SPR_PAT_0_NUMBER
        ld      (EnemyShot_Temp_Pattern), a

        jp      .checkCollision

    .enemyShotColor_0:
        ; Load enemy colors
        ld      a, 0000 0001 b
        ld      hl, (EnemyShot_Temp_SPRCOL_Addr)
        call    SetVdp_Write
        ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
        ld      hl, SpriteColors_EnemyShot_0_to_2
        ; 8x OUTI (only first 8 lines are necessary)
        outi outi outi outi outi outi outi outi

        ld      a, ENEMY_SHOT_SPR_PAT_1_NUMBER
        ld      (EnemyShot_Temp_Pattern), a

        jp      .checkCollision

    .enemyShotColor_1:
        ; Load enemy colors
        ld      a, 0000 0001 b
        ld      hl, (EnemyShot_Temp_SPRCOL_Addr)
        call    SetVdp_Write
        ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
        ld      hl, SpriteColors_EnemyShot_0_to_2 + 16
        ; 8x OUTI (only first 8 lines are necessary)
        outi outi outi outi outi outi outi outi

        ld      a, ENEMY_SHOT_SPR_PAT_1_NUMBER
        ld      (EnemyShot_Temp_Pattern), a

        ; --------------------------- check collision  -------------------------

    .checkCollision:

        ld      a, (EnemyShot_Temp_X)
        ;add     2
        ld      b, a
        ld      a, (EnemyShot_Temp_Y_Static)
        ;add     2
        ld      c, a

        ld      a, (Player_X)
        add     2                           ; adjust the 16x16 collision box to the center of the plane
        ld      d, a
        ld      a, (Player_Y_Static)
        add     12                          ; adjust the 16x16 collision box to the center of the plane
        ld      e, a

        call    CheckCollision_8x8_16x16
        jp      c, .playerHit

        jp      .return

    .playerHit:
        ;jp .playerHit ; debug
        ; ld      b, 30       ; 1/2 second
        ; call    Wait_B_Vblanks
        jp      .enemyShotReset

    .enemyShotReset:

        ld      hl, EnemyShot_Temp_Struct
        call    EnemyShot_Reset
        jp      .return

.return:
        ld      hl, EnemyShot_Temp_Struct                       ; source
    pop     de                                                  ; destiny
    ld      bc, EnemyShot_Temp_Struct.size                      ; size
    ldir                                                        ; Copy BC bytes from HL to DE


    ret
