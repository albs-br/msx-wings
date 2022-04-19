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
        ; -------------------------- 
        
        ld      a, (GroundTarget_Temp_Status)      ; get Status
        cp      1
        jp      nz, .doExplosionAnimation   ; if (Status != 1) doExplosionAnimation

        ; if (GroundTarget_Temp_Y_Static == 192) groundTargetReset
        ld      a, (GroundTarget_Temp_Y_Static)
        cp      192
        jp      z, .groundTargetReset


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
    ; 32x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ; -------------------------- test draw 16x16 box on background bitmap (screen 11)
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

    ld      b, 16 ; number of lines
.loop:
    push    bc
        push    hl
            ; read current bg line and save it to a temp array
            ld      a, 0000 0000 b
            call    SetVdp_Read
            ld      c, PORT_0
            ld      hl, CurrentLineBGPixels
            ; 16x INI
            ini ini ini ini ini ini ini ini ini ini ini ini ini ini ini ini 
        pop     hl
        push    hl
            ; copy source line to current bg line unless bg == 0 (keep bg)
            ld      a, 0000 0000 b
            call    SetVdp_Write
            ld      c, PORT_0
            ld      hl, .TestDrawBg
            ; ; 16x OUTI
            ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
            ld      de, CurrentLineBGPixels
            ld      b, 16
        .loop_1:
            ld      a, (hl)
            or      a
            jp      nz, .continue_1          ; if (pixel == 0) ignore
        ; .keepBGpixel:
            ld      a, (de)
            jp      .next_1
        .continue_1:
            and     1111 1000 b             ; mask to keep 5 high bits from source
            push    af
                ld      a, (de)
                and     0000 0111 b         ; mask to keep 3 low bits from bg
                ld      ixh, a
            pop     af
            or      ixh
        .next_1:
            out     (c), a
            inc     hl
            inc     de
            djnz    .loop_1

        pop     hl
        ld      bc, 256  ; next line
        add     hl, bc
    pop     bc
    djnz    .loop

    jp      .groundTargetReset

.TestDrawBg:
    ; 4 high bits: color index from palette
    ; 4 low bits: 1000 (set pixel to RGB palette instead of YJK)
    ; db  0x08, 0x18, 0x28, 0x38, 0x48, 0x58, 0x68, 0x78, 0x88, 0x98, 0xa8, 0xb8, 0xc8, 0xd8, 0xe8, 0xf8
    db  0xd8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0xd8


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
    outi outi outi outi
    outi outi outi outi
    outi outi outi outi
    outi outi outi outi 


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

    call    CheckCol_Object_PlayerShot
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

