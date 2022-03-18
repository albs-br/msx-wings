BlitSPRATR:
    ; do copy from buffer to VRAM
    ld      a, 0000 0001 b
    ld      hl, SPRATR
    call    SetVdp_Write
    ; ld      b, SpriteAttrTableBuffer.size
    ; ld      c, PORT_0        ; you can also write ld bc,#nn9B, which is faster
    ;ld      bc, 0 + ((SpriteAttrTableBuffer.size * 256) + PORT_0)
    ld      c, PORT_0
    ld      hl, SPRATR_Buffer
    ;otir
    ; 128x OUTI
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 
    outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi outi 

    ret