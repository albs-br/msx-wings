PORT_0: equ 0x98
PORT_1: equ 0x99
PORT_2: equ 0x9a
PORT_3: equ 0x9b


;RG0SAV  equ     0F3DFH     ; from MSX BIOS disassembled source (https://sourceforge.net/projects/msxsyssrc/)
;
; list of VDP registers and corresponding system variables:
; https://www.msx.org/wiki/Category:VDP_Registers
REG0SAV: equ 0xF3DF
REG1SAV: equ 0xF3E0
REG2SAV: equ 0xF3E1
REG3SAV: equ 0xF3E2
REG4SAV: equ 0xF3E3
REG5SAV: equ 0xF3E4
REG6SAV: equ 0xF3E5
REG7SAV: equ 0xF3E6

REG8SAV: equ 0xFFE7
REG9SAV: equ 0xFFE8

; TODO: include all registers

REG23SAV: equ 0xFFF6


REG25SAV: equ 0xFFFA
REG26SAV: equ 0xFFFB
REG27SAV: equ 0xFFFC
