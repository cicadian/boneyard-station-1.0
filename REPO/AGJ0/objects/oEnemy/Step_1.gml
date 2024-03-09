if (oCont_Game.lock_controls){
	exit;
}
if (life <= 0){
	x = 0;
	y = 0;
	grid_x = 0;
	grid_y = 0;
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
var _pface = oPlayer.facing;//point_direction(oPlayer.x, oPlayer.y, x + 2, y + 2);
var _frame = 0;
repeat(_pface){
	_frame++;
	if (_frame > 3){
		_frame = 0;
	}
}
repeat(facing){
	_frame--;
	if (_frame < 0){
		_frame = 3;
	}
}
switch(_frame){
	case 0:
		tex = tex_east;
		break;
	case 1:
		tex = tex_north;
		break;
	case 2:
		tex = tex_west;
		break;
	case 3:
		tex = tex_south;
		break;
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
	var _playerX = x - 2;
	var _playerY = y - 2;
	
	var _north1 = (_gridX == oPlayer.grid_x && _gridY - 1 == oPlayer.grid_y);
	var _north2 = (_gridX == oPlayer.grid_x && _gridY - 2 == oPlayer.grid_y) && (global.world_grid[# _gridX, _gridY - 1] == __CELL_PATH.EMPTY);
	var _south1 = (_gridX == oPlayer.grid_x && _gridY + 1 == oPlayer.grid_y);
	var _south2 = (_gridX == oPlayer.grid_x && _gridY + 2 == oPlayer.grid_y) && (global.world_grid[# _gridX, _gridY + 1] == __CELL_PATH.EMPTY);
	var _west1  = (_gridX - 1 == oPlayer.grid_x && _gridY == oPlayer.grid_y);
	var _west2  = (_gridX - 2 == oPlayer.grid_x && _gridY == oPlayer.grid_y) && (global.world_grid[# _gridX - 1, _gridY] == __CELL_PATH.EMPTY);
	var _east1  = (_gridX + 1 == oPlayer.grid_x && _gridY == oPlayer.grid_y);							   
	var _east2  = (_gridX + 2 == oPlayer.grid_x && _gridY == oPlayer.grid_y) && (global.world_grid[# _gridX + 1, _gridY] == __CELL_PATH.EMPTY);

	if (_north1 || _north2){
		_look_north = true;
	}
	else if (_south1 || _south2){
		_look_south = true;
	}
	else if (_west1 || _west2){
		_look_west = true;
	}
	else if (_east1 || _east2){
		_look_east = true;
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
			if (_north1 && !_north2){
				shoot_at_player = true;
			}
			else if (!_north1 && _north2){
				move_forward = true;
			}
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
			if (_south1 && !_south2){
				shoot_at_player = true;
			}
			else if (!_south1 && _south2){
				move_forward = true;
			}
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
			if (_west1 && !_west2){
				shoot_at_player = true;
			}
			else if (!_west1 && _west2){
				move_forward = true;
			}
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
			if (_east1 && !_east2){
				shoot_at_player = true;
			}
			else if (!_east1 && _east2){
				move_forward = true;
			}
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
				if (global.world_grid[# _gridX + _vecX, _gridY + _vecY] == __CELL_PATH.EMPTY){
					if (oPlayer.grid_x != _gridX + _vecX && oPlayer.grid_y != _gridY + _vecY){
						move_forward = true;
					}
				}
				else{
					turn_right = true;
				}
				break;
			case 3:
				// do nothing
				break;
		}
	}
	action_counter = -1 - random(15);
}
action_counter++;


if (shoot_at_player){
	audio_play_sound(gun_1, 0, 0, 0.75);
	oPlayer.life--;
	shoot_at_player = false;
	oCont_World.hit = true;
	if (oPlayer.life = 0){
		audio_play_sound(grunt, 2, false, 1, 0, random_range(0.5, 0.55));
	}
	else if (oPlayer.life > 0){
		audio_play_sound(grunt, 2, false, 0.75, 0, random_range(0.95, 1.05));
	}
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
			_blocked = !state_door_get_open(_door_id);
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