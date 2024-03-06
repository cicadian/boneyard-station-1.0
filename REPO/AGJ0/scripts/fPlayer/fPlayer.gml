/// @func player_die
function player_die(){
	z-= 0.1;
	if (z <= 0.9){
		z = 0.9;
	}
	death_counter++;
	if (death_counter >= death_counter_max){
		if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(KEY_SKIP) || mouse_check_button_pressed(MOUSE_INTERACT) || mouse_check_button_pressed(MOUSE_SHOOT)){
			x = checkpoint_x + (CELL_SIZE / 2);
			y = checkpoint_y + (CELL_SIZE / 2);
			grid_x = x div CELL_SIZE;
			grid_y = y div CELL_SIZE;
			dir = checkpoint_dir * 90;
			death_counter = 0;
			life = 4;
			z = CELL_SIZE - (CELL_SIZE / 2.75);
			global.fog_color = c_black;
		}
	}
}