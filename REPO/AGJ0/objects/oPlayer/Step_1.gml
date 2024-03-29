if (oCont_Game.lock_controls){
	exit;
}

if (global.has_gun){
	if (mouse_check_button_pressed(MOUSE_SHOOT) && !gun_out){
		gun_out = true;
		oCont_Game.cursor_spr = oCont_Game.cursor_aim;
		mouse_clear(MOUSE_SHOOT);
	}
	if (mouse_check_button_pressed(MOUSE_INTERACT) && gun_out){
		var _door = instance_position((oPlayer.grid_x + oPlayer.vec_x) * CELL_SIZE, (oPlayer.grid_y + oPlayer.vec_y) * CELL_SIZE, oDoor);
		if (_door == noone){
			oCont_Game.cursor_spr = oCont_Game.cursor_default;
			gun_out = false;
		}
	}
}
if (gun_out){
	if (mouse_check_button_pressed(MOUSE_SHOOT)){
		// fire weapon
		if (gun_counter >= gun_counter_max){
			audio_play_sound(gun_0, 0, 0, 0.75);
			gun_fire = true;
			target_x = mouse_x;
			target_y = mouse_y;
			gun_counter = -1;
			// shoot at target
			var _enemy1 = instance_position(x + (vec_x * CELL_SIZE), y + (vec_y * CELL_SIZE), oEnemy);
			var _inbox = point_in_rectangle(mouse_x, mouse_y, 120, 70, 200, 140);
			if (_enemy1 != noone && _inbox){
				_enemy1.life--;
				audio_play_sound(crumple, 0, 0);
				var _clutter = instance_create_layer(_enemy1.x, _enemy1.y, global.layer_cont, oClutter);
				_clutter.spr = -1;
			}
		}
	}
	gun_counter++;
	gun_x = round(mouse_x / 2 - (NATIVE_W / 2));
	gun_y = round(mouse_y / 4 - (NATIVE_H / 4) + (NATIVE_H / 4)); 
}
if (gun_counter < gun_counter_max){
	gun_frame = 1;
}
else{
	gun_frame = 0;
}
if (gun_fire){
	if (gun_fire_counter >= gun_fire_counter_max){
		gun_fire = false;
		gun_fire_counter = -1;
	}
	gun_fire_counter++;
}

if (regen_counter >= regen_counter_max){
	if (life > 0){
		life++;
		regen_counter = -1;
	}
}
regen_counter++;
if (life == 0){
	global.fog_color_r = 55 / 255;
}
else if (life == 1){
	global.fog_color_r = 45 / 255;
}
else if (life == 2){
	global.fog_color_r = 25 / 255;
}
else if (life == 3){
	global.fog_color_r = 15 / 255;
}
else if (life == 4){
	global.fog_color_r = 0.0;
}
if (life <= 0){
	player_die();
}
if (life <= 0){
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

vec_x = dcos(dir);
vec_y = -dsin(dir);
var _gridX = x div CELL_SIZE;
var _gridY = y div CELL_SIZE;
var _moveX = false;
var _moveY = false;

if (keyboard_check_pressed(KEY_FORWARD)){
	// Make sure we're not trying to leave the grid
	_moveX = (_gridX + vec_x) < ds_grid_width(global.world_grid) && (_gridX + vec_x) >= 0;
	_moveY = (_gridY + vec_y) < ds_grid_height(global.world_grid) && (_gridY + vec_y) >= 0;

	if (_moveX && _moveY){
		// Make sure we're not trying to enter a wall
		var _empty = global.world_grid[# _gridX + vec_x, _gridY + vec_y] == __CELL_PATH.EMPTY;
		var _noentitiy = instance_position(x + (vec_x * CELL_SIZE), y + (vec_y * CELL_SIZE), oEnemy) == noone && instance_position(x + (vec_x * CELL_SIZE), y + (vec_y * CELL_SIZE), oEnemy) == noone;
		var _door_id = instance_position(x + (vec_x * CELL_SIZE), y + (vec_y * CELL_SIZE), oDoor);
		var _blocked = false;
		if (_door_id != noone){
			_blocked = !state_door_get_open(_door_id);
		}
		if (_empty && !_blocked && _noentitiy){
			x += CELL_SIZE * vec_x;
			y += CELL_SIZE * vec_y;
			grid_x = x div CELL_SIZE;
			grid_y = y div CELL_SIZE;
			audio_play_sound(footstep, 0, 0);
		}
	}
}
else if (keyboard_check_pressed(KEY_BACKWARD)){
	// Make sure we're not trying to leave the grid
	_moveX = (_gridX - vec_x) < ds_grid_width(global.world_grid) && (_gridX - vec_x) >= 0;
	_moveY = (_gridY - vec_y) < ds_grid_height(global.world_grid) && (_gridY - vec_y) >= 0;

	if (_moveX && _moveY){
		// Make sure we're not trying to enter a wall
		var _empty = global.world_grid[# _gridX - vec_x, _gridY - vec_y] == __CELL_PATH.EMPTY;
		var _door_id = instance_position(x - (vec_x * CELL_SIZE), y - (vec_y * CELL_SIZE), oDoor);
		var _noentitiy = instance_position(x - (vec_x * CELL_SIZE), y - (vec_y * CELL_SIZE), oEnemy) == noone && instance_position(x - (vec_x * CELL_SIZE), y - (vec_y * CELL_SIZE), oEnemy) == noone;
		var _blocked = false;
		if (_door_id != noone){
			_blocked = !state_door_get_open(_door_id);
		}
		if (_empty && !_blocked && _noentitiy){
			x -= CELL_SIZE * vec_x;
			y -= CELL_SIZE * vec_y;
			grid_x = x div CELL_SIZE;
			grid_y = y div CELL_SIZE;
			
		}
	}
}

audio_listener_set_position(0, x, y, 0);