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




    ld      a, 1
    ld      (GroundTarget_Temp_Status), a     ; Status

    ; ld      hl, 0
    ; ld      (GroundTarget_Temp_Frame_Counter), hl      ; reset frame counter


    ; TODO: do init stuff here


; .endlessLoop:
; jp .endlessLoop ; debug


.return:

    ld      hl, GroundTarget_Temp_Struct                        ; source
    ld      de, (LevelData_Temp_EnemyStruct_Addr)               ; destiny
    ld      bc, GroundTarget_Temp_Struct.size                   ; size
    ldir                                                        ; Copy BC bytes from HL to DE

    ret
