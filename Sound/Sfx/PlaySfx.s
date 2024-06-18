; Inputs:
;   A: number of sfx in the bank
;   C: sound priority (0-15) of sample. 0: min, 15: max
PlaySfx:

    ld      b, a ; save A

    ; set MegaROM page for SFX data
    ld      a, SFX_MEGAROM_PAGE
    ld	    (Seg_P8000_SW), a

    ld      a, b ; restore A

    ; ld      hl, MsxWingsSfx_Bank
    ; ;ld      a, 200
    ; ld      (ayFX_VOLUME), a
    ; call    ayFX_SETUP
   
    ; ld      a, 1;SFX_SHOT     ; number of sfx in the bank
    ; ld      c, 1            ; sound priority
    ;ld      a, b
    call    ayFX_INIT
    
    ; restore previous MegaROM page
    ld	    a, (Current_MegaROM_Page)
    ld	    (Seg_P8000_SW), a

    ; xor     a
    ; ld      (ayFX_VOLUME), a

    ret
