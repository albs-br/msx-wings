ram_watch   add     0xc001      -type byte      -desc Player_Y             -format dec
ram_watch   add     0xc002      -type byte      -desc Player_Y_Static      -format dec

#ram_watch   add     0xc022      -type word      -desc VerticalScroll       -format hex

#ram_watch   add     0xc007      -type byte      -desc PShot_0_Status       -format dec
#ram_watch   add     0xc009      -type byte      -desc PShot_0_Y            -format dec

#ram_watch   add     0xc01f      -type word      -desc NextShot_Struct_Addr       -format hex
#ram_watch   add     0xc021      -type byte      -desc FramesSinceLastShot            -format dec


#ram_watch   add     0xc043      -type word      -desc LevelCounter          -format hex

#ram_watch   add     0xc060      -type byte      -desc Debug_Temp_Byte       -format dec
#ram_watch   add     0xc061      -type word      -desc Debug_Temp_Word       -format hex

#ram_watch   add     0xc047      -type byte      -desc Screen_Y_Origin       -format dec

#ram_watch   add     0xC071      -type byte      -desc ES_0_Status          -format dec
#ram_watch   add     0xc072      -type byte      -desc ES_0_X               -format dec
#ram_watch   add     0xc073      -type byte      -desc ES_0_Y               -format dec
#ram_watch   add     0xc074      -type byte      -desc ES_0_Y_Static        -format dec
#ram_watch   add     0xc075      -type byte      -desc ES_0_Y_Pat           -format dec
#ram_watch   add     0xc076      -type word      -desc ES_0_DX              -format hex
#ram_watch   add     0xc078      -type word      -desc ES_0_DY              -format hex
#ram_watch   add     0xc07a      -type word      -desc ES_0_SPRCOL          -format hex

#ram_watch   add     0xc026      -type byte      -desc En1_Status            -format dec

ram_watch   add     0xC0e8      -type byte      -desc FramesSkipped     -format dec
