if (oCont_Game.lock_controls){
	exit;
}

if (keyboard_check_pressed(KEY_RIGHT)){
	dir -= 90; // Right...
	if (dir < 0){
		dir = 270;
	}
	facing--;
	if (facing < 0){
		facing = 3;
	}
}
if (keyboard_check_pressed(KEY_LEFT)){
	dir += 90; // Left...
	if (dir >= 360){
		dir = 0;
	}
	facing++;
	if (facing > 3){
		facing = 0;
	}
}

var _vecX = dcos(dir);
var _vecY = -dsin(dir);
var _gridX = x div CELL_SIZE;
var _gridY = y div CELL_SIZE;
var _moveX = false;
var _moveY = false;

if (keyboard_check_pressed(KEY_FORWARD)){
	// Make sure we're not trying to leave the grid
	_moveX = (_gridX + _vecX) < ds_grid_width(global.world_grid) && (_gridX + _vecX) >= 0;
	_moveY = (_gridY + _vecY) < ds_grid_height(global.world_grid) && (_gridY + _vecY) >= 0;

	if (_moveX && _moveY){
		// Make sure we're not trying to enter a wall
		var _empty = global.world_grid[# _gridX + _vecX, _gridY + _vecY] == __CELL_PATH.EMPTY;
		var _door_id = instance_position(x + (_vecX * CELL_SIZE), y + (_vecY * CELL_SIZE), oDoor);
		var _blocked = false;
		if (_door_id != noone){
			_blocked = state_door_get_closed(_door_id);
		}
		if (_empty && !_blocked){
			x += CELL_SIZE * _vecX;
			y += CELL_SIZE * _vecY;
			grid_x = x div CELL_SIZE;
			grid_y = y div CELL_SIZE;
		}
	}
}
else if (keyboard_check_pressed(KEY_BACKWARD)){
	// Make sure we're not trying to leave the grid
	_moveX = (_gridX - _vecX) < ds_grid_width(global.world_grid) && (_gridX - _vecX) >= 0;
	_moveY = (_gridY - _vecY) < ds_grid_height(global.world_grid) && (_gridY - _vecY) >= 0;

	if (_moveX && _moveY){
		// Make sure we're not trying to enter a wall
		var _empty = global.world_grid[# _gridX - _vecX, _gridY - _vecY] == __CELL_PATH.EMPTY;
		var _door_id = instance_position(x - (_vecX * CELL_SIZE), y - (_vecY * CELL_SIZE), oDoor);
		var _blocked = false;
		if (_door_id != noone){
			_blocked = state_door_get_closed(_door_id);
		}
		if (_empty && !_blocked){
			x -= CELL_SIZE * _vecX;
			y -= CELL_SIZE * _vecY;
			grid_x = x div CELL_SIZE;
			grid_y = y div CELL_SIZE;
		}
	}
}