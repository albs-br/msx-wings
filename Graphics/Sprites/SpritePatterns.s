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

SpritePattern_PlayerShot_Fat:
    INCLUDE "Graphics/Sprites/PlayerShot/player_shot_pattern_fat.s"
.size:  equ $ - SpritePattern_PlayerShot_Fat



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



; Big Enemy chopper
SpritePattern_EnemyChopper_Frame_0_TopLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_0_top_left.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_0_TopLeft

SpritePattern_EnemyChopper_Frame_0_TopRight: ; 1 sprite 
; (this one is assembly source code, not binary - should use INCLUDE instead of INCBIN)
    INCLUDE "Graphics/Sprites/EnemyChopper/enemy_chopper_0_top_right-patterns.s"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_0_TopRight

SpritePattern_EnemyChopper_Frame_0_BottomLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_0_bottom_left.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_0_BottomLeft

SpritePattern_EnemyChopper_Frame_0_BottomRight: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_0_bottom_right.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_0_BottomRight

SpritePattern_EnemyChopper_Frame_1_TopLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_1_top_left.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_1_TopLeft

SpritePattern_EnemyChopper_Frame_1_TopRight: ; 1 sprite 
; (this one is assembly source code, not binary - should use INCLUDE instead of INCBIN)
    INCLUDE "Graphics/Sprites/EnemyChopper/enemy_chopper_1_top_right-patterns.s"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_1_TopRight

SpritePattern_EnemyChopper_Frame_1_BottomLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_1_bottom_left.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_1_BottomLeft

SpritePattern_EnemyChopper_Frame_1_BottomRight: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_1_bottom_right.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_1_BottomRight

SpritePattern_EnemyChopper_Frame_2_TopLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_2_top_left.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_2_TopLeft

SpritePattern_EnemyChopper_Frame_2_TopRight: ; 1 sprite 
; (this one is assembly source code, not binary - should use INCLUDE instead of INCBIN)
    INCLUDE "Graphics/Sprites/EnemyChopper/enemy_chopper_2_top_right-patterns.s"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_2_TopRight

SpritePattern_EnemyChopper_Frame_2_BottomLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_2_bottom_left.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_2_BottomLeft

SpritePattern_EnemyChopper_Frame_2_BottomRight: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyChopper/enemy_chopper_2_bottom_right.pat"
.size:  equ $ - SpritePattern_EnemyChopper_Frame_2_BottomRight



; Big Enemy tank
SpritePattern_EnemyTank_Frame_0_TopLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyTank/tank_top_left.pat"
.size:  equ $ - SpritePattern_EnemyTank_Frame_0_TopLeft

SpritePattern_EnemyTank_Frame_0_TopRight: ; 1 sprite 
; (this one is assembly source code, not binary - should use INCLUDE instead of INCBIN)
    INCLUDE "Graphics/Sprites/EnemyTank/tank_top_right-patterns.s"
.size:  equ $ - SpritePattern_EnemyTank_Frame_0_TopRight

SpritePattern_EnemyTank_Frame_0_BottomLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyTank/tank_bottom_left.pat"
.size:  equ $ - SpritePattern_EnemyTank_Frame_0_BottomLeft

SpritePattern_EnemyTank_Frame_0_BottomRight: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyTank/tank_bottom_right.pat"
.size:  equ $ - SpritePattern_EnemyTank_Frame_0_BottomRight



; Big Enemy hovercraft
SpritePattern_EnemyHovercraft_Frame_0_TopLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_0_top_left.pat"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_0_TopLeft

SpritePattern_EnemyHovercraft_Frame_0_TopRight: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_0_top_right.pat"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_0_TopRight

SpritePattern_EnemyHovercraft_Frame_0_BottomLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_0_bottom_left.pat"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_0_BottomLeft

SpritePattern_EnemyHovercraft_Frame_0_BottomRight: ; 1 sprite
    ; INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_0_bottom_right.pat"
; (this one is assembly source code, not binary - should use INCLUDE instead of INCBIN)
    INCLUDE "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_0_bottom_right-patterns.s"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_0_BottomRight

SpritePattern_EnemyHovercraft_Frame_1_TopLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_1_top_left.pat"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_1_TopLeft

SpritePattern_EnemyHovercraft_Frame_1_TopRight: ; 2 sprites 
    INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_1_top_right.pat"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_1_TopRight

SpritePattern_EnemyHovercraft_Frame_1_BottomLeft: ; 2 sprites
    INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_1_bottom_left.pat"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_1_BottomLeft

SpritePattern_EnemyHovercraft_Frame_1_BottomRight: ; 1 sprites
    ; INCBIN "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_1_bottom_right.pat"
; (this one is assembly source code, not binary - should use INCLUDE instead of INCBIN)
    INCLUDE "Graphics/Sprites/EnemyHovercraft/enemy_hovercraft_frame_1_bottom_right-patterns.s"
.size:  equ $ - SpritePattern_EnemyHovercraft_Frame_1_BottomRight



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



; Item Bomb
SpritePattern_Item_Bomb_Frames_0_to_7:
    INCLUDE "Graphics/Sprites/Item_Bomb/item_bomb_patterns.s"
.size:  equ $ - SpritePattern_Item_Bomb_Frames_0_to_7



; Ground target
SpritePattern_GroundTarget_0:
    INCLUDE "Graphics/Sprites/GroundTarget/ground_target_pattern_0.s"
.size:  equ $ - SpritePattern_GroundTarget_0



; 1000 points
SpritePattern_1000_points:
    INCLUDE "Graphics/Sprites/GroundTarget/1000_points_pattern.s"
.size:  equ $ - SpritePattern_1000_points



SpritePatterns_size: equ $ - SpritePattern_PlayerPlane_0_and_1 ; 2,8kb