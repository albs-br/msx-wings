PLANE_PLAYER_WIDTH:             equ 21
PLANE_PLAYER_HEIGHT:            equ 31
PLANE_PLAYER_PIXELS_PER_MOV:    equ 3



PLAYER_SIDE_MOVEMENT_CENTER:        equ 128
PLAYER_SIDE_MOVEMENT_LIMIT:         equ 20
PLAYER_SIDE_MOVEMENT_INTERMEDIATE:  equ 10


ReadInput:


    ; read keyboard
    ld      a, 8                    ; 8th line
    call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix
    ld      e, a                    ; save value

    push    de
        ;ld      a, e
        bit     1, e                    ; 1st bit (HOME key)
        call    z, .pause
    pop     de


    ; TODO:
    ; if (Player_Tnput == KEYBOARD) 


.readJoystick:
    ; TODO: implement joystick support
    ; ; read joystick
    ; ld a, 1                 ; 1: joystick 1
    ; call BIOS_GTSTCK
    ; cp 0
    ; jp nz, .readJoystick    ; if joystick status is <> 0 (no direction), skip to check joystick


.readKeyboard:

    push    de
        bit     0, e                ; 0th bit (space bar)
        call    z, .shot
    pop     de
    
    push    de
        bit     3, e                ; 3rd bit (DELETE key)
        call    z, .bomb
    pop     de



    ld      c, 0    ; control variable to check left/right press

    ; if (Player_Controls_Enabled == 0) ret
    ld      a, (Player_Controls_Enabled)
    or      a
    ret     z

    ; ld      a, e
    bit     4, e                    ; 4th bit (key left)
    call    z, .playerLeft

    ; ld      a, e
    bit     7, e                    ; 7th bit (key right)
    call    z, .playerRight


    ; if neither left nor right pressed, slowly return Player_SideMovementCounter to 0
    ld      a, c
    or      a
    call    z, .playerNotPressedLeftRight

    ; ld      a, e
    bit     5, e                    ; 5th bit (key up)
    call    z, .playerUp

    ; ld      a, e
    bit     6, e                    ; 6th bit (key down)
    call    z, .playerDown

    ret

.playerLeft:
    ld      a, (Player_X)
    sub     PLANE_PLAYER_PIXELS_PER_MOV
    cp      6
    ret     c
    ld      (Player_X), a

    ld      c, 1

    ld      a, (Player_SideMovementCounter)
    cp      PLAYER_SIDE_MOVEMENT_CENTER - PLAYER_SIDE_MOVEMENT_LIMIT
    ret     z
    dec     a
    ld      (Player_SideMovementCounter), a

    ; ; clear 7th bit (key right)
    ; ld      a, e
    ; or      1000 0000b
    ; ld      e, a

    ret

.playerRight:
    ld      a, (Player_X)
    add     PLANE_PLAYER_PIXELS_PER_MOV
    cp      255 - PLANE_PLAYER_WIDTH
    ret     nc
    ld      (Player_X), a

    ld      c, 1

    ld      a, (Player_SideMovementCounter)
    cp      PLAYER_SIDE_MOVEMENT_CENTER + PLAYER_SIDE_MOVEMENT_LIMIT
    ret     z
    inc     a
    ld      (Player_SideMovementCounter), a


    ; ; clear 4th bit (key left)
    ; ld      a, e
    ; or      0001 0000b
    ; ld      e, a

    ret

.playerNotPressedLeftRight:
    ; if (Player_SideMovementCounter == 128) ret
    ld      a, (Player_SideMovementCounter)
    cp      128
    ret     z

    ;If A < N, then S and P/V are different.
    ;A >= N, then S and P/V are the same.

    ; call m,label        ;calls if S flag is set
    ; call p,label        ;calls if S flag is reset

    ; call pe,label        ;calls if P/V is set
    ; call po,label        ;calls if P/V is reset

    ; if (Player_SideMovementCounter < 128) Player_SideMovementCounter++
    jp      c, .playerNotPressedLeftRight.lessThan             ; if (a < n)

    ; else if (Player_SideMovementCounter > 128) Player_SideMovementCounter--    (== 128 has been blocked before)
    jp      nc, .playerNotPressedLeftRight.greaterThan             ; if (a >= n)

    ret

.playerNotPressedLeftRight.lessThan:
    inc     a
    ld      (Player_SideMovementCounter), a
    ret

.playerNotPressedLeftRight.greaterThan:
    dec     a
    ld      (Player_SideMovementCounter), a
    ret

.playerUp:
    ld      a, (Player_Y_Static)
    sub     PLANE_PLAYER_PIXELS_PER_MOV
    ret     c
    ld      (Player_Y_Static), a

    ld      a, (Player_Y)
    sub     PLANE_PLAYER_PIXELS_PER_MOV
    ld      (Player_Y), a

    ret

.playerDown:
    ld      a, (Player_Y_Static)
    add     PLANE_PLAYER_PIXELS_PER_MOV
    cp      191 - PLANE_PLAYER_HEIGHT
    ret     nc
    ld      (Player_Y_Static), a

    ld      a, (Player_Y)
    add     PLANE_PLAYER_PIXELS_PER_MOV
    ld      (Player_Y), a

    ret

.shot:
    ; get next shot struct addr
    ld      hl, (NextShot_Struct_Addr)
    call    PlayerShot_Init

    ;ld      a, 100           ; volume
    ld      a, SFX_SHOT     ; number of sfx in the bank
    ld      c, 15            ; sound priority
    call    PlaySfx

    ret



.bomb:
    ; if(Player_BombActive != 0) return;
    ld      a, (Player_BombActive)
    or      a
    ret     nz

    ; if(Player_BombsNumber == 0) return;
    ld      a, (Player_BombsNumber)
    or      a
    ret     z


    ; --- Init player bomb

    ; Player_BombActive = 1;
    ld      a, 1
    ld      (Player_BombActive), a

    ; Player_BombsNumber--;
    ld      hl, Player_BombsNumber
    dec     (hl)

    ; Player_Bomb_Y = 192 + VerticalScroll;
    ld      a, (VerticalScroll)
    ld      b, 192
    add     b
    ld      (Player_Bomb_Y), a
    
    ld      a, 192
    ld      (Player_Bomb_Y_Static), a

    ; reset all enemy shots
    ld      hl, EnemyShot_0_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_1_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_2_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_3_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_4_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_5_Struct
    call    EnemyShot_Reset
    ld      hl, EnemyShot_6_Struct
    call    EnemyShot_Reset


    ; ---- set SPRPAT data for player bomb (overwrite enemy shots sprite, as there are no enemy shots when player bomb is active)

    ; set MegaROM page for Sprite Patterns data
    ld      a, SPRITE_PATTERNS_DATA_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ld      a, 0000 0001 b
    ld      hl, SPRPAT + (32 * 10) ; Sprite pattern #10
    call    SetVdp_Write
    ld      c, PORT_0
    ld      hl, SpritePattern_PlayerShot_Fat
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ; ---- set SPRCOL data for player bomb (sprites #24 to #30 of SPRATR)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + (16 * 24) ; Sprite color #24
    call    SetVdp_Write
    ld      c, PORT_0
    ld      a, 13 ; color
    ld      b, 7 * 16       ; 7 sprites
.loop_10:
    out     (c), a
    ; dec     b
    ; jp      nz, .loop_10
    djnz    .loop_10

    ret



.pause:

    ; restore default palette (one blue color is constantly being changed)
    ld      hl, PaletteData_0
    call    LoadPalette

.pause_loop:

    ; do pause animation
    call    PauseAnimation

    ; check if HOME key was released
    ld      a, 8                    ; 8th line
    call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix

    bit     1, a                    ; 1st bit (HOME key)
    jp      z, .pause_loop


.pause_endloop:

    ; do pause animation
    call    PauseAnimation

    ; check if HOME key was pressed again (end pause)
    ld      a, 8                    ; 8th line
    call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix

    bit     1, a                    ; 1st bit (HOME key)
    jp      nz, .pause_endloop

.pause_loop_1:

    ; do pause animation
    call    PauseAnimation

    ; check if HOME key was released again
    ld      a, 8                    ; 8th line
    call    BIOS_SNSMAT             ; Read Data Of Specified Line From Keyboard Matrix

    bit     1, a                    ; 1st bit (HOME key)
    jp      z, .pause_loop_1


    ; end pause
    call    EndPauseAnimation

    ret
