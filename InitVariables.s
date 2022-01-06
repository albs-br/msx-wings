InitVariables:

    ld      a, 100
    ld      (Player_X), a

    ld      a, 90
    ld      (Player_Y), a
    ld      (Player_Y_Static), a



    ; copy from initial sprite attributes to buffer
    ld      hl, InitialSpriteAttributes
    ld      de, SpriteAttrTableBuffer
    ld      bc, InitialSpriteAttributes.size
    ldir



    ret