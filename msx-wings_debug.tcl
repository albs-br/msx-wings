#ram_watch   add     0xc001      -type byte      -desc Player_Y             -format dec
#ram_watch   add     0xc002      -type byte      -desc Player_Y_Static      -format dec
#ram_watch   add     0xc003      -type byte      -desc Player_SideMovementCounter      -format dec

ram_watch   add     0xc005      -type byte       -desc Player_Shot_Type      -format dec

ram_watch   add     0xC207      -type word       -desc LevelCounter      -format dec

ram_watch   add     0xc3cc      -type byte       -desc LevelInitAnimation_Counter      -format dec

#ram_watch   add     0xC190      -type byte       -desc GT0_Y_Static      -format dec

# ram_watch   add     0xC201      -type byte       -desc Screen_Y_Origin      -format dec
# ram_watch   add     0xC2cc      -type byte       -desc Output0      -format hex
# ram_watch   add     0xC2cd      -type byte       -desc Output1      -format hex
# ram_watch   add     0xC2ce      -type byte       -desc Output2      -format hex
# ram_watch   add     0xC2cf      -type byte       -desc Output3      -format hex
# ram_watch   add     0xC2cf      -type byte       -desc Output4      -format hex
# ram_watch   add     0xC2d0      -type byte       -desc Output5      -format hex
# ram_watch   add     0xC2d1      -type byte       -desc Output6      -format hex
# ram_watch   add     0xC2d2      -type byte       -desc Output7      -format hex

#GroundTarget_0_Struct: equ 0C18Dh ; last def. pass 3
#Screen_Y_Origin: equ 0C201h ; last def. pass 3




#ram_watch   add     0xc02c      -type byte      -desc Enemy_0_Y_Static     -format dec
#ram_watch   add     0xc07c      -type byte      -desc Enemy_5_Y_Static     -format dec

#ram_watch   add     0xC01C      -type byte      -desc Enemy_Temp_Y_Static  -format dec

#ram_watch   add     0xc103      -type byte      -desc Item_0_Status        -format dec
#ram_watch   add     0xc104      -type byte      -desc Item_0_X             -format dec
#ram_watch   add     0xc105      -type byte      -desc Item_0_Y             -format dec
#ram_watch   add     0xc106      -type byte      -desc Item_0_Y_Static      -format dec

#ram_watch   add     0xc153      -type byte      -desc Item_5_Status        -format dec
#ram_watch   add     0xc154      -type byte      -desc Item_5_X             -format dec
#ram_watch   add     0xc155      -type byte      -desc Item_5_Y             -format dec
#ram_watch   add     0xc156      -type byte      -desc Item_5_Y_Static      -format dec

#Item_0_Struct: equ 0C103h ; last def. pass 3
#Item_5_Struct: equ 0C153h ; last def. pass 3


#ram_watch   add     0xc185      -type byte      -desc Screen_Y_Origin      -format dec

#Enemy_0_Struct: equ 0C029h ; last def. pass 3
#Enemy_5_Struct: equ 0C079h ; last def. pass 3



#ram_watch   add      0xC0F4      -type byte      -desc Item_Temp_Y_Static       -format dec

#ram_watch   add     0xC0F4      -type byte      -desc VerticalScroll       -format dec

#ram_watch   add     0xc007      -type byte      -desc PShot_0_Status       -format dec
#ram_watch   add     0xc009      -type byte      -desc PShot_0_Y            -format dec

#ram_watch   add     0xc01f      -type word      -desc NextShot_Struct_Addr       -format hex
ram_watch   add     0xC234      -type byte      -desc FramesSkipped            -format dec




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
