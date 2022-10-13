	include "earth_constants.asm"
	include "earth_macro.asm"

	include "data/6D42-6EF3__SCROLLER.asm"
	include "data/6EF4-72FD__MUSIC_WELLDONE.asm"

  
  defb $ff,$ff
  

	include "data/7300-75FF__ATTRIB_TELEPORT.asm"
	include "data/unknown_7600-7EFF.asm"

    	include "code/7F00-7F5F___UNKNOWN.asm"
    	include "code/7F60-7F79___UNKNOWN.asm"
    	include "code/7F7A-7FF2___UNKNOWN.asm"
	include "code/7FF3-7FF9___UNKNOWN.asm"


L7ffa:
  defb $00
word_7FFB:
  defb $00
L_7FFC:
  defb $00
IS_PLAYER_KILLED:  
  defb $00
byte_7FFE:
  defb $00
byte_7FFF
  defb $00
  

	include "data/8000-803F__COLORED_SPRITES.asm"

	include "code/8040-8058__show_spritecell.asm"
	include "code/8059-8074__draw_map_picture.asm"


L8075:
  xor a
  jp Le7f5


	include "code/8079-80DA___UNKNOWN.asm"
	include "code/80DB-8116___UNKNOWN.asm"
	include "code/8117-6155___UNKNOWN.asm"
	include "code/8156-8179__play_gravity.asm"
	include "code/817A-81A6__remove_waves.asm"


; Unused
L81a7:
  defb $00,$00,$00,$00,$00


	include "code/81AC-81B8__validate_unpacked.asm"
	include "code/81B9-81CB__find_attr_HL.asm"
	include "code/81CC-81E6__draw_map_colors.asm"
	include "code/81E7-820F__animate_exit_flash.asm"
	include "code/8210-8219__draw_map_only.asm"
	include "code/821A-8227__clear_vars_and_level.asm"
	include "code/8228-8233___UNKNOWN.asm"


	; unused
L8234:
	pop     hl
	dec     hl
	ld      a, 4
	cp      h
	jr      nz, loc_822C+2
	ret


	include "code/823C-824F__play_xxx_beep.asm"


L8250:
  jp Le7e5


	include "code/8253-8263___UNKNOWN.asm"


	; unused
L8264:
  defb $c9


	include "code/8265-8277__find_attr_DE.asm"


; Unused
L8278:
  defs $3e


	include "code/82B6-82E5__unpack_level.asm"
	include "code/82E6-82F8__set_variables.asm"
	include "code/82F9-8314__play_bleep.asm"
	include "code/8315-8329__increase_score.asm"
	include "code/832A-8341__print_number.asm"
	include "code/8342-834E__print_scoreinfo.asm"
	include "code/834F-8369__print_string.asm"
	include "code/836A-8375__print_info_line.asm"
	include "code/8376-8381__score_crystal.asm"
	include "code/8382-838D__player_to_map.asm"
    	include "code/838E-8393__init_player_animation.asm"
	include "code/8394-83C2__collect_crystal.asm"
	include "code/83C3-8436__is_left_pressed.asm"
	include "code/8437-84AC__is_right_pressed.asm"
	include "code/84AD-84F8__is_up_pressed.asm"
	include "code/84F9-8547__is_down_pressed.asm"
	include "code/8548-8555__play_walk_beep.asm"
	include "code/8556-8594__check_movement.asm"
	include "code/8595-85AC__crystal_collected.asm"
	include "code/85AD-85CE__print_info_numbers.asm"
	include "code/85CF-85D5__game_init.asm"
	include "code/85D6-85F0__level_init.asm"
	include "code/85F1-860D__prepare_game.asm"
	include "code/860E-861E__fade_attributes.asm"
	include "code/861F-862D__clear_bitmap.asm"
	include "code/862E-8642__play_ouch.asm"

	; unused
L8643:
  defb $c9,$00,$00,$00,$00,$00,$00,$00
  defb $00,$e8,$1d,$7b,$fe,$01,$20,$dd
  defb $c9


	include "code/8654-8670__init_timeline.asm"


; Unused
L8671:
  defs $16


	include "code/8687-8690___UNKNOWN.asm"
	include "code/8691-86AC__decrease_timeline.asm"
	include "code/86AD-86D2__play_failed_beep.asm"


; Unused
L86d3:
  defs $0b


	include "code/86DE-8701__check_timeout.asm"
	include "code/8702-871B__time_to_score.asm"
	include "code/871C-872A__play_scoretime.asm"


; Unused
L872b:
  defb $00,$00


	include "code/872D-8758__check_quit_screen.asm"
	include "code/8759-876A__is_fire_pressed.asm"
	include "code/876B-87C2__is_2left_pressed.asm"
	include "code/87C3-881C__is_2right_pressed.asm"
	include "code/881D-8848__is_2up_pressed.asm"
	include "code/8849-8877__is_2down_pressed.asm"
	include "code/8878-8884__check_pressed_dir.asm"
	include "code/8885-88CD__process_level.asm"
	include "code/88CE-895C__muz_player.asm"
	include "code/895D-895F__choose_level_music.asm"
	include "code/8960-8963___UNKNOWN.asm"
	include "code/8964-8978___UNKNOWN.asm"
	include "code/8979-89A6__draw_menu_pic.asm"
	include "code/89A7-89E9__level_intro.asm"
	include "code/89EA-89F3__do_one_level.asm"
	include "code/89F4-8A34__play_a_level.asm"
	include "code/8A35-8A3B__play_main_note.asm"
	include "code/8A3C-8A73__print_main_menu.asm"
	include "code/8A74-8A82__colorize_string.asm"
	include "code/8A83-8AAB__color_menu_text.asm"
	include "code/8AAC-8AC7___UNKNOWN.asm"
	include "code/8AC8-8AEA__show_main_menu.asm"
	include "code/8AEB-8B1F__scroller.asm"
	include "code/8B20-8B57__main_menu_loop.asm"


L8b58:
  defb $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00


	include "code/8B65-8B74__check_menu_quit.asm"
  

  defb $00,$00,$00


    	include "code/8B78-8B7E__play_gameover_music.asm"
	include "code/8B7F-8BD4__print_game_over.asm"
	include "code/8BD5-8BE4__show_gameover.asm"
	include "code/8BE5-8BEB___UNKNOWN.asm"
	include "code/8BEC-8C0D__show_lvl_intro.asm"
	include "code/8C0E-8C1C___UNKNOWN.asm"
	include "code/8C1D-8C2F__scan_keyboard.asm"
	include "code/8C30-8D45__redefine_keys.asm"
	include "code/8D46-8D5C__animate_objects.asm"

	include "txt/8D5D-8D65__hi_scores.asm"

	include "code/8D66-8D6C__find_spritedata.asm"
	include "code/8D6D-8D74___UNKNOWN.asm"
	include "code/8D75-8DA5__level_to_screen.asm"
	include "code/8DA6-8DE2___UNKNOWN.asm"
	include "code/8DE3-8DFE__scroll_screen_columns.asm"
	include "code/8DFF-8E17__print_enter_pass.asm"
	include "code/8E18-8E2C__keypress_beep.asm"
	include "code/8E2D-8E90__enter_password.asm"
	include "code/8E91-8EB5__check_password.asm"
	include "code/8EB6-8ED1___UNKNOWN.asm"
	include "code/8ED2-8EE3__animate_attrs.asm"
	include "code/8EE4-8F07____UNKNOWN.asm"


just_a_ret:
  ret


loc_8F09:
    defb $1e


	include "code/8F0A-8F28__blink_string.asm"
	include "code/8F29-8F5F__password_to_level.asm"
	include "code/8F60-900A__colored_sprite.asm"
	include "code/900B-903E__animate_player.asm"
	include "code/903F-9051__show_killed_player.asm"
	include "code/9052-905A__reset_counter4.asm"
	include "code/905B-9071__do_exit_flash.asm"
	include "code/9072-9090__play_open_door.asm"
	include "code/9091-909F__show_menu_pic.asm"
	include "code/90A0-90B1__play_screech.asm"
	include "code/90B2-914B__animate_things.asm"
	include "code/914C-915E___UNKNOWN.asm"
	include "code/915F-91AD___UNKNOWN.asm"
	include "code/91AE-91B5__kill_player.asm"


L91b6:
  defb $c3,$e6,$84


	include "code/91B9-91C0__reset_counters.asm"
	include "code/91C1-91C8__play_gamma.asm"
	include "code/91C9-91DA__increase_lives.asm"
	include "code/91DB-91F6__increase_timeline.asm"
	include "code/91F7-9223__add_time_units.asm"
	include "code/9224-922F__show_info_attr.asm"
	include "code/9230-926D__teleport_in_out.asm"
	include "code/926E-92B3___UNKNOWN.asm"
	include "code/92B4-92C3___UNKNOWN.asm"
	include "code/92C4-92D3___UNKNOWN.asm"
	include "code/92D4-9304__show_level_info.asm"
	include "code/9305-9312__set_spr_colors.asm"
	include "code/9313-9345__load_level.asm"
	include "code/9346-934E___UNKNOWN.asm"
	include "code/934F-9377___UNKNOWN.asm"
	include "code/9378-937D___UNKNOWN.asm"
	include "code/937E-93A4___UNKNOWN.asm"
	include "code/93A5-93B5__check_level_quit.asm"
	include "code/93B6-93C1___UNKNOWN.asm"

; Unused
L93c2:
  defb $00,$00,$00,$00,$00


	include "code/93C7-93CD___UNKNOWN.asm"
    	include "code/93CE-940F__check_move_to.asm"
	include "code/9410-9413___UNKNOWN.asm"
	include "code/9414-941E___UNKNOWN.asm"
	include "code/941F-9464___UNKNOWN.asm"
	include "code/9465-946A__drink_bottle.asm"
	include "code/946B-9493___UNKNOWN.asm"
	include "code/9494-94D5__check_right_object.asm"
	include "code/94D6-9517__check_left_object.asm"
	include "code/9518-955D___UNKNOWN.asm"
	include "code/955E-95A3___UNKNOWN.asm"
	include "code/95A4-95D4___UNKNOWN.asm"
	include "code/95D5-9605___UNKNOWN.asm"
	include "code/9606-9620___UNKNOWN.asm"
	include "code/9621-964D___UNKNOWN.asm"
	include "code/964E-967A___UNKNOWN.asm"
	include "code/967B-96A7___UNKNOWN.asm"
	include "code/96A8-96D4___UNKNOWN.asm"


; Unused
L96d5:
  defs $2b


	include "data/9700-997F__PASSWORDS_TABLE.asm"

	include "code/9980-999F___UNKNOWN.asm"
	include "code/99A0-99BF___UNKNOWN.asm"


; Unused
L99c0:
  defs $40
  
	include "data/9A00-9A77__MAP_SPRITES.asm"


L9a78:  
	defb $2a,$aa,$ee,$7c,$7d,$7a,$ba,$96

L_9A80:
	defb $40,$43,$46,$47
L_9A84:
	defb $47,$42,$41,$47
	defb $42,$43,$45,$45,$46,$47,$44,$47
	defb $cd,$59,$80,$cd,$cc,$81,$c9,$21

	defb $90,$9a,$11,$78,$8d,$01,$07,$00
	defb $ed,$b0,$c3,$20,$8b
L_9AA5:
	defb $00


	include "code/9AA6-9ABB___UNKNOWN.asm"
	include "code/9ABC-9ACB___UNKNOWN.asm"

; Unused
L9acc:
  defs $1c


	include "txt/9AE8-9B07__enter_password.asm"

	include "data/9B08-A5FF__SPRITES_ZIGZAG.asm"

    	include "code/A600-A614__init_colors.asm"
	include "code/A615-A61B__play_welldone_music.asm"
	include "code/A61C-A63D__congrats_pic.asm"
	include "code/A63E-A64A___UNKNOWN.asm"
	include "code/A64B-A654___UNKNOWN.asm"
	include "code/A655-A6BA___UNKNOWN.asm"
	include "code/A6BB-A712___UNKNOWN.asm"
	include "code/A713-A74A__play_note.asm"
	include "code/A74B-A772__play_selected.asm"
	include "code/A773-A791___UNKNOWN.asm"
	include "code/A792-A79F___UNKNOWN.asm"
	include "code/A7A0-A7C6__print_stat_line.asm"


La7c7:
  call print_stat_line
  jp L9410


	include "code/A7CD-A814___UNKNOWN.asm"
	include "code/A815-A86D__congratulations.asm"
	include "code/A86E-A8BE__colorize_congra.asm"
	include "code/A8BF-A8D4__show_congratulations.asm"
    	include "code/A8D5-A8DF__loop_score_inc.asm"
    	include "code/A8E0-A8F1__music_score.asm"

  
  defb $00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$00,$00


	include "data/A900-A977__KEYBOARD.asm"

	include "txt/A978-A9D6__controls.asm"

	include "code/A9D7-A9FA__score_from.asm"


La9fb:
  defb $00,$00,$00,$00,$00
  

	include "data/AA00-AA4D__MUSIC_GAMEOVER.asm"

	include "txt/AA4E-AA71__level_end.asm"


EMPTYSPRITE_COLORED:
  defs 4 + 8*4

	defs $60

Laaf6:
  defm "1 ..... ST"
  

	include "txt/AB00-AC5E__main_menu.asm"

	include "data/AC5F-ACFF__MUSIC_GAMMA.asm"
	include "data/AD00-B26B__MUSIC_MAIN.asm"
MAIN_MUSIC_END	EQU $-3


	include "code/B26C-B2C8__hiscores_table.asm"
	include "code/B2C9-B2E3__clear_screen_part.asm"
	include "code/B2E4-B2F8__scroller_and_main.asm"


LB2F9:  
  defb $00,$00,$00,$00,$00,$00,$00

	
	include "data/B300-BAFF__MAINMENU_PIC.asm"

	include "txt/BB00-BB15__status.asm"


Lbb16:
  defs 106, 0
 

	include "data/BB80-BBFB__MUSIC_LEVELS_A.asm"

  defb $00,$00,$00,$00,$04,$00,$03,$c7
  defb $03,$90,$03,$5d,$03,$2d,$02,$ff
  defb $02,$d4,$02,$ab,$02,$85,$02,$61
  defb $02,$3f,$02,$1e,$02,$00,$01,$e3
  defb $01,$c8,$01,$af,$01,$96,$01,$80
  defb $01,$6a,$01,$56,$01,$43,$01,$30
  defb $01,$1f,$01,$0f,$01,$00,$00,$f2
  defb $00,$e4,$00,$d7,$00,$cb,$00,$c0
  defb $00,$b5,$00,$ab,$00,$a1,$00,$98
  defb $00,$90,$00,$88,$00,$80,$00,$79
  defb $00,$72,$00,$6c,$00,$66,$00,$60
  defb $00,$5b,$00,$55,$00,$51,$00,$4c
  defb $00,$48,$00,$44,$00,$40,$00,$3c
  defb $00,$39,$00,$36,$00,$33,$00,$30
  defb $00,$2d,$00,$2b,$00,$28,$00,$26
  defb $00,$24,$00,$22,$00,$20,$00,$1e
  defb $00,$1d,$00,$1b,$00,$19,$00,$18
  defb $00,$17,$00,$15,$00,$14,$00,$13
  defb $00,$12,$00,$11,$00,$10

	include "data/BC92-BCD1__INFOLINE_ATTRIB.asm"

  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00


	include "txt/BCE0-BCFF__status_line.asm"


FONT_start	EQU $-$100
	include "data/BD00-BFFF__font.asm"
	include "data/C000-E73F__levels.asm"

	include "code/E740-E77B__play_falling_beep.asm"
	include "code/E77C-E78B___UNKNOWN.asm"
	include "code/E78C-E7A7___UNKNOWN.asm"

; Unused
Le7a8:
  defb $00


	include "code/E7A9-E7E4___UNKNOWN.asm"


Le7e5:
  jp Le83a


Le7e8:
  defb $b7,$28,$04,$cd,$28,$82,$c9,$3a
  defb $ff,$7f,$c3,$53,$82


	include "code/E7F5-E7FD___UNKNOWN.asm"
	include "code/E7FE-E81E___UNKNOWN.asm"
	include "code/E81F-E82D___UNKNOWN.asm"


Le82e:
  defb $00


	include "code/E82F-E839___UNKNOWN.asm"
	include "code/E83A-E84F___UNKNOWN.asm"
	include "code/E850-E856___UNKNOWN.asm"


IS_WALKING:
  defb $00


	include "code/E858-E85F__stop_walking.asm"
	include "code/E860-E868__walking_sound.asm"
	include "code/E869-E87A___UNKNOWN.asm"
	include "code/E87B-E8AD__animate_teleport_in.asm"
	include "code/E8AE-E8E0__animate_teleport_out.asm"
	include "code/E8E1-E8E7__play_map_music.asm"

	include "data/E8E8-E9AD__MUSIC_MAP.asm"

	include "code/E9AE-E9BC___UNKNOWN.asm"
  

  defb $00,$00,$00


	include "data/E9C0-E9FF__SPRITES_BORDER.asm"

	include "code/EA00-EA7F__draw_border.asm"
	include "code/EA80-EA95__show_level_map.asm"
	include "code/EA96-EAB2__check_map_show.asm"
	include "code/EAB3-EAC2___UNKNOWN.asm"
  
  
  defb $c9


	include "code/EAC4-EC94__joy_keyboard_procs.asm"

	include "txt/EC95-ECC4__joy_keyboard_control.asm"


	include "code/ECC5-ECDB__print_menu_controls.asm"
	include "code/ECDC-ECE2___UNKNOWN.asm"
	include "code/ECE3-ED0B__check_menu_keys.asm"

	include "data/unknown_ED0C-EE23.asm"
 

Lee24:
  defw LEVEL_MUSIC_A	
  defw LEVEL_MUSIC_B	
  defw LEVEL_MUSIC_C	
  defw LEVEL_MUSIC_D	
  defw LEVEL_MUSIC_E	
  defw LEVEL_MUSIC_F	
  defw LEVEL_MUSIC_G	
  defw LEVEL_MUSIC_H	


	include "code/EE34-EE49__choose_music.asm"

	include "data/unknown_EE49-F01F.asm"
	include "data/F020-F0FF__MAIN_SPRITES.asm"
	include "data/F100-F49D__MUSIC_LEVELS_B-H.asm"
	include "data/unknown_F49E-FB6F.asm"

	include "code/FB70-FB80___UNKNOWN.asm"
	include "code/FB81-FB9F__graphics_init.asm"


Lfba0:
  defb $42,$02,$02,$42,$77,$77,$f8,$f8
  defb $77,$77,$8f,$8f,$57,$57,$a8,$a8
  defb $57,$57,$8f,$8f,$77,$77,$f8,$f8
  defb $75,$75,$8a,$8a,$75,$75,$f8,$f8
  defb $77,$77,$8f,$8f,$42,$02,$02,$42
  defb $6d,$b6,$b6,$6e,$76,$b6,$be,$b6
  defb $ce,$5d,$83,$dd,$dd,$fd,$7e,$da
  defb $dd,$86,$de,$2e,$c6,$e4,$7b,$fe
  defb $3d,$bf,$ce,$43,$77,$f0,$36,$b6
  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$00,$00
  defb $00,$00,$00,$00,$00,$00,$00,$00


	include "data/FC00-FCFF__MENU_PIC_ATTR.asm"

	include "txt/FD00-FD13__entered_pass.asm"
	include "txt/FD14-FD67__hi_scores.asm"




;Lfd68:
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
	defb	0
word_FD70:
	defw 0
COUNTER_4:
	defb 0
COUNTER_8:
	defb 6
COUNTER_12:
	defb    9
	defb    0
	defb    0
	defb    0
	defb    0
	defb    0
VARIABLES:
	defb    0
	defb    0
TIME_TICKER:
	defb    0
PLAYER_ALIVE:
	defb    0
unk_FD7E:
	defb    0
LEVEL_NO:
	defb    0
KEY_PRESSED:
	defb    0
	defb    0
unk_FD82:
	defb    0
CRYSTALS_GOT:
	defb    0
EXIT_STATUS:
	defb 0
EXIT_FLASH:
	defb 0
				; if value > 0 then
				;    skip to next level
PLAYER_SPRITE:
	defb 0
word_FD87:
	defw 0
word_FD89:
	defw 0
byte_FD8B:
	defb 0
byte_FD8C:
	defb 0
byte_FD8D:
	defb 0
byte_FD8E:
	defb 1
EXIT_COLORFLASH:
	defb 0
byte_FD90:
	defb $63
CURRENT_LEVEL:
	defb 1
DONE_CRYSTALS:
	defb 0
LIVES:
	defb 4
unk_FD94:
	defb    0
unk_FD95:
	defb    0
	defb    0
	defb    0
	defb    0

SCORE:
	defb 0
CRYSTALS_COUNT:
	defb 0

CRYSTAL_PRICE:
	defb    0
PLAYER_COORDS:
	defb    0
byte_FD9D:
	defb    0
	defb    0
CRYSTALS_DIGITS:
	defb    0
word_FDA0:
	defw    0
GFX_SET:
	defw    0
COLOR_EXIT:
	defb    0
COLOR_BOULDER:
	defb    0
COLOR_BRICKS:
	defb    0
COLOR_EARTH:
	defb    0

UNPACKED_LEVEL:
  defs 77*8-1-16, 0

  defb $00




































