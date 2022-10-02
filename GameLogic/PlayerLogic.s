
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

    ; if (Player_SideMovementCounter == 128)
    ld      a, (Player_SideMovementCounter)
    cp      PLAYER_SIDE_MOVEMENT_CENTER
    jp      z, .centeredPlane
    
    cp      PLAYER_SIDE_MOVEMENT_CENTER - 1 ; 127
    jp      z, .planeLeft_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER - PLAYER_SIDE_MOVEMENT_INTERMEDIATE ; 116
    jp      z, .planeLeft_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER - PLAYER_SIDE_MOVEMENT_INTERMEDIATE - 1 ; 115
    jp      z, .planeLeft_0

    cp      PLAYER_SIDE_MOVEMENT_CENTER + 1 ; 129
    jp      z, .planeRight_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER + PLAYER_SIDE_MOVEMENT_INTERMEDIATE - 1 ; 139
    jp      z, .planeRight_1
    cp      PLAYER_SIDE_MOVEMENT_CENTER + PLAYER_SIDE_MOVEMENT_INTERMEDIATE ; 140
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
    ; ld      b, SpriteColors_PlayerPlane_0_and_1.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_0_and_1.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_0_and_1
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 


    ; Spr 2 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ; ld      b, 16 - 4        ; avoid the last 4 lines (engine)
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + ((16 - 4) * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_2_and_3
    ;otir
    ; 12x outi
    outi outi outi outi outi outi outi outi outi outi outi outi 

    
    ; Spr 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32 + 16
    call    SetVdp_Write
    ; ld      b, 16 - 4        ; avoid the last 4 lines (engine)
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + ((16 - 4) * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_2_and_3 + 16
    ;otir
    ; 12x outi
    outi outi outi outi outi outi outi outi outi outi outi outi 

    ret

LoadPlayerColors_Left_0:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ; ld      b, SpriteColors_PlayerPlane_Left_Frame_0_Top.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Left_Frame_0_Top.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_0_Top
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ; ld      b, SpriteColors_PlayerPlane_Left_Frame_0_Bottom.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Left_Frame_0_Bottom.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_0_Bottom
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

LoadPlayerColors_Left_1:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ; ld      b, SpriteColors_PlayerPlane_Left_Frame_1_Top.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Left_Frame_1_Top.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_1_Top
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ; ld      b, SpriteColors_PlayerPlane_Left_Frame_1_Bottom.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Left_Frame_1_Bottom.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Left_Frame_1_Bottom
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

LoadPlayerColors_Right_0:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Right_Frame_0_Top.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_0_Top
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Right_Frame_0_Bottom.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_0_Bottom
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

LoadPlayerColors_Right_1:
    ld      c, PORT_0

    ; Spr 0 and 1 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL
    call    SetVdp_Write
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Right_Frame_1_Top.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_1_Top
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ; Spr 2 and 3 colors
    ld      a, 0000 0001 b
    ld      hl, SPRCOL + 32
    call    SetVdp_Write
    ;ld      bc, 0 + (SpriteColors_PlayerPlane_Right_Frame_1_Bottom.size * 256) + PORT_0
    ld      hl, SpriteColors_PlayerPlane_Right_Frame_1_Bottom
    ;otir
    ; 32x outi
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    
    ret

