// State methods

function door_declare_methods(){

	state_door_inactive = function(){
		var _stateMap = stateMap_door;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		if (!locked){
			stateMachine_push(state_door_closed, _stateMap);
		}
		else{
			stateMachine_push(state_door_locked, _stateMap);
		}
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	state_door_open = function(){
		var _stateMap = stateMap_door;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
			tex = tex_door_open;
		}
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	state_door_closed = function(){
		var _stateMap = stateMap_door;
		if (!stateMachine_get_init(_stateMap)){
			tex = tex_door_closed;
			stateMachine_set_init(_stateMap, true);
		}
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	state_door_locked = function(){
		var _stateMap = stateMap_door;
		if (!stateMachine_get_init(_stateMap)){
			tex = tex_door_locked;
			stateMachine_set_init(_stateMap, true);
		}

		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
}
// External functions

/// @func state_door_get_inactive
/// @arg {id} id
function state_door_get_inactive(_id){
	return stateMachine_get_current(_id.stateMap_door) == _id.state_door_default;
}

/// @func state_door_get_closed
/// @arg {id} id
function state_door_get_closed(_id){
	return stateMachine_get_current(_id.stateMap_door) == _id.state_door_closed;
}

/// @func state_door_get_open
/// @arg {id} id
function state_door_get_open(_id){
	return stateMachine_get_current(_id.stateMap_door) == _id.state_door_open;
}

/// @func state_door_get_locked
/// @arg {id} id
function state_door_get_locked(_id){
	return stateMachine_get_current(_id.stateMap_door) == _id.state_door_locked;
}

/// @func door_build
/// @arg {bool} dark
function door_build(_dark){
	var _vbuff;
	var _x1 = grid_x * CELL_SIZE;
	var _x2 = _x1 + CELL_SIZE;
	var _y1 = grid_y * CELL_SIZE;
	var _y2 = _y1 + CELL_SIZE;
	var _z1 = 0;
	var _z2 = CELL_SIZE; 
	var _u = oCont_World.texcoord_door_u;
	var _v = oCont_World.texcoord_kestrel_v;
	var _layer = layer_get_id("tile_paint");
	var _tileMap = layer_tilemap_get_id(_layer);
	var _tile = tilemap_get(_tileMap, grid_x, grid_y);
	switch (_tile){
		case 1:
			_v = oCont_World.texcoord_kestrel_v;
			break;
		case 2:
			_v = oCont_World.texcoord_station_v;
			break;
		case 3:
			_v = oCont_World.texcoord_cargo_v;
			break;
	}
	_vbuff = vertex_create_buffer();
	vertex_begin(_vbuff, other.world_format);
	var _ambient = global.light_ambient;
	var _layer = layer_get_id("tile_paint");
	var _tileMap = layer_tilemap_get_id(_layer);
	var _tile = tilemap_get(_tileMap, grid_x, grid_y);
	if (_tile == 3){
		_ambient = 0.25;
	}
	var _lightlevel = global.light_grid[# grid_x, grid_y] + _ambient;
	if (_lightlevel > 1){
		_lightlevel = 1;
	}
	var _color = make_colour_rgb(_lightlevel * 255, _lightlevel * 255, _lightlevel * 255);
	if (orientation == __DOOR_ORIENTATION.HORIZONTAL){
		vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z2);
		vertex_texcoord(_vbuff, _u, _v);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z2);
		vertex_texcoord(_vbuff, _u + other.tex_spr_uvs, _v);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z1);
		vertex_texcoord(_vbuff, _u + other.tex_spr_uvs, _v + other.tex_spr_uvs);
		vertex_colour(_vbuff, _color, 1);

		vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z2);
		vertex_texcoord(_vbuff, _u, _v);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z1);
		vertex_texcoord(_vbuff, _u + other.tex_spr_uvs, _v + other.tex_spr_uvs);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z1);
		vertex_texcoord(_vbuff, _u, _v + other.tex_spr_uvs);
		vertex_colour(_vbuff, _color, 1);
	}
	else if (orientation == __DOOR_ORIENTATION.VERTICAL){
		vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
		vertex_texcoord(_vbuff, _u, _v);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z2);
		vertex_texcoord(_vbuff, _u + other.tex_spr_uvs, _v);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
		vertex_texcoord(_vbuff, _u + other.tex_spr_uvs, _v + other.tex_spr_uvs);
		vertex_colour(_vbuff, _color, 1);

		vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
		vertex_texcoord(_vbuff, _u, _v);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
		vertex_texcoord(_vbuff, _u + other.tex_spr_uvs, _v + other.tex_spr_uvs);
		vertex_colour(_vbuff, _color, 1);
		vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z1);
		vertex_texcoord(_vbuff, _u, _v + other.tex_spr_uvs);
		vertex_colour(_vbuff, _color, 1);
	}
	vertex_end(_vbuff);
	vertex_freeze(_vbuff);
	var _map = ds_map_create();
	_map[? "VBUFF"] = _vbuff;
	_map[? "ID"]    = id;
	if (_dark){
		ds_list_add(other.door_buffer_list_dark, _map);
		other.door_count++;
		ds_list_mark_as_map(other.door_buffer_list_dark, other.door_count);
	}
	else{
		ds_list_add(other.door_buffer_list, _map);
		ds_list_mark_as_map(other.door_buffer_list, other.door_count);
	}
}