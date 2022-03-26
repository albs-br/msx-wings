#ram_watch   add     0xc001      -type byte      -desc Player_Y             -format dec
#ram_watch   add     0xc002      -type byte      -desc Player_Y_Static      -format dec
#ram_watch   add     0xc003      -type byte      -desc Player_SideMovementCounter      -format dec


ram_watch   add     0xc02c      -type byte      -desc Enemy_0_Y_Static     -format dec
ram_watch   add     0xc07c      -type byte      -desc Enemy_5_Y_Static     -format dec

#ram_watch   add     0xC01C      -type byte      -desc Enemy_Temp_Y_Static  -format dec

ram_watch   add     0xc101      -type byte      -desc Item_0_Status        -format dec
ram_watch   add     0xc102      -type byte      -desc Item_0_X             -format dec
ram_watch   add     0xc103      -type byte      -desc Item_0_Y             -format dec
ram_watch   add     0xc104      -type byte      -desc Item_0_Y_Static      -format dec

ram_watch   add     0xc151      -type byte      -desc Item_5_Status        -format dec
ram_watch   add     0xc152      -type byte      -desc Item_5_X             -format dec
ram_watch   add     0xc153      -type byte      -desc Item_5_Y             -format dec
ram_watch   add     0xc154      -type byte      -desc Item_5_Y_Static      -format dec

#Item_0_Struct: equ 0C101h ; last def. pass 3
#Item_5_Struct: equ 0C151h ; last def. pass 3


ram_watch   add     0xc185      -type byte      -desc Screen_Y_Origin      -format dec

#Enemy_0_Struct: equ 0C029h ; last def. pass 3
#Enemy_5_Struct: equ 0C079h ; last def. pass 3



#ram_watch   add      0xC0F4      -type byte      -desc Item_Temp_Y_Static       -format dec

#ram_watch   add     0xC0F4      -type byte      -desc VerticalScroll       -format dec

#ram_watch   add     0xc007      -type byte      -desc PShot_0_Status       -format dec
#ram_watch   add     0xc009      -type byte      -desc PShot_0_Y            -format dec

#ram_watch   add     0xc01f      -type word      -desc NextShot_Struct_Addr       -format hex
#ram_watch   add     0xc021      -type byte      -desc FramesSinceLastShot            -format dec


#ram_watch   add     0xc043      -type word      -desc LevelCounter          -format hex

#ram_watch   add     0xc060      -type byte      -desc Debug_Temp_Byte       -format dec
#ram_watch   add     0xc061      -type word      -desc Debug_Temp_Word       -format hex

#ram_watch   add     0xc047      -type byte      -desc Screen_Y_Origin       -format dec

#ram_watch   add     0xC081      -type byte      -desc ES_0_Status          -format dec
#ram_watch   add     0xc082      -type byte      -desc ES_0_X               -format dec
#ram_watch   add     0xc083      -type byte      -desc ES_0_Y               -format dec
#ram_watch   add     0xc084      -type byte      -desc ES_0_Y_Static        -format dec
#ram_watch   add     0xc085      -type byte      -desc ES_0_Y_Pat           -format dec
#ram_watch   add     0xc086      -type word      -desc ES_0_DX              -format hex
#ram_watch   add     0xc088      -type word      -desc ES_0_DY              -format hex
#ram_watch   add     0xc08a      -type word      -desc ES_0_SPRCOL          -format hex

#ram_watch   add     0xc026      -type byte      -desc En1_Status            -format dec

#ram_watch   add     0xC119      -type byte      -desc FramesSkipped     -format dec
