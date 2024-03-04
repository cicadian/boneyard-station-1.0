if (oCont_Game.lock_controls){
	exit;
}

if (turn_right){
	dir -= 90; // Right...
	if (dir < 0){
		dir = 270;
	}
	facing--;
	if (facing < 0){
		facing = 3;
	}
	turn_right = false;
}
if (turn_left){
	dir += 90; // Left...
	if (dir >= 360){
		dir = 0;
	}
	facing++;
	if (facing > 3){
		facing = 0;
	}
	turn_left = false;
}

var _vecX = dcos(dir);
var _vecY = -dsin(dir);
var _gridX = x div CELL_SIZE;
var _gridY = y div CELL_SIZE;
var _moveX = false;
var _moveY = false;

if (action_counter >= action_counter_max){
	var _look_north = false;
	var _look_east = false;
	var _look_west = false;
	var _look_south = false;

	if ((instance_position(x + 2, y - CELL_SIZE * 2 + 2, oPlayer) != noone && global.world_grid[# _gridX, _gridY - 1] == __CELL_PATH.EMPTY && global.world_grid[# _gridX, _gridY - 2] == __CELL_PATH.EMPTY) || instance_position(x + 2, y - CELL_SIZE+ 2, oPlayer) != noone){
		_look_north = true;
		show_debug_message("north");
	}
	else if ((instance_position(x + 2, y + CELL_SIZE * 2 + 2, oPlayer) != noone && global.world_grid[# _gridX, _gridY + 1] == __CELL_PATH.EMPTY && global.world_grid[# _gridX, _gridY + 2] == __CELL_PATH.EMPTY) || instance_position(x + 2, y + CELL_SIZE + 2, oPlayer) != noone){
		_look_south = true;
		show_debug_message("south");
	}
	else if ((instance_position(x - CELL_SIZE * 2 + 2, y + 2, oPlayer) != noone && global.world_grid[# _gridX - 1, _gridY] == __CELL_PATH.EMPTY && global.world_grid[# _gridX - 2, _gridY] == __CELL_PATH.EMPTY) || instance_position(x - CELL_SIZE + 2, y + 2, oPlayer) != noone){
		_look_west = true;
		show_debug_message("west");
	}
	else if ((instance_position(x + CELL_SIZE * 2 + 2, y + 2, oPlayer) != noone && global.world_grid[# _gridX + 1, _gridY] == __CELL_PATH.EMPTY && global.world_grid[# _gridX + 2, _gridY] == __CELL_PATH.EMPTY) || instance_position(x + CELL_SIZE + 2, y + 2, oPlayer) != noone){
		_look_east = true;
		show_debug_message("east");
	}
	if (_look_north){
		if (facing != __CARDINAL.NORTH){
			if (facing != __CARDINAL.WEST){
				turn_left = true;
			}
			else{
				turn_right = true;
			}
		}
		else{
			shoot_at_player = true;
		}
	}
	else if (_look_south){
		if (facing != __CARDINAL.SOUTH){
			if (facing != __CARDINAL.EAST){
				turn_left = true;
			}
			else{
				turn_right = true;
			}
		}
		else{
			shoot_at_player = true;
		}
	}
	else if (_look_west){
		if (facing != __CARDINAL.WEST){
			if (facing != __CARDINAL.SOUTH){
				turn_left = true;
			}
			else{
				turn_right = true;
			}
		}
		else{
			shoot_at_player = true;
		}
	}
	else if (_look_east){
		if (facing != __CARDINAL.EAST){
			if (facing != __CARDINAL.NORTH){
				turn_left = true;
			}
			else{
				turn_right = true;
			}
		}
		else{
			shoot_at_player = true;
		}
	}
	else{
		var _roll_4 = irandom(3);
		switch(_roll_4){
			case 0:
				turn_left = true;
				break;
			case 1:
				turn_right = true;
				break;
			case 2:
				move_forward = true;
				break;
			case 3:
				move_backward = true;
				break;
		}
	}
	action_counter = -1 - random(15);
	action_counter = action_counter_max;
}
action_counter++;


if (shoot_at_player){
	oPlayer.life--;
	shoot_at_player = false;
}

if (move_forward){
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
	move_forward = false;
}
else if (move_backward){
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
	move_backward = false
}