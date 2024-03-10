stateMachine_run(stateMap_game);

if (keyboard_check_pressed(vk_tab)){
	test = true;
}


if (draw_black){
	if (!surface_exists(surf_spatter)){
		surf_spatter = surface_create(NATIVE_W, NATIVE_H);
		surface_set_target(surf_spatter);
		draw_clear_alpha(c_black, 1);
		surface_reset_target();
	}
	surface_set_target(surf_spatter);
	gpu_set_blendmode(bm_subtract);
	repeat(irandom_range(155, 255)){
		draw_sprite(sPixel, 1, irandom_range(0, NATIVE_W - 1), irandom_range(0, NATIVE_H - 1));
	}
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	if (black_counter >= black_counter_max){
		draw_black = false;
	}
	// TODO START INTRO TEXT EVENT
	black_counter++;
}
if (draw_imtired){
	if (!surface_exists(surf_spatter)){
		surf_spatter = surface_create(NATIVE_W, NATIVE_H);
		surface_set_target(surf_spatter);
		draw_clear_alpha(c_black, 0);
		surface_reset_target();
	}
	surface_set_target(surf_spatter);
	repeat(irandom_range(155, 255)){
		draw_sprite(sPixel, 0, irandom_range(0, NATIVE_W - 1), irandom_range(0, NATIVE_H - 1));
	}
	surface_reset_target();
	if (black_counter >= black_counter_max){
		draw_imtired = false;
	}
	// TODO START INTRO TEXT EVENT
	black_counter++;
}