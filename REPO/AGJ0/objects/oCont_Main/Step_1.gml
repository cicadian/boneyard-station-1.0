if ( (keyboard_check(vk_lalt) || keyboard_check(vk_ralt)) && keyboard_check_pressed(vk_enter)){
	window_set_fullscreen(!window_get_fullscreen())
	surface_free(oCont_Game.surf_spatter);
	surface_free(oCont_World.surf_world);
	surface_free(oCont_World.surf_fog);
	if (window_get_fullscreen()){
		global.window_scale++;
	}
	else{
		global.window_scale--;
	}
}