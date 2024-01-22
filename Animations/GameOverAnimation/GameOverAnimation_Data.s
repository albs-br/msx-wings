GameOverAnimation_sprite_structs_Init:

    ;          yEnd, counterStart,     xEnd, pattern number
    
    ; G
    db      62     ,            0,  58     , 16 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,           20,  58     , 17 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,        0 + 4,  58 + 16, 18 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,       20 + 4,  58 + 16, 19 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
     
    ; A     
    db      62     ,            4,  94     , 12 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,           24,  94     , 13 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,        4 + 4,  94 + 16, 14 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,       24 + 4,  94 + 16, 15 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
     
    ; M     
    db      62     ,            8, 130     ,  0 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,           28, 130     ,  1 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,        8 + 4, 130 + 16,  2 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,       28 + 4, 130 + 16,  3 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
     
    ; E     
    db      62     ,           12, 166     , 20 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,           32, 166     , 21 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62     ,       12 + 4, 166 + 16, 22 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      62 + 16,       32 + 4, 166 + 16, 23 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; O
    db      98     ,           16,  58     ,  4 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,           36,  58     ,  5 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,       16 + 4,  58 + 16,  6 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,       36 + 4,  58 + 16,  7 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; V
    db      98     ,           20,  94     ,  8 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,           40,  94     ,  9 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,       20 + 4,  94 + 16, 10 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,       40 + 4,  94 + 16, 11 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; E
    db      98     ,           24, 130     , 20 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,           44, 130     , 21 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,       24 + 4, 130 + 16, 22 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,       44 + 4, 130 + 16, 23 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

    ; R
    db      98     ,           28, 166     , 24 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,           48, 166     , 25 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98     ,       28 + 4, 166 + 16, 26 * 4     dw LOOKUP_TABLE_CIRCLE_MOV
    db      98 + 16,       48 + 4, 166 + 16, 27 * 4     dw LOOKUP_TABLE_CIRCLE_MOV

.size: equ $ - GameOverAnimation_sprite_structs_Init
