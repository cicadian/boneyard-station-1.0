if (surface_exists(surf_world)){
	draw_surface_stretched(surf_world, 0, 0, NATIVE_W, NATIVE_H);
}
if (surface_exists(surf_fog)){
	//gpu_set_blendmode_ext(bm_zero, bm_src_color);
	//draw_surface_stretched(surf_fog, 0, 0, NATIVE_W, NATIVE_H);
	//gpu_set_blendmode(bm_normal);
}

show_debug_overlay(true);