game_declare_methods();

stateMap_game = ds_map_create();
stateMachine_init(stateMap_game, state_game_inactive);

dialog_index = -1;
dialog_page = 0;
dialog_page_count = 1;
dialog_displayed = false;
dialog_string = "";
dialog_portrait = -1;
track0 = undefined;
track1 = undefined;

lock_controls = false;

flag_tut_move = false;
flag_tut_switch = false;
flag_tut_door = false;
flag_tut_gun = false;

counter_tutorial = 0;
counter_tutorial_max = 60;

cursor_spr = -1;
cursor_default = sCursor_Default;
cursor_aim     = sCursor_Aim;
cursor_frame = 0;

have_fuel = false;

global.has_gun = false;

surf_spatter = -1;
test = false;

intro_counter = 0;
intro_counter_max = 5;
intro_frame_max = sprite_get_number(sDeerbell);
draw_intro = false;
intro_frame = 0;
draw_black = false;
black_counter = 0;
black_counter_max = 600;


animatic_counter = 0;
animatic_counter_max = 270;
animatic_frame = 0;
draw_animatic = false;
spr_animatic = sIntro_Arrival;
animatic_string = "";
draw_imtired = false;
animatic_frame_max = 3;
global.ending_beastkiller = false;
global.ending_flee = false;
global.ending_eaten = false;