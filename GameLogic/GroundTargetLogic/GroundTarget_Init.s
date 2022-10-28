; Input
;   DE: addr of level data struct
GroundTarget_Init:
    ; init Ground Target / load some data from Level Data Struct to Ground Target Struct

    ; Copy Level Data struct to temp Level Data struct
    ex      de, hl                                          ; HL receives addr of level data struct
    ;ld      hl, ?                                          ; source
    ld      de, LevelData_Temp_Struct                       ; destiny
    ld      bc, LevelData_Temp_Struct.size                  ; size
    ldir                                                    ; Copy BC bytes from HL to DE

    ; Copy Ground Target struct to temp Ground Target struct
    ld      hl, (LevelData_Temp_EnemyStruct_Addr)           ; source
    ld      de, GroundTarget_Temp_Struct                    ; destiny
    ld      bc, GroundTarget_Temp_Struct.size               ; size
    ldir                                                    ; Copy BC bytes from HL to DE



    ; ----------------------- ground target init logic here -----------------------

    ld      a, 1
    ld      (GroundTarget_Temp_Status), a     ; Status

    ; ld      hl, 0
    ; ld      (GroundTarget_Temp_Frame_Counter), hl      ; reset frame counter

    ; get initial X coord from level data struct
    ld      a, (LevelData_Temp_Initial_X)
    ld      (GroundTarget_Temp_X), a

    ld      a, (Screen_Y_Origin)
    ld      (GroundTarget_Temp_Y), a

    xor     a
    ld      (GroundTarget_Temp_Y_Static), a      ; Y static

    ; ld      a, PLAYER_SPR_PAT_0_NUMBER
    ; ld      (GroundTarget_Temp_Pattern_0), a     ; Pattern 0

    ld      a, 10
    ld      (GroundTarget_Temp_Health), a

    ld      a, (LevelData_Temp_ExtraData_Addr)
    ld      (GroundTarget_Temp_Has_Item), a


    ; Load ground target colors
    ld      a, 0000 0001 b
    ld      hl, GROUND_TARGET_SPRCOL_ADDR
    call    SetVdp_Write
    ld      c, PORT_0
    ld      hl, SpriteColors_GroundTarget_0
    ; 32x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 



    ; Ground target sprite attributes
    ; ld      a, (LevelData_Temp_Initial_X)
    ; ld      (GroundTarget_Sprite.X), a

    ; ld      a, (Screen_Y_Origin)
    ; ld      (GroundTarget_Sprite.Y), a

    ; ld      a, PLAYER_SPR_PAT_0_NUMBER
    ; ld      (GroundTarget_Sprite.PatternNumber), a


.return:

    ld      hl, GroundTarget_Temp_Struct                        ; source
    ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, GroundTarget_Temp_Struct.size                   ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret
