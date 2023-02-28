; H.TIMI hook
HOOK:

	push	af ; Preserves VDP status register S#0 (a)

        ; ; set MegaROM page for SFX data
        ; ld      a, SFX_MEGAROM_PAGE
        ; ld	    (Seg_P8000_SW), a

        call    PT3_ROUT ; copia AYREGS a los registros del PSG
        call    ayFX_PLAY ; hace sonar los efectos de sonido

        ; ; Tricks BIOS' KEYINT to skip keyboard scan, TRGFLG, OLDKEY/NEWKEY, ON STRIG...
        ; xor		a
        ; ld		(BIOS_SCNCNT), a
        ; ld		(BIOS_INTCNT), a

	pop		af ; Restores VDP status register S#0 (a)

	ret