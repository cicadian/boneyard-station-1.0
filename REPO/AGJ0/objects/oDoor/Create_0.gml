door_declare_methods();
orientation = -1;
stateMap_door = ds_map_create();
stateMachine_init(stateMap_door, state_door_inactive);

grid_x = x div CELL_SIZE;
grid_y = y div CELL_SIZE;