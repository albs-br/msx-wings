PlayerLogic:

    ld      a, (Player_Status)

    or      a ; if (Player_Status == 0)
    jp      z, .playerIsDead

    cp      1 ; if (Player_Status == 1)
    jp      z, .playerIsAlive

    cp      20 + 1 ; if (Player_Status <= 20)
    jp      c, .playerExplosion

    cp      201 + 1 ; if (Player_Status <= 201)
    jp      c, .playerRespawnInvencibility
    
    ; if (Player_Status >= 202) { Player_Status = 1; ret }
    ld      a, 1
    ld      (Player_Status), a
    ret

.playerIsDead:
    ; ---- player just died

    ; if no extra lives, then GameOver
    ld      a, (Player_Lives)
    or      a
    jp      z, GameOverAnimation

    ; Player_Lives--
    dec     a
    ld      (Player_Lives), a

    ; start explosion animation
    ld      a, 2
    ld      (Player_Status), a

    ret

.playerExplosion:

    ;Player_Status++
    ld      hl, Player_Status
    inc     (hl)

    ld      a, (Player_Status)      ; get Status
    cp      3 ; first frame of explosion (don't change it)
    jp      z, .loadExplosionFrame_0
    cp      7
    jp      z, .loadExplosionFrame_1
    cp      11
    jp      z, .loadExplosionFrame_2
    cp      15
    jp      z, .loadExplosionFrame_3
    ;jp      .return

    ret

.loadExplosionFrame_0:
    ld      a, EXPLOSION_SPR_PAT_0_NUMBER
    ld      (Player_SpritePatternNumber), a
    
    ; load explosion colors
    ld      hl, SPRCOL ; addr of SPRCOL for first sprite of plane
    ld      a, 0000 0001 b
    call    SetVdp_Write
    ld      c, PORT_0

    ld      a, 8 ; color yellow
    ld      b, 16
.loop_1001:
    nop
    out     (c), a
    djnz    .loop_1001

    ld      a, 12 ; color light orange
    ld      b, 16
.loop_1002:
    nop
    out     (c), a
    djnz    .loop_1002

    ld      a, 4 ; color dark orange
    ld      b, 16 + 16 ; 2 sprites here
.loop_1003:
    nop
    out     (c), a
    djnz    .loop_1003

    ret

.loadExplosionFrame_1:
    ld      a, EXPLOSION_SPR_PAT_1_NUMBER
    ld      (Player_SpritePatternNumber), a

    ret

.loadExplosionFrame_2:
    ld      a, EXPLOSION_SPR_PAT_2_NUMBER
    ld      (Player_SpritePatternNumber), a

    ret

.loadExplosionFrame_3:
    ld      a, EMPTY_SPR_PAT_NUMBER
    ld      (Player_SpritePatternNumber), a

    ret


.playerRespawnInvencibility:
    
    ; if (Player_Status == 21)
    ld      a, (Player_Status)
    cp      21
    jp      nz, .continue_9
    
    call    InitVariables_PlayerRespawn
    call    PlayerSprite ; set sprite patterns

.continue_9:

    ;Player_Status++
    ld      hl, Player_Status
    inc     (hl)



    ; logic to blink plane while on respawn invencibility
    ld      a, (BIOS_JIFFY)
    and     0000 0010 b
    jp      z, .hidePlayerSprites

    call    PlayerSprite ; reset sprite patterns & colors

    ret

.hidePlayerSprites:
    ; ---- set all sprite player plane colors to 0 (transparent)
    ; Spr 0 to 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    xor     a ; color transparent (0)
    ld      c, PORT_0
    ld      b, 16 * 4 ; 4 sprites, 16 colors per sprite
.loop_9:
    out     (c), a
    nop
    djnz    .loop_9

    ret

.playerIsAlive:

    call    PlayerSprite
    call    PlayerEngineAnimation

    ret


PlayerEngineAnimation:

    ld      a, (BIOS_JIFFY)
    and     0000 1111 b
    cp      7
    jp      z, .frame_0
    cp      15
    jp      z, .frame_1
    ret

.frame_0:

    ; Spr 2 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 12
    call    SetVdp_Write
    ;ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_0.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, ColorsPlayerPlaneEngine_Frame_0
    otir

    ; Spr 3 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 16 + 12
    call    SetVdp_Write
    ; ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_0.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, 0 + ColorsPlayerPlaneEngine_Frame_0 + (ColorsPlayerPlaneEngine_Frame_0.size / 2)
    otir

    ret

.frame_1:

    ; Spr 2 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 12
    call    SetVdp_Write
    ; ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_1.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, ColorsPlayerPlaneEngine_Frame_1
    otir

    ; Spr 3 (last 4 lines)
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 16 + 12
    call    SetVdp_Write
    ; ld      bc, 0 + ((ColorsPlayerPlaneEngine_Frame_1.size / 2) * 256) + PORT_0
    ld      bc, 0 + (3 * 256) + PORT_0
    ld      hl, 0 + ColorsPlayerPlaneEngine_Frame_1 + (ColorsPlayerPlaneEngine_Frame_1.size / 2)
    otir

    ret

ColorsPlayerPlaneEngine_Frame_0:
    db  0x08, 0x0c, 0x0c          ; first sprite (outer colors)
    db  0x0d, 0x08, 0x00          ; second sprite (inner colors)
.size:  equ $ - ColorsPlayerPlaneEngine_Frame_0

ColorsPlayerPlaneEngine_Frame_1:
    db  0x0d, 0x08, 0x08          ; first sprite (outer colors)
    db  0x0d, 0x0d, 0x00          ; second sprite (inner colors)
.size:  equ $ - ColorsPlayerPlaneEngine_Frame_1



; Read the Player_SideMovementCounter and update the 
; player sprite pattern and colors based on its value
PlayerSprite:

    ; Player_SideMovementCounter value:
    ; 108 ---- 117 118 ---- 127  128  129 ---- 137 138 ---- 148
    ;  |        |   |        |    |    |        |   |        | 
    ;  |        |   |        |    |    |        |   |        | 
    ;  |________|   |________|    |    |________|   |________| 
    ;    left_0       left_1   center    right_1      right_0   

    ; if (Player_SideMovementCounter == 128)
    ld      a, (Player_SideMovementCounter)
    cp      PLAYER_SIDE_MOVEMENT_CENTER
    jp      z, .centeredPlane
    
    cp      PLAYER_SIDE_MOVEMENT_CENTER - 1 ; 127
    jp      z, .planeLeft_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER - PLAYER_SIDE_MOVEMENT_INTERMEDIATE ; 118
    jp      z, .planeLeft_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER - PLAYER_SIDE_MOVEMENT_INTERMEDIATE - 1 ; 117
    jp      z, .planeLeft_0

    cp      PLAYER_SIDE_MOVEMENT_CENTER + 1 ; 129
    jp      z, .planeRight_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER + PLAYER_SIDE_MOVEMENT_INTERMEDIATE - 1 ; 137
    jp      z, .planeRight_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER + PLAYER_SIDE_MOVEMENT_INTERMEDIATE ; 138
    jp      z, .planeRight_0

    ret

.centeredPlane:

    ; change pattern
    ld      a, PLAYER_SPR_PAT_0_NUMBER      ; set sprite pattern for plane still (not moving sideways)
    ld      (Player_SpritePatternNumber), a

    ; change colors
    call    LoadPlayerColors_Center

    ; change sprite 3 offset x
    ld      a, 5
    ld      (Player_Spr3_Offset_X), a

    ret

.planeLeft_0:
    
    ; change pattern
    ld      a, PLAYER_LEFT_FRAME_0_TOP_SPR_PAT_0_NUMBER
    ld      (Player_SpritePatternNumber), a

    ; change colors
    call    LoadPlayerColors_Left_0
    
    ; change sprite 3 offset x
    xor     a
    ld      (Player_Spr3_Offset_X), a

    ret

.planeLeft_1:

    ; change pattern
    ld      a, PLAYER_LEFT_FRAME_1_TOP_SPR_PAT_0_NUMBER
    ld      (Player_SpritePatternNumber), a

    ; change colors
    call    LoadPlayerColors_Left_1
    
    ; change sprite 3 offset x
    xor     a
    ld      (Player_Spr3_Offset_X), a

    ret

.planeRight_0:
    
    ; change pattern
    ld      a, PLAYER_RIGHT_FRAME_0_TOP_SPR_PAT_0_NUMBER
    ld      (Player_SpritePatternNumber), a

    ; change colors
    call    LoadPlayerColors_Right_0
    
    ; change sprite 3 offset x
    xor     a
    ld      (Player_Spr3_Offset_X), a

    ret

.planeRight_1:

    ; change pattern
    ld      a, PLAYER_RIGHT_FRAME_1_TOP_SPR_PAT_0_NUMBER
    ld      (Player_SpritePatternNumber), a

    ; change colors
    call    LoadPlayerColors_Right_1
    
    ; change sprite 3 offset x
    xor     a
    ld      (Player_Spr3_Offset_X), a

    ret


LoadPlayerColors_Center:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_0_and_1
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


    ; Spr 2 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_2_and_3
    ; 12x outi
    call    OUTI_x12
    ;outi outi outi outi outi outi outi outi outi outi outi outi 

    
    ; Spr 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 16
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_2_and_3 + 16
    ; 12x outi
    call    OUTI_x12
    ; outi outi outi outi outi outi outi outi outi outi outi outi 

    ret

LoadPlayerColors_Left_0:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_0_Top
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_0_Bottom
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

LoadPlayerColors_Left_1:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_1_Top
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_1_Bottom
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

LoadPlayerColors_Right_0:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_0_Top
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_0_Bottom
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

LoadPlayerColors_Right_1:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_1_Top
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_1_Bottom
    ; 32x outi
    call    OUTI_x32
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    ; outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

