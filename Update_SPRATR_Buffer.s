;       Screen sprites budget:
;       =====================

;       qty     range
;       4       0-3         Player plane (can be improved to only 4 by using a offset on sprites overlapping)
;       6       4-9        Player shots (3x 16x16 sprites for simple shots; 3x 32x16 for double shots)
;       14      10-23       Enemies (7x 16x16 two or-color sprites enemies; there will be many other combinations)
;       7       24-30       Enemy shots (7x 16x16 single sprites)


PLAYER_SPR_PAT_0_NUMBER:                equ 0 * 4
PLAYER_SPR_PAT_1_NUMBER:                equ 1 * 4
PLAYER_SPR_PAT_2_NUMBER:                equ 2 * 4
PLAYER_SPR_PAT_3_NUMBER:                equ 3 * 4
PLAYER_SHOT_SPR_PAT_NUMBER:             equ 4 * 4

ENEMY_FRAME_0_SPR_PAT_0_NUMBER:         equ 5 * 4       ; offset x1: 0, offset y1: 8
;ENEMY_FRAME_0_SPR_PAT_1_NUMBER:         equ 6 * 4
ENEMY_FRAME_1_SPR_PAT_0_NUMBER:         equ 12 * 4
ENEMY_FRAME_2_SPR_PAT_0_NUMBER:         equ 14 * 4
ENEMY_FRAME_3_SPR_PAT_0_NUMBER:         equ 16 * 4
ENEMY_FRAME_4_SPR_PAT_0_NUMBER:         equ 18 * 4
ENEMY_FRAME_5_SPR_PAT_0_NUMBER:         equ 20 * 4

EXPLOSION_SPR_PAT_0_NUMBER:             equ 7 * 4
EXPLOSION_SPR_PAT_1_NUMBER:             equ 8 * 4
EXPLOSION_SPR_PAT_2_NUMBER:             equ 9 * 4
ENEMY_SHOT_SPR_PAT_0_NUMBER:            equ 10 * 4
ENEMY_SHOT_SPR_PAT_1_NUMBER:            equ 11 * 4

; sprite patterns # 12 to 21 are Enemy Planes

PLAYER_LEFT_FRAME_0_TOP_SPR_PAT_0_NUMBER:       equ 22 * 4
; PLAYER_LEFT_FRAME_0_TOP_SPR_PAT_1_NUMBER:       equ 23 * 4
; PLAYER_LEFT_FRAME_0_BOTTOM_SPR_PAT_0_NUMBER:    equ 24 * 4
; PLAYER_LEFT_FRAME_0_BOTTOM_SPR_PAT_1_NUMBER:    equ 25 * 4

PLAYER_LEFT_FRAME_1_TOP_SPR_PAT_0_NUMBER:       equ 26 * 4
; PLAYER_LEFT_FRAME_1_TOP_SPR_PAT_1_NUMBER:       equ 27 * 4
; PLAYER_LEFT_FRAME_1_BOTTOM_SPR_PAT_0_NUMBER:    equ 28 * 4
; PLAYER_LEFT_FRAME_1_BOTTOM_SPR_PAT_1_NUMBER:    equ 29 * 4

PLAYER_RIGHT_FRAME_0_TOP_SPR_PAT_0_NUMBER:       equ 30 * 4     ; 30 to 33
PLAYER_RIGHT_FRAME_1_TOP_SPR_PAT_0_NUMBER:       equ 34 * 4     ; 34 to 37

ITEM_P_SPR_PAT_0_NUMBER:                         equ 38 * 4     ; 38 to 39  ; all frames of item P will be put here
; -------------- NEXT AVAILABLE: 40 --------------------

EMPTY_SPR_PAT_NUMBER:                           equ 63 * 4

Update_SPRATR_Buffer:
    ld      hl, SPRATR_Buffer


; ================================== PLAYER PLANE ===================================

    ; Sprite # 0
    ld      a, (Player_Y)
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ld      a, (Player_SpritePatternNumber)
    ld      (hl), a

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
    ld      a, (Player_SpritePatternNumber)
    add     4
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 2
    inc     hl
    ld      a, (Player_Y)
    add     a, 16
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ld      a, (Player_SpritePatternNumber)
    add     8
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 3
    inc     hl
    ld      a, (Player_Y)
    add     a, 16
    ld      (hl), a

    ld      a, (Player_Spr3_Offset_X)
    ld      b, a

    inc     hl
    ld      a, (Player_X)
    add     a, b            ; x offset
    ld      (hl), a

    inc     hl
    ld      a, (Player_SpritePatternNumber)
    add     12
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ================================== PLAYER SHOTS ===================================

; ----------------------------------------

    ; Sprite # 4
    inc     hl
    ld      a, (PlayerShot_0_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_0_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_0_Struct + 4)    ; Pattern number 0
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 4 a
    inc     hl
    ld      a, (PlayerShot_0_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_0_Struct + 1)    ; X
    add     16
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_0_Struct + 5)    ; Pattern number 1
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
    ld      a, (PlayerShot_1_Struct + 4)    ; Pattern number 0
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 5 a
    inc     hl
    ld      a, (PlayerShot_1_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_1_Struct + 1)    ; X
    add     16
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_1_Struct + 5)    ; Pattern number 1
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
    ld      a, (PlayerShot_2_Struct + 4)    ; Pattern number 0
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 6 a
    inc     hl
    ld      a, (PlayerShot_2_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_2_Struct + 1)    ; X
    add     16
    ld      (hl), a

    inc     hl
    ld      a, (PlayerShot_2_Struct + 5)    ; Pattern number 1
    ld      (hl), a

    inc     hl

; ================================== ENEMIES ===================================

; ------------------------------------------------------------------------------

    ; Sprite # 7
    inc     hl
    ld      a, (Enemy_0_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 4)    ; Pattern 0
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 8
    inc     hl
    ld      a, (Enemy_0_Struct + 11)    ; Y1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 10)    ; X1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_0_Struct + 5)    ; Pattern 1
    ld      (hl), a

    inc     hl

; ------------------------------------------------------------------------------

    ; Sprite # 9
    inc     hl
    ld      a, (Enemy_1_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_1_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_1_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 10
    inc     hl
    ld      a, (Enemy_1_Struct + 11)    ; Y1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_1_Struct + 10)    ; X1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_1_Struct + 5)    ; Pattern
    ld      (hl), a

    inc     hl

; ------------------------------------------------------------------------------

    ; Sprite # 11
    inc     hl
    ld      a, (Enemy_2_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_2_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_2_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 12
    inc     hl
    ld      a, (Enemy_2_Struct + 11)    ; Y1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_2_Struct + 10)    ; X1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_2_Struct + 5)    ; Pattern
    ld      (hl), a

    inc     hl

; ------------------------------------------------------------------------------

    ; Sprite # 13
    inc     hl
    ld      a, (Enemy_3_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_3_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_3_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 14
    inc     hl
    ld      a, (Enemy_3_Struct + 11)    ; Y1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_3_Struct + 10)    ; X1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_3_Struct + 5)    ; Pattern
    ld      (hl), a

    inc     hl

; ------------------------------------------------------------------------------

    ; Sprite # 15
    inc     hl
    ld      a, (Enemy_4_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_4_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_4_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 16
    inc     hl
    ld      a, (Enemy_4_Struct + 11)    ; Y1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_4_Struct + 10)    ; X1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_4_Struct + 5)    ; Pattern
    ld      (hl), a

    inc     hl

; ------------------------------------------------------------------------------

    ; Sprite # 17
    inc     hl
    ld      a, (Enemy_5_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_5_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_5_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 18
    inc     hl
    ld      a, (Enemy_5_Struct + 11)    ; Y1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_5_Struct + 10)    ; X1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_5_Struct + 5)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ------------------------------------------------------------------------------

    ; Sprite # 19
    inc     hl
    ld      a, (Enemy_6_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_6_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_6_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl

; ----------------------------------------

    ; Sprite # 20
    inc     hl
    ld      a, (Enemy_6_Struct + 11)    ; Y1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_6_Struct + 10)    ; X1
    ld      (hl), a

    inc     hl
    ld      a, (Enemy_6_Struct + 5)    ; Pattern
    ld      (hl), a

    inc     hl


; ================================== ENEMY SHOTS ===============================

; ----------------------------------------

    ; Sprite # 21
    inc     hl
    ld      a, (EnemyShot_0_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_0_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_0_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 22
    inc     hl
    ld      a, (EnemyShot_1_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_1_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_1_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 23
    inc     hl
    ld      a, (EnemyShot_2_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_2_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_2_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 24
    inc     hl
    ld      a, (EnemyShot_3_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_3_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_3_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 25
    inc     hl
    ld      a, (EnemyShot_4_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_4_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_4_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 26
    inc     hl
    ld      a, (EnemyShot_5_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_5_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_5_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 27
    inc     hl
    ld      a, (EnemyShot_6_Struct + 2)    ; Y
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_6_Struct + 1)    ; X
    ld      (hl), a

    inc     hl
    ld      a, (EnemyShot_6_Struct + 4)    ; Pattern
    ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------


    ret