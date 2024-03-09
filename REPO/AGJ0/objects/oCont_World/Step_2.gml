if (world_vbuff == world_light_vbuff){
	global.fog_end = (CELL_SIZE * 5) + (EaseInSine(current_time / 256, 0, 1, 4));
}
else if (world_vbuff == world_dark_vbuff){
	global.fog_end = (CELL_SIZE * 3) + (EaseInSine(current_time / 256, 0, 1, 4));
}

if (hit){
	if (hit_counter >= hit_counter_max){
		hit_counter = -1;
		hit = false;
	}
	hit_counter++;
}

if (keyboard_check_pressed(vk_f1)){
	global.gamma -= 0.01;
}
if (keyboard_check_pressed(vk_f2)){
	global.gamma += 0.01;
}
global.gamma = clamp(global.gamma, 0, 1);
show_debug_message(global.gamma);

// Render world
if (world_light_vbuff != undefined){
	if (!surface_exists(surf_world)){
		surf_world = surface_create(NATIVE_W / 2, NATIVE_H / 2);
	}
	if (!surface_exists(surf_fog)){
		surf_fog = surface_create(NATIVE_W, NATIVE_H);
	}
	surface_set_target(surf_world);
	draw_clear_alpha(c_white, 1);
	var _worldMat = matrix_get(matrix_world);
	var _viewMat = matrix_get(matrix_view);
	var _projMat = matrix_get(matrix_projection);
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_cullmode(cull_noculling);
	gpu_set_tex_repeat(true);
	
	var _camX = oPlayer.x - lengthdir_x(0.65, oPlayer.dir);
	var _camY = oPlayer.y - lengthdir_y(0.65, oPlayer.dir);
	var _camZ = oPlayer.z;
	var _camDX = dcos(oPlayer.dir + -oPlayer.yaw);
	var _camDY = -dsin(oPlayer.dir + -oPlayer.yaw);
	var _camDZ = -dsin(oPlayer.pitch);
	
	matrix_set(matrix_view, matrix_build_lookat(_camX, _camY, _camZ,
												_camX + _camDX, _camY + _camDY, _camZ + _camDZ,
												0, 0, 1));
												
	matrix_set(matrix_projection, matrix_build_projection_perspective_fov(global.fov, GAME_ASPECT,  1, 2000));
	
	shader_set(gPos);
	var _r = 0.0;
	var _g = 0.0;
	var _b = 0.0;
	if (hit){
		_r = (1 / hit_counter);
		_g = (1 / hit_counter);
		_b = (1 / hit_counter);
	}
	shader_set_uniform_f(u_fog_start, global.fog_start);
	shader_set_uniform_f(u_fog_end, global.fog_end);
	shader_set_uniform_f(u_fog_color, global.fog_color_r + _r, _g, _b, 1.0);
	shader_set_uniform_f(u_gamma, global.gamma);
	
	vertex_submit(world_vbuff, pr_trianglelist, world_tex_0);
	var _list = door_buffer_list;
	if (!global.light_toggle){
		var _list = door_buffer_list_dark;
	}
	for (var _i = 0; _i < door_count; _i++){
		vertex_submit(_list[| _i][? "VBUFF"], pr_trianglelist, _list[| _i][? "ID"].tex);
	}
	matrix_set(matrix_world, _worldMat);
	with (oClickzone){
		if (vbuff != undefined){
			vertex_submit(vbuff, pr_trianglelist, tex);
		}
	}
	with (oEnemy){
		if (vbuff != undefined){
			//var _matrot = matrix_build(x, y, 0, 0, 0, point_direction(x + 2, y + 2, oPlayer.x, oPlayer.y) + 90, 1, 1, 1);
			//matrix_multiply(_matrot, matrix_build(x, y, 0, 0, 0, 0, 1, 1, 1));
			var _dir = point_direction(x + 2, y + 2, oPlayer.x, oPlayer.y) + 90;
			var _matrot = matrix_build(x + 2, y + 2, 0, 0, 0, _dir, 1, 1, 1);
			matrix_set(matrix_world, _matrot);
			vertex_submit(vbuff, pr_trianglelist, tex);
		}
	}
	matrix_set(matrix_world, _worldMat);
	
	
	shader_reset();
	surface_reset_target();
	
	surface_set_target(surf_fog);
	draw_clear_alpha(c_white, 1);
	matrix_set(matrix_view, matrix_build_lookat(_camX, _camY, _camZ,
												_camX + _camDX, _camY + _camDY, _camZ + _camDZ,
												0, 0, 1));
												
	matrix_set(matrix_projection, matrix_build_projection_perspective_fov(global.fov, GAME_ASPECT,  1, 2000));
	shader_set(gFogCrunch);
	shader_set_uniform_f(u_fog_start2, global.fog_start);
	shader_set_uniform_f(u_fog_end2, global.fog_end);
	shader_set_uniform_f(u_fog_color2, global.fog_color_r, 0.0, 0.0, 1.0);
	vertex_submit(world_vbuff, pr_trianglelist, world_tex_0);
	shader_reset();
	
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	gpu_set_cullmode(cull_noculling);
	gpu_set_tex_repeat(false);
	matrix_set(matrix_world, _worldMat);
	matrix_set(matrix_view, _viewMat);
	matrix_set(matrix_projection, _projMat)
	surface_reset_target();
}