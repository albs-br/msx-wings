PLAYER_INITIAL_X:               equ 128 - (PLANE_PLAYER_WIDTH/2)
PLAYER_INITIAL_Y:               equ 192 - 32

PLAYER_SHOT_LEVEL_0:            equ 0   ; single width; thin pattern
PLAYER_SHOT_LEVEL_1:            equ 1   ; single width; fat pattern
PLAYER_SHOT_LEVEL_2:            equ 2   ; double width; thin pattern
PLAYER_SHOT_LEVEL_3:            equ 3   ; double width; fat pattern

PLAYER_SHOT_WIDTH_SINGLE:       equ 0
PLAYER_SHOT_WIDTH_DOUBLE:       equ 1

InitVariables:


    ld      hl, (BIOS_JIFFY)                    ; msx bios time variable
    ld      a, l
    or      0x80                                ; a value different of zero is granted
    ld      (Seed), a
    ld      a, h
    ld      (Seed + 1), a

    ld      a, PLAYER_INITIAL_X
    ld      (Player_X), a

    ld      a, PLAYER_INITIAL_Y
    ld      (Player_Y), a
    ld      (Player_Y_Static), a

    ld      a, 0
    ld      (Player_Shot_Level), a

    ld      a, PLAYER_SHOT_WIDTH_SINGLE
    ld      (Player_Shot_Width), a

    ld      a, 128
    ld      (Player_SideMovementCounter), a

    ld      a, PLAYER_SPR_PAT_0_NUMBER      ; set sprite pattern for plane still (not moving sideways)
    ld      (Player_SpritePatternNumber), a

    ld      hl, PlayerShot_0_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_1_Struct
    call    PlayerShot_Reset
    ld      hl, PlayerShot_2_Struct
    call    PlayerShot_Reset
    ; ld      hl, PlayerShot_3_Struct
    ; call    PlayerShot_Reset
    ; ld      hl, PlayerShot_4_Struct
    ; call    PlayerShot_Reset
    ; ld      hl, PlayerShot_5_Struct
    ; call    PlayerShot_Reset


    ld      hl, Enemy_0_Struct
    call    Enemy_Reset
    ld      hl, Enemy_1_Struct
    call    Enemy_Reset
    ld      hl, Enemy_2_Struct
    call    Enemy_Reset
    ld      hl, Enemy_3_Struct
    call    Enemy_Reset
    ld      hl, Enemy_4_Struct
    call    Enemy_Reset
    ld      hl, Enemy_5_Struct
    call    Enemy_Reset
    ld      hl, Enemy_6_Struct
    call    Enemy_Reset


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


    ld      hl, Item_0_Struct
    call    Item_Reset
    ld      hl, Item_1_Struct
    call    Item_Reset
    ld      hl, Item_2_Struct
    call    Item_Reset
    ld      hl, Item_3_Struct
    call    Item_Reset
    ld      hl, Item_4_Struct
    call    Item_Reset
    ld      hl, Item_5_Struct
    call    Item_Reset
    ld      hl, Item_6_Struct
    call    Item_Reset


    ld      hl, GroundTarget_0_Struct
    call    GroundTarget_Reset
    ld      hl, GroundTarget_1_Struct
    call    GroundTarget_Reset
    ld      hl, GroundTarget_2_Struct
    call    GroundTarget_Reset
    ld      hl, GroundTarget_3_Struct
    call    GroundTarget_Reset
    ld      hl, GroundTarget_4_Struct
    call    GroundTarget_Reset
    ld      hl, GroundTarget_5_Struct
    call    GroundTarget_Reset


    ; load first shot struct addr
    ld      hl, PlayerShot_0_Struct
    ld      (NextShot_Struct_Addr), hl

    ld      a, 255
    ld      (Player_FramesSinceLastShot), a


    xor     a
    ld      (Screen_Y_Origin), a
    ld      (FramesSkipped), a
    ld      (ItemAnimation_CurrentFrame), a


    ld      hl, 0
    ld      (LevelCounter), hl





    call    InitAyFxVariables



    ; --------- Ground target item
    ; copy from initial HMMM parameters to buffer
    ld      hl, GroundTarget_HMMM_Parameters
    ld      de, VDP_HMMM_Params_Buffer
    ;ld      bc, HMMM_Parameters_size
    ;ldir
    ;HMMM_Parameters_size: equ 0Fh ; last def. pass 3
    ; 15x LDI
    ldi ldi ldi ldi ldi ldi ldi ldi 
    ldi ldi ldi ldi ldi ldi ldi



    ; copy from initial sprite attributes to buffer
    ld      hl, InitialSpriteAttributes
    ld      de, SPRATR_Buffer
    ld      bc, InitialSpriteAttributes.size
    ldir



    ret