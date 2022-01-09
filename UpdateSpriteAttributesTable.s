;       Screen sprites budget:
;       =====================
        
;       qty     range
;       5       0-4         Player plane (can be improved to only 4 by using a offset on sprites overlapping)
;       6       5-10        Player shots (3x 16x16 sprites for simple shots; 3x 32x16 for double shots)
;       14      11-24       Enemies (7x 16x16 or-color enemies; there will be many other combinations)
;       6       25-30       Enemy shots (6x 16x16 sprites)
        
;       1       31          free


PLAYER_SPR_PAT_0_NUMBER:                equ 0 * 4
PLAYER_SPR_PAT_1_NUMBER:                equ 1 * 4
PLAYER_SPR_PAT_2_NUMBER:                equ 2 * 4
PLAYER_SPR_PAT_3_NUMBER:                equ 3 * 4
PLAYER_SHOT_SPR_PAT_NUMBER:             equ 4 * 4
ENEMY_SPR_PAT_0_NUMBER:                 equ 5 * 4
ENEMY_SPR_PAT_1_NUMBER:                 equ 6 * 4
EMPTY_SPR_PAT_NUMBER:                   equ 63 * 4

UpdateSpriteAttributesTable:
    ld      hl, SpriteAttrTableBuffer


    ; Sprite # 0
    ld      a, (Player_Y)
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 1
    inc     hl
    ld      a, (Player_Y)
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 2
    inc     hl
    ld      a, (Player_Y)
    ld      b, 16
    add     a, b
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 3
    inc     hl
    ld      a, (Player_Y)
    ld      b, 16
    add     a, b
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 4
    inc     hl
    ld      a, (PlayerShot_0_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_0_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_0_Struct)        ; Status
    or      a
    ld      a, PLAYER_SHOT_SPR_PAT_NUMBER
    jp      nz, .sprite_4_continue          ; if (Status == 0) EMPTY_SPR_PAT_NUMBER else PLAYER_SHOT_SPR_PAT_NUMBER
    ld      a, EMPTY_SPR_PAT_NUMBER
.sprite_4_continue:
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 5
    inc     hl
    ld      a, (PlayerShot_1_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_1_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_1_Struct)        ; Status
    or      a
    ld      a, PLAYER_SHOT_SPR_PAT_NUMBER
    jp      nz, .sprite_5_continue          ; if (Status == 0) EMPTY_SPR_PAT_NUMBER else PLAYER_SHOT_SPR_PAT_NUMBER
    ld      a, EMPTY_SPR_PAT_NUMBER
.sprite_5_continue:
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 6
    inc     hl
    ld      a, (PlayerShot_2_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_2_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_2_Struct)        ; Status
    or      a
    ld      a, PLAYER_SHOT_SPR_PAT_NUMBER
    jp      nz, .sprite_6_continue          ; if (Status == 0) EMPTY_SPR_PAT_NUMBER else PLAYER_SHOT_SPR_PAT_NUMBER
    ld      a, EMPTY_SPR_PAT_NUMBER
.sprite_6_continue:
    ld      (hl), a

    inc     hl

; ================================== ENEMIES ===================================

; ----------------------------------------

    ; Sprite # 7
    inc     hl
    ld      a, (Enemy_0_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 8
    inc     hl
    ld      a, (Enemy_0_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 5)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; do copy from buffer to VRAM
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ; ld      b, SpriteAttrTableBuffer.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      bc, 0 + ((SpriteAttrTableBuffer.size * 256) + PORT_0)
    ld      hl, SpriteAttrTableBuffer
    otir




    ret