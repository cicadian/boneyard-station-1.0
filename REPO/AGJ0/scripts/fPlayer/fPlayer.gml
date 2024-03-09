/// @func player_die
function player_die(){
	z-= 0.1;
	if (z <= 0.9){
		z = 0.9;
	}
	death_counter++;
	gun_out = false;
	gun_counter = 0;
	gun_fire = false;
	gun_frame = 0;
	gun_fire_counter = 0;
	oCont_Game.cursor_spr = oCont_Game.cursor_default;
	if (death_counter >= death_counter_max){
		if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(KEY_SKIP) || mouse_check_button_pressed(MOUSE_INTERACT) || mouse_check_button_pressed(MOUSE_SHOOT)){
			io_clear();
			x = checkpoint_x + 2;
			y = checkpoint_y + 2;
			grid_x = x div CELL_SIZE;
			grid_y = y div CELL_SIZE;
			dir = checkpoint_dir * 90;
			facing = checkpoint_dir;
			death_counter = 0;
			life = 4;
			z = CELL_SIZE - (CELL_SIZE / 2.75);
			global.fog_color = c_black;
		}
	}
}