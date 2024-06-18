; H.TIMI hook
HOOK:

	push	af ; Preserves VDP status register S#0 (a)

		; Invokes the replayer (with frameskip in 60Hz machines)
		ld	a, [frames_per_tenth]
		cp	5
		jr	z, .NO_FRAMESKIP ; No frameskip (50Hz machine)

		; Checks frameskip (60Hz machine)
		; ld	a, 6 ; (unnecessary)
		ld	hl, replayer.frameskip
		inc	[hl]
		sub	[hl]
		jr	nz, .NO_FRAMESKIP ; No framewksip

		; Resets frameskip counter
		; xor	a ; (unnecessary)
		ld	[hl], a
		jp	.FRAMESKIP ; JP without conditions is always faster than JR

	.NO_FRAMESKIP:

        ; set MegaROM page for SFX data
        ld      a, SFX_MEGAROM_PAGE
        ld	    (Seg_P8000_SW), a

		; Executes a frame of the replayer
		call	REPLAYER.FRAME

        ; restore previous MegaROM page
        ld	    a, (Current_MegaROM_Page)
        ld	    (Seg_P8000_SW), a

	.FRAMESKIP:

		; ; Reads the inputs
		; 	IFDEF CFG_HOOK_ENABLE_AUTO_KEYBOARD
		; 		call	READ_KEYBOARD
		; 	ENDIF ; CFG_HOOK_ENABLE_AUTO_KEYBOARD

		; 	IFEXIST CFG_HOOK_DISABLE_AUTO_INPUT
		; 	ELSE
		; 		call	READ_INPUT
		; 	ENDIF ; CFG_HOOK_DISABLE_AUTO_INPUT

		; ; Tricks BIOS' KEYINT to skip keyboard scan, TRGFLG, OLDKEY/NEWKEY, ON STRIG...
		; xor	a
		; ld	[BIOS_SCNCNT], a
		; ld	[BIOS_INTCNT], a

	pop	af ; Restores VDP status register S#0 (a)


	ret