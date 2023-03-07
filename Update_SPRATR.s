;       Screen sprites budget:
;       =====================

;       qty     range
;       4       0-3         Player plane (was 6, then improved to only 4 by using an offset on sprites overlapping)
;       6       4-9         Player shots (3x 16x16 sprites for simple shots; 3x 32x16 for double shots)
;       14      10-23       Enemies (*)
;       7       24-30       Enemy shots (7x 16x16 single sprites) or player bomb sprites (14 sprites alternating 7 per frame)(**)
;       1       31          Ground target (sprite used only to blink when shot), 
;                           this is shared by all ground targets, as only one is being shot at a time

; (*)
; SMALL_ENEMIES: 7x two 16x16 or-color sprites enemies (18x24 total size aprox)
; BIG_ENEMIES: 2x 7 16x16 sprites (32x32 total size)
; BOSS: 1x 14 16x16 sprites (80x64 total size)


; (**)
; player bomb sprites
; odd frames:
;  X X X
; X X X X
; even frames:
; X X X X
;  X X X
; horizontal spacing between sprites: 18 pixels (18 x 14 = 252)

PLAYER_SPR_PAT_0_NUMBER:                equ 0 * 4
PLAYER_SPR_PAT_1_NUMBER:                equ 1 * 4
PLAYER_SPR_PAT_2_NUMBER:                equ 2 * 4
PLAYER_SPR_PAT_3_NUMBER:                equ 3 * 4
PLAYER_SHOT_SPR_PAT_NUMBER:             equ 4 * 4

ENEMY_FRAME_0_SPR_PAT_0_NUMBER:         equ 5 * 4     ; 5 and 6
;ENEMY_FRAME_0_SPR_PAT_1_NUMBER:         equ 6 * 4
ENEMY_FRAME_1_SPR_PAT_0_NUMBER:         equ 12 * 4    ; 12 and 13
ENEMY_FRAME_2_SPR_PAT_0_NUMBER:         equ 14 * 4
ENEMY_FRAME_3_SPR_PAT_0_NUMBER:         equ 16 * 4
ENEMY_FRAME_4_SPR_PAT_0_NUMBER:         equ 18 * 4
ENEMY_FRAME_5_SPR_PAT_0_NUMBER:         equ 20 * 4    ; 20 and 21

; sprite patterns # 41 to 56 are available to Big Enemies (7x sprites, 32x32)

ENEMY_PLANE_TURNING_FRAME_0_SPR_PAT_0_NUMBER:         equ 41 * 4     ; 41 and 42
ENEMY_PLANE_TURNING_FRAME_1_SPR_PAT_0_NUMBER:         equ 43 * 4
ENEMY_PLANE_TURNING_FRAME_2_SPR_PAT_0_NUMBER:         equ 45 * 4
ENEMY_PLANE_TURNING_FRAME_3_SPR_PAT_0_NUMBER:         equ 47 * 4
ENEMY_PLANE_TURNING_FRAME_4_SPR_PAT_0_NUMBER:         equ 49 * 4
ENEMY_PLANE_TURNING_FRAME_5_SPR_PAT_0_NUMBER:         equ 51 * 4
ENEMY_PLANE_TURNING_FRAME_6_SPR_PAT_0_NUMBER:         equ 53 * 4
ENEMY_PLANE_TURNING_FRAME_7_SPR_PAT_0_NUMBER:         equ 55 * 4     ; 55 and 56


EXPLOSION_SPR_PAT_0_NUMBER:             equ 7 * 4
EXPLOSION_SPR_PAT_1_NUMBER:             equ 8 * 4
EXPLOSION_SPR_PAT_2_NUMBER:             equ 9 * 4

ENEMY_SHOT_SPR_PAT_0_NUMBER:            equ 10 * 4
ENEMY_SHOT_SPR_PAT_1_NUMBER:            equ 11 * 4

; sprite patterns # 12 to 21 are Enemy Planes

PLAYER_LEFT_FRAME_0_TOP_SPR_PAT_0_NUMBER:        equ 22 * 4     ; 22 to 25
; PLAYER_LEFT_FRAME_0_TOP_SPR_PAT_1_NUMBER:       equ 23 * 4
; PLAYER_LEFT_FRAME_0_BOTTOM_SPR_PAT_0_NUMBER:    equ 24 * 4
; PLAYER_LEFT_FRAME_0_BOTTOM_SPR_PAT_1_NUMBER:    equ 25 * 4

PLAYER_LEFT_FRAME_1_TOP_SPR_PAT_0_NUMBER:        equ 26 * 4     ; 26 to 29
; PLAYER_LEFT_FRAME_1_TOP_SPR_PAT_1_NUMBER:       equ 27 * 4
; PLAYER_LEFT_FRAME_1_BOTTOM_SPR_PAT_0_NUMBER:    equ 28 * 4
; PLAYER_LEFT_FRAME_1_BOTTOM_SPR_PAT_1_NUMBER:    equ 29 * 4

PLAYER_RIGHT_FRAME_0_TOP_SPR_PAT_0_NUMBER:       equ 30 * 4     ; 30 to 33
PLAYER_RIGHT_FRAME_1_TOP_SPR_PAT_0_NUMBER:       equ 34 * 4     ; 34 to 37

ITEM_P_SPR_PAT_0_NUMBER:                         equ 38 * 4     ; 38 to 39  ; all frames of item P will be put here (each frame uses 2 sprites)

GROUND_TARGET_PAT_0_NUMBER:                      equ 40 * 4

; sprites 41 to 56: Enemy plane turning

POINTS_1000_PAT_NUMBER:                          equ 57 * 4

ITEM_BOMB_SPR_PAT_0_NUMBER:                      equ 58 * 4     ; 58 to 59  ; all frames of item bomb will be put here (each frame uses 2 sprites)

; -------------- NEXT AVAILABLE: 60 --------------------

EMPTY_SPR_PAT_NUMBER:                            equ 63 * 4

Update_SPRATR:
    ;ld      hl, SPRATR_Buffer

    ; set up base VRAM addr to SPRATR table
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write

    ld      c, PORT_0
    ld      d, 0    ; value for 4th byte of each sprite
    ld      e, 216  ; Y value that hides the sprite and all sprites after


; ================================== PLAYER PLANE ===================================

    ; Sprite # 0
    ld      a, (Player_Y)
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a
    
    ; use OUT's directly, instead of a buffer (saves 18 + 8 + 7 - 12 = 21 cycles per byte, 128 * 21 = 2688 cycles total)
    ; saves:
    ;   outi (18 cycles) on UpdateBuffer routine
    ;   ld (hl), a (8 cycles) here
    ;   inc hl (7 cycles) here
    ; add:
    ;   out (PORT_0), a (12 cycles)

    ; CAUTION: on V9938/58 sequential OUT's must be at least 15 cycles apart
    ; NOP is 5 cycles, 5 NOP's = 25 per sprite ==> 32 x 25 = 800 cycles wasted :(

    nop
    ld      a, (Player_X)
    out     (PORT_0), a

    nop
    ld      a, (Player_SpritePatternNumber)
    out     (PORT_0), a

    ; TODO: these 3 NOP's can be changed by
    ; ld        a, (Player_Y)
    ; cp        e
    ; (code of next sprite). Worse for legibilty, better for performance
    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 1
    ld      a, (Player_Y)
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Player_X)
    out     (PORT_0), a

    ld      a, (Player_SpritePatternNumber)
    add     4
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 2
    ld      a, (Player_Y)
    add     a, 16
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Player_X)
    out     (PORT_0), a

    ld      a, (Player_SpritePatternNumber)
    add     8
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 3
    ld      a, (Player_Y)
    add     a, 16
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    ld      a, (Player_Spr3_Offset_X)
    ld      b, a

    ld      a, (Player_X)
    add     a, b            ; x offset
    out     (PORT_0), a

    ld      a, (Player_SpritePatternNumber)
    add     12
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ================================== PLAYER SHOTS ===================================

; --------------------------------------------------------------------------------

    ; Sprite # 4
    ld      a, (PlayerShot_0_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (PlayerShot_0_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (PlayerShot_0_Struct + 4)    ; Pattern number 0
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 5
    ld      a, (PlayerShot_0_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    ld      a, (PlayerShot_0_Struct + 1)    ; X
    add     16
    out     (PORT_0), a

    nop
    ld      a, (PlayerShot_0_Struct + 5)    ; Pattern number 1
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; --------------------------------------------------------------------------------

    ; Sprite # 6
    ld      a, (PlayerShot_1_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a


    nop
    ld      a, (PlayerShot_1_Struct + 1)    ; X
    out     (PORT_0), a


    nop
    ld      a, (PlayerShot_1_Struct + 4)    ; Pattern number 0
    out     (PORT_0), a


    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 7
    ld      a, (PlayerShot_1_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    ld      a, (PlayerShot_1_Struct + 1)    ; X
    add     16
    out     (PORT_0), a

    nop
    ld      a, (PlayerShot_1_Struct + 5)    ; Pattern number 1
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; --------------------------------------------------------------------------------

    ; Sprite # 8
    ld      a, (PlayerShot_2_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (PlayerShot_2_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (PlayerShot_2_Struct + 4)    ; Pattern number 0
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 9
    ld      a, (PlayerShot_2_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    ld      a, (PlayerShot_2_Struct + 1)    ; X
    add     16
    out     (PORT_0), a

    nop
    ld      a, (PlayerShot_2_Struct + 5)    ; Pattern number 1
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ================================== ENEMIES ===================================

; TODO:
; if (Gameplay_Type == SMALL_ENEMIES)
; elseif (Gameplay_Type == BIG_ENEMIES)
; elseif (Gameplay_Type == BOSS)

; ------------------------------------------------------------------------------

    ; Sprite # 10
    ld      a, (Enemy_0_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_0_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (Enemy_0_Struct + 4)    ; Pattern 0
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 11
    ld      a, (Enemy_0_Struct + 11)    ; Y1
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_0_Struct + 10)    ; X1
    out     (PORT_0), a

    nop
    ld      a, (Enemy_0_Struct + 5)    ; Pattern 1
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ------------------------------------------------------------------------------

    ; Sprite # 12
    ld      a, (Enemy_1_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_1_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (Enemy_1_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d


; ----------------------------------------

    ; Sprite # 13
    ld      a, (Enemy_1_Struct + 11)    ; Y1
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_1_Struct + 10)    ; X1
    out     (PORT_0), a

    nop
    ld      a, (Enemy_1_Struct + 5)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ------------------------------------------------------------------------------

    ; Sprite # 14
    ld      a, (Enemy_2_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_2_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (Enemy_2_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 15
    ld      a, (Enemy_2_Struct + 11)    ; Y1
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_2_Struct + 10)    ; X1
    out     (PORT_0), a

    nop
    ld      a, (Enemy_2_Struct + 5)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ------------------------------------------------------------------------------

    ; Sprite # 16
    ld      a, (Enemy_3_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_3_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (Enemy_3_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d
; ----------------------------------------

    ; Sprite # 17
    ld      a, (Enemy_3_Struct + 11)    ; Y1
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_3_Struct + 10)    ; X1
    out     (PORT_0), a

    nop
    ld      a, (Enemy_3_Struct + 5)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ------------------------------------------------------------------------------

    ; Sprite # 18
    ld      a, (Enemy_4_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_4_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (Enemy_4_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 19
    ld      a, (Enemy_4_Struct + 11)    ; Y1
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_4_Struct + 10)    ; X1
    out     (PORT_0), a

    nop
    ld      a, (Enemy_4_Struct + 5)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ------------------------------------------------------------------------------

    ; Sprite # 20
    ld      a, (Enemy_5_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_5_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (Enemy_5_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 21
    ld      a, (Enemy_5_Struct + 11)    ; Y1
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_5_Struct + 10)    ; X1
    out     (PORT_0), a

    nop
    ld      a, (Enemy_5_Struct + 5)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ------------------------------------------------------------------------------

    ; Sprite # 22
    ld      a, (Enemy_6_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_6_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (Enemy_6_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 23
    ld      a, (Enemy_6_Struct + 11)    ; Y1
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (Enemy_6_Struct + 10)    ; X1
    out     (PORT_0), a

    nop
    ld      a, (Enemy_6_Struct + 5)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ================================== ENEMY SHOTS ===============================

; TODO:
; if (!Player_BombActive) 
;   showEnemyShots;
; else
;   showPlayerBomb;

; ----------------------------------------

    ; Sprite # 24
    ld      a, (EnemyShot_0_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_0_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_0_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 25
    ld      a, (EnemyShot_1_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_1_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_1_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 26
    ld      a, (EnemyShot_2_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_2_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_2_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 27
    ld      a, (EnemyShot_3_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_3_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_3_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 28
    ld      a, (EnemyShot_4_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_4_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_4_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 29
    ld      a, (EnemyShot_5_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_5_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_5_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 30
    ld      a, (EnemyShot_6_Struct + 2)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_6_Struct + 1)    ; X
    out     (PORT_0), a

    nop
    ld      a, (EnemyShot_6_Struct + 4)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------

    ; Sprite # 31
    ld      a, (GroundTarget_Sprite.Y)    ; Y
    cp      e           ; if (Y == 216) Y++
    jp      nz, $+4     ; jp nz is 3 bytes long, inc a is 1 byte long
    inc     a
    out     (PORT_0), a

    nop
    ld      a, (GroundTarget_Sprite.X)    ; X
    out     (PORT_0), a

    nop
    ld      a, (GroundTarget_Sprite.PatternNumber)    ; Pattern
    out     (PORT_0), a

    nop
    nop
    nop
    out     (c), d

; ----------------------------------------


    ret