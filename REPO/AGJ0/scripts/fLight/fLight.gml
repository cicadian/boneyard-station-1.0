/// @func light_toggle
function light_toggle(){
	global.light_toggle = !global.light_toggle;
	audio_play_sound(switchsound, 0, 0);
	if (global.light_toggle){
		audio_sound_gain(track1, 0.5, 2000);
	}
	else{
		audio_sound_gain(track1, 0, 2000);
	}
	if (oCont_World.world_vbuff == oCont_World.world_light_vbuff){
		oCont_World.world_vbuff = oCont_World.world_dark_vbuff;
		with (oClickzone){
			vbuff = vbuff_dark;
			if (type == __CLICKZONE_TYPE.EMERGENCY_LIGHTSWITCH){
				tex = oCont_World.world_tex_0;
			}
		}
	}
	else{
		oCont_World.world_vbuff = oCont_World.world_light_vbuff;
		with (oClickzone){
			vbuff = vbuff_light;
			if (type == __CLICKZONE_TYPE.EMERGENCY_LIGHTSWITCH){
				tex = oCont_World.world_tex_1;
			}
		}
	}
}

/// @func lightmap_build
/// @desc {void} builds the lightmap
function lightmap_build(){
	global.light_grid = ds_grid_create(GAME_W, GAME_H);
	ds_grid_clear(global.light_grid, 0);
	var _openset = ds_grid_create(GAME_W, GAME_H);
	ds_grid_clear(_openset, true);
	with (oLight){
		var _gridX = x div CELL_SIZE;
		var _gridY = y div CELL_SIZE;
		lightmap_search(_gridX, _gridY, 3, _openset);
		ds_grid_clear(_openset, true);
	}
	ds_grid_destroy(_openset);
}

/// @func lightmap_search
/// @desc {void} moves along the world grid leaving light values behind
/// @arg {real} gridX
/// @arg {real} gridX
/// @arg {real} distanceRemaining
/// @arg {grid} openSet
function lightmap_search(_gridX, _gridY, _distanceRemaining, _openset){
	global.light_grid[# _gridX, _gridY] += _distanceRemaining / 3;
	_openset[# _gridX, _gridY] = false;
	_distanceRemaining--;
	if (_distanceRemaining > 0){
		if (_gridX - 1 >= 0){
			var _freeLeft = global.world_grid[# _gridX - 1, _gridY] == __CELL_PATH.EMPTY && _openset[# _gridX - 1, _gridY];
			if (_freeLeft){
				lightmap_search(_gridX - 1, _gridY, _distanceRemaining, _openset);
			}
		}
		if (_gridX + 1 < ds_grid_width(global.world_grid)){
			var _freeRight = global.world_grid[# _gridX + 1, _gridY] == __CELL_PATH.EMPTY && _openset[# _gridX + 1, _gridY];
			if (_freeRight){
				lightmap_search(_gridX + 1, _gridY, _distanceRemaining, _openset);
			}
		}
		if (_gridY - 1 >= 0){
			var _freeUp = global.world_grid[# _gridX, _gridY - 1] == __CELL_PATH.EMPTY && _openset[# _gridX, _gridY - 1];
			if (_freeUp){
				lightmap_search(_gridX, _gridY - 1, _distanceRemaining, _openset);
			}
		}
		if (_gridY + 1 < ds_grid_height(global.world_grid)){
			var _freeDown = global.world_grid[# _gridX, _gridY + 1] == __CELL_PATH.EMPTY && _openset[# _gridX, _gridY + 1];
			if (_freeDown){
				lightmap_search(_gridX, _gridY + 1, _distanceRemaining, _openset);
			}
		}
	}
}