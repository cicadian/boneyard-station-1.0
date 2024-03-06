door_declare_methods();
orientation = -1;
stateMap_door = ds_map_create();
stateMachine_init(stateMap_door, state_door_inactive);

grid_x = x div CELL_SIZE;
grid_y = y div CELL_SIZE;

tex_door_closed = sprite_get_texture(sTex_World, 0);
tex_door_open = sprite_get_texture(sTex_World, 1);
tex_door_locked = sprite_get_texture(sTex_World, 2);
tex = tex_door_closed;

locked = false;	

name = "";