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


; ------------------------------ Patterns  ------------------------------

; Player plane
; Center
SpritePattern_PlayerPlane_0_and_1:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_top.pat"
.size:  equ $ - SpritePattern_PlayerPlane_0_and_1
SpritePattern_PlayerPlane_2_and_3:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_bottom.pat"
.size:  equ $ - SpritePattern_PlayerPlane_2_and_3

SpritePattern_PlayerPlane_Left_Frame_0_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_0_top.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Left_Frame_0_Top
SpritePattern_PlayerPlane_Left_Frame_0_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_0_bottom.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Left_Frame_0_Bottom

SpritePattern_PlayerPlane_Left_Frame_1_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_1_top.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Left_Frame_1_Top
SpritePattern_PlayerPlane_Left_Frame_1_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_1_bottom.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Left_Frame_1_Bottom

SpritePattern_PlayerPlane_Right_Frame_0_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_0_top.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Right_Frame_0_Top
SpritePattern_PlayerPlane_Right_Frame_0_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_0_bottom.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Right_Frame_0_Bottom

SpritePattern_PlayerPlane_Right_Frame_1_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_1_top.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Right_Frame_1_Top
SpritePattern_PlayerPlane_Right_Frame_1_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_1_bottom.pat"
.size:  equ $ - SpritePattern_PlayerPlane_Right_Frame_1_Bottom



; Player shot
SpritePattern_PlayerShot_Thin:
    INCLUDE "Graphics/Sprites/PlayerShot/player_shot_pattern_thin.s"
.size:  equ $ - SpritePattern_PlayerShot_Thin

SpritePattern_PlayerShot_Wide:
    INCLUDE "Graphics/Sprites/PlayerShot/player_shot_pattern_wide.s"
.size:  equ $ - SpritePattern_PlayerShot_Wide



; Enemy plane
SpritePattern_EnemyPlane_Frame_0_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_0.pat"
.size:  equ $ - SpritePattern_EnemyPlane_Frame_0_Patterns_0_and_1

SpritePattern_EnemyPlane_Frame_1_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_1.pat"
.size:  equ $ - SpritePattern_EnemyPlane_Frame_1_Patterns_0_and_1

SpritePattern_EnemyPlane_Frame_2_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_2.pat"
.size:  equ $ - SpritePattern_EnemyPlane_Frame_2_Patterns_0_and_1

SpritePattern_EnemyPlane_Frame_3_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_3.pat"
.size:  equ $ - SpritePattern_EnemyPlane_Frame_3_Patterns_0_and_1

SpritePattern_EnemyPlane_Frame_4_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_4.pat"
.size:  equ $ - SpritePattern_EnemyPlane_Frame_4_Patterns_0_and_1

SpritePattern_EnemyPlane_Frame_5_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_5.pat"
.size:  equ $ - SpritePattern_EnemyPlane_Frame_5_Patterns_0_and_1



; Enemy plane turning
SpritePattern_EnemyPlaneTurning_Frame_0_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_0.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_0_Patterns_0_and_1

SpritePattern_EnemyPlaneTurning_Frame_1_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_1.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_1_Patterns_0_and_1

SpritePattern_EnemyPlaneTurning_Frame_2_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_2.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_2_Patterns_0_and_1

SpritePattern_EnemyPlaneTurning_Frame_3_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_3.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_3_Patterns_0_and_1

SpritePattern_EnemyPlaneTurning_Frame_4_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_4.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_4_Patterns_0_and_1

SpritePattern_EnemyPlaneTurning_Frame_5_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_5.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_5_Patterns_0_and_1

SpritePattern_EnemyPlaneTurning_Frame_6_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_6.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_6_Patterns_0_and_1

SpritePattern_EnemyPlaneTurning_Frame_7_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_7.pat"
.size:  equ $ - SpritePattern_EnemyPlaneTurning_Frame_7_Patterns_0_and_1



; Explosion
SpritePattern_Explosion_Frames_0_to_2:
    INCLUDE "Graphics/Sprites/Explosion/explosion_frames_patterns.s"
.size:  equ $ - SpritePattern_Explosion_Frames_0_to_2



; Enemy shot
SpritePattern_EnemyShot_0_and_1:
    INCLUDE "Graphics/Sprites/EnemyShot/enemy_shot_patterns.s"
.size:  equ $ - SpritePattern_EnemyShot_0_and_1



; Item P
SpritePattern_Item_P_Frames_0_to_7:
    INCLUDE "Graphics/Sprites/Item_P/item_p_patterns.s"
.size:  equ $ - SpritePattern_Item_P_Frames_0_to_7



; Ground target
SpritePattern_GroundTarget_0:
    INCLUDE "Graphics/Sprites/GroundTarget/ground_target_pattern_0.s"
.size:  equ $ - SpritePattern_GroundTarget_0


; ------------------------------ Colors  ------------------------------

; Player plane
; Center
SpriteColors_PlayerPlane_0_and_1:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_top.col"
.size:  equ $ - SpriteColors_PlayerPlane_0_and_1
SpriteColors_PlayerPlane_2_and_3:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_bottom.col"
.size:  equ $ - SpriteColors_PlayerPlane_2_and_3


SpriteColors_PlayerPlane_Left_Frame_0_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_0_top.col"
.size:  equ $ - SpriteColors_PlayerPlane_Left_Frame_0_Top
SpriteColors_PlayerPlane_Left_Frame_0_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_0_bottom.col"
.size:  equ $ - SpriteColors_PlayerPlane_Left_Frame_0_Bottom

SpriteColors_PlayerPlane_Left_Frame_1_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_1_top.col"
.size:  equ $ - SpriteColors_PlayerPlane_Left_Frame_1_Top
SpriteColors_PlayerPlane_Left_Frame_1_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_left_1_bottom.col"
.size:  equ $ - SpriteColors_PlayerPlane_Left_Frame_1_Bottom

SpriteColors_PlayerPlane_Right_Frame_0_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_0_top.col"
.size:  equ $ - SpriteColors_PlayerPlane_Right_Frame_0_Top
SpriteColors_PlayerPlane_Right_Frame_0_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_0_bottom.col"
.size:  equ $ - SpriteColors_PlayerPlane_Right_Frame_0_Bottom

SpriteColors_PlayerPlane_Right_Frame_1_Top:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_1_top.col"
.size:  equ $ - SpriteColors_PlayerPlane_Right_Frame_1_Top
SpriteColors_PlayerPlane_Right_Frame_1_Bottom:
    INCBIN "Graphics/Sprites/PlayerPlane/player_plane_right_1_bottom.col"
.size:  equ $ - SpriteColors_PlayerPlane_Right_Frame_1_Bottom



; Player shot
SpriteColors_PlayerShot:
    INCLUDE "Graphics/Sprites/PlayerShot/player_shot_color.s"
.size:  equ $ - SpriteColors_PlayerShot



; Enemy plane
SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_0.col"
.size:  equ $ - SpriteColors_EnemyPlane_Frame_0_Patterns_0_and_1

SpriteColors_EnemyPlane_Frame_1_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_1.col"
.size:  equ $ - SpriteColors_EnemyPlane_Frame_1_Patterns_0_and_1

SpriteColors_EnemyPlane_Frame_2_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_2.col"
.size:  equ $ - SpriteColors_EnemyPlane_Frame_2_Patterns_0_and_1

SpriteColors_EnemyPlane_Frame_3_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_3.col"
.size:  equ $ - SpriteColors_EnemyPlane_Frame_3_Patterns_0_and_1

SpriteColors_EnemyPlane_Frame_4_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_4.col"
.size:  equ $ - SpriteColors_EnemyPlane_Frame_4_Patterns_0_and_1

SpriteColors_EnemyPlane_Frame_5_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlane/enemy_plane_5.col"
.size:  equ $ - SpriteColors_EnemyPlane_Frame_5_Patterns_0_and_1



; Enemy plane turning
SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_0.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_0_Patterns_0_and_1

SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_1.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_1_Patterns_0_and_1

SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_2.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_2_Patterns_0_and_1

SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_3.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_3_Patterns_0_and_1

SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_4.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_4_Patterns_0_and_1

SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_5.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_5_Patterns_0_and_1

SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_6.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_6_Patterns_0_and_1

SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1:
    INCBIN "Graphics/Sprites/EnemyPlaneTurning/enemy_plane_turning_7.col"
.size:  equ $ - SpriteColors_EnemyPlaneTurning_Frame_7_Patterns_0_and_1



; Explosion
SpriteColors_Explosion_Frames_0_to_2:
    INCLUDE "Graphics/Sprites/Explosion/explosion_frames_colors.s"
.size:  equ $ - SpriteColors_Explosion_Frames_0_to_2



; Enemy shot
SpriteColors_EnemyShot_0_to_2:
    INCLUDE "Graphics/Sprites/EnemyShot/enemy_shot_colors.s"
.size:  equ $ - SpriteColors_EnemyShot_0_to_2



; Item P
SpriteColors_Item_P_Frame_0:
    INCLUDE "Graphics/Sprites/Item_P/item_p_colors.s"
.size:  equ $ - SpriteColors_Item_P_Frame_0



; Ground target
SpriteColors_GroundTarget_0:
    INCLUDE "Graphics/Sprites/GroundTarget/ground_target_colors_0.s"
.size:  equ $ - SpriteColors_GroundTarget_0

