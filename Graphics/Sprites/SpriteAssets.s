PaletteData:
    INCBIN "Graphics/Sprites/msx-wings.pal"

    ; ;  data 1 (red 0-7; blue 0-7); data 2 (0000; green 0-7)
    ; db 0x00, 0x00 ; Color index 0
    ; db 0x77, 0x00 ; Color index 1
    ; db 0x10, 0x00 ; Color index 2
    ; db 0x20, 0x00 ; Color index 3
    ; db 0x30, 0x00 ; Color index 4
    ; db 0x40, 0x00 ; Color index 5
    ; db 0x50, 0x00 ; Color index 6
    ; db 0x60, 0x00 ; Color index 7
    ; db 0x70, 0x00 ; Color index 8
    ; db 0x11, 0x01 ; Color index 9
    ; db 0x22, 0x02 ; Color index 10
    ; db 0x33, 0x03 ; Color index 11
    ; db 0x77, 0x07 ; Color index 12
    ; db 0x66, 0x06 ; Color index 13
    ; db 0x55, 0x05 ; Color index 14
    ; db 0x44, 0x04 ; Color index 15


; ------------------------------ Patterns

SpritePattern_PlayerPlane_0_and_1:
    INCBIN "Graphics/Sprites/player_plane_0.pat"
.size:  equ $ - SpritePattern_PlayerPlane_0_and_1
SpritePattern_PlayerPlane_2_and_3:
    INCBIN "Graphics/Sprites/player_plane_1.pat"
.size:  equ $ - SpritePattern_PlayerPlane_2_and_3

SpritePattern_PlayerShot:
    INCLUDE "Graphics/Sprites/player_shot_pattern.s"
.size:  equ $ - SpritePattern_PlayerShot

SpritePattern_EnemyPlane_0_and_1:
    INCBIN "Graphics/Sprites/enemy_plane.pat"
.size:  equ $ - SpritePattern_EnemyPlane_0_and_1

SpritePattern_Explosion_Frames_0_to_2:
    INCLUDE "Graphics/Sprites/explosion_frames_patterns.s"
.size:  equ $ - SpritePattern_Explosion_Frames_0_to_2

SpritePattern_EnemyShot_0_and_1:
    INCLUDE "Graphics/Sprites/enemy_shot_patterns.s"
.size:  equ $ - SpritePattern_EnemyShot_0_and_1

; ------------------------------ Colors

SpriteColors_PlayerPlane_0_and_1:
    INCBIN "Graphics/Sprites/player_plane_0.col"
.size:  equ $ - SpriteColors_PlayerPlane_0_and_1
SpriteColors_PlayerPlane_2_and_3:
    INCBIN "Graphics/Sprites/player_plane_1.col"
.size:  equ $ - SpriteColors_PlayerPlane_2_and_3

SpriteColors_PlayerShot:
    INCLUDE "Graphics/Sprites/player_shot_color.s"
.size:  equ $ - SpriteColors_PlayerShot

SpriteColors_EnemyPlane_0_and_1:
    INCBIN "Graphics/Sprites/enemy_plane.col"
.size:  equ $ - SpriteColors_EnemyPlane_0_and_1

SpriteColors_Explosion_Frames_0_to_2:
    INCLUDE "Graphics/Sprites/explosion_frames_colors.s"
.size:  equ $ - SpriteColors_Explosion_Frames_0_to_2

SpriteColors_EnemyShot_0_to_2:
    INCLUDE "Graphics/Sprites/enemy_shot_colors.s"
.size:  equ $ - SpriteColors_EnemyShot_0_to_2
