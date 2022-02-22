; Inputs:
;   A: number of sfx in the bank
;   C: sound priority (0-15) of sample
PlaySfx:
    ; ld      hl, MsxWingsSfx_Bank
    ; ;ld      a, 200
    ; ld      (ayFX_VOLUME), a
    ; call    ayFX_SETUP
    
    ; ld      a, 1;SFX_SHOT     ; number of sfx in the bank
    ; ld      c, 1            ; sound priority
    ;ld      a, b
    call    ayFX_INIT
    
    ; xor     a
    ; ld      (ayFX_VOLUME), a

    ret



InitAyFxVariables:
    ; Init all vars with 255 to avoid noise
    ld      a, 255
    ld      hl, ayFX_Variables
    ld      b, ayFX_Variables.size
.loop:
    ld      (hl), a
    inc     hl
    djnz    .loop    
    ret
