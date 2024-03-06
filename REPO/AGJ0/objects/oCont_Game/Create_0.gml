game_declare_methods();

stateMap_game = ds_map_create();
stateMachine_init(stateMap_game, state_game_inactive);

dialog_index = -1;
dialog_page = 0;
dialog_page_count = 1;
dialog_displayed = false;
dialog_string = "";
dialog_portrait = -1;

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