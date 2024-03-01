game_declare_methods();

stateMap_game = ds_map_create();
stateMachine_init(stateMap_game, state_game_inactive);

dialog_index = 0;

flag_tut_move = false;
flag_tut_switch = false;
flag_tut_door = false;
flag_tut_gun = false;