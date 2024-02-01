; Input
;   HL: addr of ground target struct
GroundTarget_Logic:

    ; check status before copying to temp vars to save cycles when disabled
    ld      a, (hl)         ; get Status
    or      a
    ret     z               ; if (Status == 0) ret

    push    hl

        ; Copy ground target struct to temp ground target struct
        ;ld      hl, ?                                          ; source
        ld      de, GroundTarget_Temp_Struct                    ; destiny
        ld      bc, GroundTarget_Temp_Struct.size               ; size
        ldir                                                    ; Copy BC bytes from HL to DE



        ; -------------------------- ground target logic --------------------------
        
        ; if (IsScroll) GroundTarget_Temp_Y_Static++
        ld      a, (BIOS_JIFFY)         ; get only low byte of JIFFY
        and     SCROLL_SPEED
        jp      nz, .isNotScroll

        ld      a, (GroundTarget_Temp_Y_Static)
        inc     a
        ld      (GroundTarget_Temp_Y_Static), a

    .isNotScroll:
        ; -------------------------- state machine
        
        ; if (GroundTarget_Temp_Y_Static == 192) groundTargetReset
        ld      a, (GroundTarget_Temp_Y_Static)
        cp      192
        jp      z, .groundTargetReset


        ld      a, (GroundTarget_Temp_Status)      ; get Status

        ; if (Status != 1) doExplosionAnimation        
        ; cp      1
        ; jp      nz, .doExplosionAnimation
        
        ; else if (Status == 60) { end of "1000 points" sprite animation / reset target }
        cp      60
        jp      z, .endAnimation1000points

        ; else if (Status >= 40) { animate sprite "1000 points" }
        cp      40
        jp      nc, .animateSprite1000

        ; else if (Status >= 20) itemAnimation
        cp      20
        jp      nc, .itemAnimation

        ; else if (Status > 1) doExplosionAnimation
        cp      2
        jp      nc, .doExplosionAnimation


        ; --------------------------- check collision (ground target x player shots) -------------------------

        ld      a, (GroundTarget_Temp_X)
        ld      b, a
        ld      a, (GroundTarget_Temp_Y_Static)
        ld      c, a

        push    bc
                ; check col. between current ground target and shot 0
                ld      hl, PlayerShot_0_Struct
                call    CheckCol_GroundTarget_PlayerShot
        pop     bc
        push    bc
                ; check col. between current ground target and shot 1
                ld      hl, PlayerShot_1_Struct
                call    CheckCol_GroundTarget_PlayerShot
        pop     bc
        push    bc
                ; check col. between current ground target and shot 2
                ld      hl, PlayerShot_2_Struct
                call    CheckCol_GroundTarget_PlayerShot
        pop     bc

.return:
        ; increment Frame Counter
        ; ld      hl, (GroundTarget_Temp_Frame_Counter)
        ; inc     hl
        ; ld      (GroundTarget_Temp_Frame_Counter), hl

        ld      hl, GroundTarget_Temp_Struct                ; source
    pop     de                                              ; destiny
    ld      bc, GroundTarget_Temp_Struct.size               ; size
    ldir                                                    ; Copy BC bytes from HL to DE



    ret



.groundTargetReset:
    ld      hl, GroundTarget_Temp_Struct
    call    GroundTarget_Reset
    jp      .return

.endExplosionAnimation:
    ; Load ground target colors
    ld      a, 0000 0001 b
    ld      hl, GROUND_TARGET_SPRCOL_ADDR
    call    SetVdp_Write
    ld      c, PORT_0
    ld      hl, SpriteColors_GroundTarget_0
    call    OUTI_x16



    call    DrawGroundTargetDestroyed
    ;jp      .return

.itemAnimation:
    ; ----------- draw $ char over the ground target destroyed

    ld      a, (GroundTarget_Temp_Has_Item)
    or      a
    jp      z, .dontHaveItem


    ; check collision (if player got item)
    call    CheckCol_GroundTarget_Player
    jp      c, .playerGotItem


    ; set destiny x and y
    ; will be positioned at +5, +4 relative to ground target destroyed bitmap
    ld      a, (GroundTarget_Temp_X)
    add     5
    ld      (VDP_HMMM_Params_Buffer.Destiny_X), a

    ld      a, (GroundTarget_Temp_Y)
    add     4
    ld      (VDP_HMMM_Params_Buffer.Destiny_Y), a


    ; Status++
    ld      a, (GroundTarget_Temp_Status)
    inc     a
    ld      (GroundTarget_Temp_Status), a

    ; if (Status == 36)
    cp      36
    jp      z, .resetItemStatus

    ; if (Status < 24)
    cp      24
    jp      c, .item_Frame_0
    ; else if (Status < 27)
    cp      27
    jp      c, .item_Frame_1
    ; else if (Status < 30)
    cp      30
    jp      c, .item_Frame_2
    ; else if (Status < 33)
    cp      33
    jp      c, .item_Frame_3
    

.item_Frame_0:
    ; set source x to animation frame #0
    ld      a, 0
    jp      .item_execute_VDP_cmd

.item_Frame_1:
    ; set source x to animation frame #1
    ld      a, 6
    jp      .item_execute_VDP_cmd

.item_Frame_2:
    ; set source x to animation frame #2
    ld      a, 12
    jp      .item_execute_VDP_cmd

.item_Frame_3:
    ; set source x to animation frame #3
    ld      a, 18
    jp      .item_execute_VDP_cmd

.animateSprite1000:
    ; set Ground target sprite attributes to show "1000 sprite"
    ld      a, (GroundTarget_Temp_X)
    ld      (GroundTarget_Sprite.X), a

    ; Sprite.Y = GroundTarget_Temp_Y - Status - 40
    ld      a, (GroundTarget_Temp_Status)
    sub     40 ; status = 40 is the first frame of "1000 points" animation
    ld      b, a
    ld      a, (GroundTarget_Temp_Y)
    sub     b
    ld      (GroundTarget_Sprite.Y), a

    ld      a, POINTS_1000_PAT_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a        



    ; ---- update SPRCOL table (blink "1000 points" sprite)
    ld      hl, GROUND_TARGET_SPRCOL_ADDR
    ld      a, 0000 0001 b
    call    SetVdp_Write
    
    ld      a, (BIOS_JIFFY)
    and     0000 0011 b ; get value between 0 and 3
    ld      hl, Points_1000_Colors
    ld      d, 0
    ld      e, a
    add     hl, de ; HL += A

    ld      c, PORT_0
    ld      b, 16 ; 16 bytes on SPRCOL
.loop_30:
    ld      a, (hl)
    out     (c), a
    djnz    .loop_30



    ; Status++
    ld      a, (GroundTarget_Temp_Status)
    inc     a
    ld      (GroundTarget_Temp_Status), a


    jp      .return

.resetItemStatus:
    ld      a, 20
    ld      (GroundTarget_Temp_Status), a
    jp      .item_Frame_0

.item_execute_VDP_cmd:
    ld      (VDP_HMMM_Params_Buffer.Source_X), a
    ld      hl, VDP_HMMM_Params_Buffer
    call    Execute_VDP_HMMM

; ----------- 

    jp      .return

.dontHaveItem:

    jp      .groundTargetReset

.playerGotItem:
    ;ld      a, 100                     ; volume
    ld      a, SFX_GET_DOLLAR_ITEM      ; number of sfx in the bank
    ld      c, 1                        ; sound priority
    call    PlaySfx

    call    DrawGroundTargetDestroyed ; clear the "$"" bitmap by drawing over

    ; set status = 40
    ld      a, 40
    ld      (GroundTarget_Temp_Status), a

    ; increment score by 1000 points
    ; todo: PUT IT ON SUBROUTINE (value to be added passed by B register)
    ld      hl, (Player_Score)
    ld      a, l
    inc     a   ; 1000 points
    daa         ; decimal adjust A (BCD coded)
    ld      l, a
    ; TODO: check if is necessary to inc H also
;     or      a
;     jp      nz, .notCarry_Score
;     ld      a, h
;     inc     a
;     daa         ; decimal adjust A (BCD coded)
;     ld      h, a
; .notCarry_Score:
    ld      (Player_Score), hl


    ;jp      GroundTarget_Logic.groundTargetReset
    jp      .return

.endAnimation1000points:
    jp      GroundTarget_Logic.groundTargetReset

; .TestDrawBg:
;     ; 4 high bits: color index from palette
;     ; 4 low bits: 1000 (set pixel to RGB palette instead of YJK)
;     ; 0x00: transparent (repeat background)

;     ; db  0x08, 0x18, 0x28, 0x38, 0x48, 0x58, 0x68, 0x78, 0x88, 0x98, 0xa8, 0xb8, 0xc8, 0xd8, 0xe8, 0xf8
;     ;db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8

;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8
;     db  0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8, 0xd8

.doExplosionAnimation:

    ld      a, (GroundTarget_Temp_Status)      ; get Status
    inc     a
    ld      (GroundTarget_Temp_Status), a
    cp      20
    ; ld      hl, GroundTarget_Temp_Struct
    ; call    z, GroundTarget_Reset
    jp      z, .endExplosionAnimation


    ld      a, (GroundTarget_Temp_X)
    ld      (GroundTarget_Sprite.X), a

    ld      a, (GroundTarget_Temp_Y)
    ld      (GroundTarget_Sprite.Y), a

    ; load explosion colors
    ld      hl, GROUND_TARGET_SPRCOL_ADDR
    ld      a, 0000 0001 b
    call    SetVdp_Write
    ld      c, PORT_0
    ld      hl, SpriteColors_Explosion_Frames_0_to_2
    ; 16x OUTI
    call    OUTI_x16
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi 


    ld      a, (GroundTarget_Temp_Status)      ; get Status
    cp      15
    jp      nc, .loadExplosionFrame_2   ; if (Status >= 15) loadExplosionFrame_2
    cp      9
    jp      nc, .loadExplosionFrame_1   ; if (Status >= 9) loadExplosionFrame_1
    cp      3 ; first frame of explosion (don't change it)
    jp      nc, .loadExplosionFrame_0   ; if (Status >= 3) loadExplosionFrame_0
    jp      .return

.loadExplosionFrame_0:
    ; ld      a, (GroundTarget_Temp_X)
    ; ld      (GroundTarget_Sprite.X), a

    ; ld      a, (GroundTarget_Temp_Y)
    ; ld      (GroundTarget_Sprite.Y), a

    ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a
    
    ; ; load explosion colors (first sprite)
    ; ld      hl, GROUND_TARGET_SPRCOL_ADDR
    ; ld      a, 0000 0001 b
    ; call    SetVdp_Write
    ; ld      c, PORT_0
    ; ld      hl, SpriteColors_Explosion_Frames_0_to_2
    ; ; 16x OUTI
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi
    ; outi outi outi outi 

    jp      .return

.loadExplosionFrame_1:
    ld      a, EXPLOSION_SPR_PAT_1_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a
    jp      .return

.loadExplosionFrame_2:
    ld      a, EXPLOSION_SPR_PAT_2_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a
    jp      .return

; .loadExplosionFrame_3:
;     ld      a, EMPTY_SPR_PAT_NUMBER
;     ld      (GroundTarget_Sprite.PatternNumber), a
;     jp      .return

; Inputs:
;   BC: X and Y static of ground target
;   HL: PlayerShot struct addr
CheckCol_GroundTarget_PlayerShot:

    ; check collision only on status 1
    ld      a, (GroundTarget_Temp_Status)
    cp      1
    ret     nz

    call    CheckCol_16x16_Object_PlayerShot
    ret     nc

;.collision:
    ; decrement health
    ld      a, (GroundTarget_Temp_Health)
    dec     a
    ld      (GroundTarget_Temp_Health), a
    call    z, .startExplosionAnimation



    ; Ground target sprite attributes
    ld      a, (GroundTarget_Temp_X)
    ld      (GroundTarget_Sprite.X), a

    ld      a, (GroundTarget_Temp_Y)
    ld      (GroundTarget_Sprite.Y), a

    ld      a, GROUND_TARGET_PAT_0_NUMBER
    ld      (GroundTarget_Sprite.PatternNumber), a        
    
    call    PlayerShot_Reset

    ret

.startExplosionAnimation:
    ; ld      hl, GroundTarget_Temp_Struct
    ; call    StartExplosionAnimation

    ld      a, 2
    ld      (GroundTarget_Temp_Status), a                         ; status
    ; ld      (hl), a                         ; status



    ;ld      a, 200          ; volume
    ld      a, SFX_EXPLOSION    ; number of sfx in the bank
    ld      c, 1                ; sound priority
    call    PlaySfx

    ret


; HMMM base params for the $ char item
GroundTarget_HMMM_Parameters:
.Source_X:   dw    0 	    ; Source X (9 bits)
.Source_Y:   dw    256 	    ; Source Y (10 bits)
.Destiny_X:  dw    0 	    ; Destiny X (9 bits)
.Destiny_Y:  dw    0 	    ; Destiny Y (10 bits)
.Cols:       dw    6        ; number of cols (9 bits)
.Lines:      dw    8        ; number of lines (10 bits)
.NotUsed:    db    0
.Options:    db    0000 0000 b  ; select destination memory and direction from base coordinate
.Command:    db    VDP_COMMAND_HMMM
GroundTarget_HMMM_Parameters_size: equ $ - GroundTarget_HMMM_Parameters



; OUT: Carry set if collision
CheckCol_GroundTarget_Player:

    ; check collision only on status > 20
    ld      a, (GroundTarget_Temp_Status)      ; get Status
    cp      20
    ret     c

    ;call    CheckCol_Object_PlayerShot
    ;ret     nc

    ld      a, (GroundTarget_Temp_X)
    add     5
    ld      b, a
    ld      a, (GroundTarget_Temp_Y_Static)
    add     4
    ld      c, a

    ld      a, (Player_X)
    add     2                           ; adjust the 16x16 collision box to the center of the plane
    ld      d, a
    ld      a, (Player_Y_Static)
    add     12                          ; adjust the 16x16 collision box to the center of the plane
    ld      e, a

    call    CheckCollision_8x8_16x16
    ;ret     nc
    ;jp      c, .playerGotItem

    ; player got item
    ;jp $ ; debug
    ret

; ;.collision:
;     ; decrement health
;     ld      a, (GroundTarget_Temp_Health)
;     dec     a
;     ld      (GroundTarget_Temp_Health), a
;     call    z, .startExplosionAnimation



;     ; Ground target sprite attributes
;     ld      a, (GroundTarget_Temp_X)
;     ld      (GroundTarget_Sprite.X), a

;     ld      a, (GroundTarget_Temp_Y)
;     ld      (GroundTarget_Sprite.Y), a

;     ld      a, GROUND_TARGET_PAT_0_NUMBER
;     ld      (GroundTarget_Sprite.PatternNumber), a        
    
;     call    PlayerShot_Reset

;     ret



DrawGroundTargetDestroyed:
    ; -------------------------- draw 16x16 bitmap over background bitmap (screen 11)
    ld      hl, (CurrentVRAMAddrLineScroll)

    ; HL += (GroundTarget_Temp_Y_Static * 256) + GroundTarget_Temp_X
    ld      a, (GroundTarget_Temp_Y_Static)
    ld      b, a    ; same as multiplying Y static by 256
    ld      c, 0
    add     hl, bc
    ld      a, (GroundTarget_Temp_X)
    ld      b, 0
    ld      c, a
    add     hl, bc

    ; ld      de, .TestDrawBg
    ld      de, GroundTargetDestroyed
    call    Copy16x16ImageFromRAMToVRAM

    ret


Points_1000_Colors:
	; db	0x05    ; blue
	; db	0x0f    ; medium gray
	; db	0x09    ; light blue
	; db	0x0d    ; white
	db	0x05    ; blue
	db	0x05    ; blue
	db	0x0d    ; white
	db	0x0d    ; white
