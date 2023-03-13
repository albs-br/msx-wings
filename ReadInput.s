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
        bit     0, a                ; 0th bit (space bar)
        call    z, .shot
    pop     de
    
    ; if the subrotine is simple and will not change 
    ; E register there is no need to PUSH/POP DE
    ld      a, e
    bit     3, a                    ; 3rd bit (DELETE key)
    call    z, .bomb

    push    de
        ld      a, e
        bit     1, a                    ; 1st bit (HOME key)
        call    z, .pause
    pop     de


    ld      c, 0    ; control variable to check left/right press

    ld      a, e
    bit     4, a                    ; 4th bit (key left)
    call    z, .playerLeft

    ld      a, e
    bit     7, a                    ; 7th bit (key right)
    call    z, .playerRight
    
    ; if neither left nor right pressed, slowly return Player_SideMovementCounter to 0
    ld      a, c
    or      a
    call    z, .playerNotPressedLeftRight

    ld      a, e
    bit     5, a                    ; 5th bit (key up)
    call    z, .playerUp

    ld      a, e
    bit     6, a                    ; 6th bit (key down)
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

    ; Player_BombActive = 1;
    ld      a, 1
    ld      (Player_BombActive), a

    ; Player_BombsNumber--;
    ld      hl, Player_BombsNumber
    dec     (hl)

    ret



.pause:

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

; -----------------------------

; TODO: put on a separate file

; END_PAUSE_ANIMATION_STEP_1:     equ ?
; END_PAUSE_ANIMATION_STEP_2:     equ ?

PauseAnimation:

    call    Wait_Vblank         ; VBlank sync


    ; if(PauseAnimation_Counter == 0)
    ld      a, (PauseAnimation_Counter)
    or      a
    jp      z, .initPauseAnimation

    ; if(PauseAnimation_Counter > 0 && PauseAnimation_Counter < END_PAUSE_ANIMATION_STEP_1)
    
    ; if(PauseAnimation_Counter == END_PAUSE_ANIMATION_STEP_2)

    ; PauseAnimation_Counter++
    ld      hl, PauseAnimation_Counter
    inc     (hl)

    ret

.initPauseAnimation:
    ; save SPRATR table

    ; hide all sprites

    ; load PAUSE string sprites

    ; load screen top sprites (lifes, bombs and score)

    ; PauseAnimation_Counter++
    ld      hl, PauseAnimation_Counter
    inc     (hl)

    ret



EndPauseAnimation:
    xor     a
    ld      (PauseAnimation_Counter), a

    ; restore SPRATR table

    ret