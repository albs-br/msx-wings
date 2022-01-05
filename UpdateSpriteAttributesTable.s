UpdateSpriteAttributesTable:
    ld      hl, SpriteAttrTableBuffer


    ; Sprite # 0
    ld      a, (Player_Y)
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 1
    inc     hl
    ld      a, (Player_Y)
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 2
    inc     hl
    ld      a, (Player_Y)
    ld      b, 16
    add     a, b
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; Sprite # 3
    inc     hl
    ld      a, (Player_Y)
    ld      b, 16
    add     a, b
    ld      (hl), a

    inc     hl
    ld      a, (Player_X)
    ld      (hl), a

    inc     hl
    ; ld      a, PLANE_SPR_PAT_NUMBER_0
    ; ld      (hl), a

    inc     hl
    ; ld      a, 0
    ; ld      (hl), a

; ----------------------------------------

    ; do copy from buffer to VRAM
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ld      b, SpriteAttrTableBuffer.size
    ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ld      hl, SpriteAttrTableBuffer
    otir




    ret