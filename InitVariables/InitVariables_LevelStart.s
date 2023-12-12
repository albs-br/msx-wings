InitVariables_LevelStart:

    ld      a, ENEMY_MODE_SMALL_ENEMIES
    ld      (EnemyMode), a

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


    ld      hl, BigEnemy_0_Struct
    call    BigEnemy_Reset
    ld      hl, BigEnemy_1_Struct
    call    BigEnemy_Reset

    xor     a
    ld      (BigEnemy_Animation_Counter), a

    ld      a, BIG_ENEMY_TYPE_1
    ld      (BigEnemy_Type), a



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




    xor     a
    ld      (Screen_Y_Origin), a
    ld      (FramesSkipped), a
    ld      (ItemAnimation_CurrentFrame), a
    ld      (PauseAnimation_Counter), a
    


    ld      hl, 0
    ld      (LevelCounter), hl
    ld      (PauseAnimation_TempAddr), hl




    ret