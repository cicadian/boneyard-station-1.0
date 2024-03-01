// Render world
if (world_vbuff != undefined){
	if (!surface_exists(surf_world)){
		surf_world = surface_create(NATIVE_W, NATIVE_H);
	}
	surface_set_target(surf_world);
	draw_clear_alpha(c_black, 1);
	var _worldMat = matrix_get(matrix_world);
	var _viewMat = matrix_get(matrix_view);
	var _projMat = matrix_get(matrix_projection);
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_cullmode(cull_noculling);
	gpu_set_tex_repeat(true);
	
	var _camX = oPlayer.x;
	var _camY = oPlayer.y;
	var _camZ = oPlayer.z;
	var _camDX = dcos(oPlayer.dir + -oPlayer.yaw);
	var _camDY = -dsin(oPlayer.dir + -oPlayer.yaw);
	var _camDZ = -dsin(oPlayer.pitch);
	
	matrix_set(matrix_view, matrix_build_lookat(_camX, _camY, _camZ,
												_camX + _camDX, _camY + _camDY, _camZ + _camDZ,
												0, 0, 1));
												
	matrix_set(matrix_projection, matrix_build_projection_perspective_fov(global.fov, GAME_ASPECT,  1, 2000));
	//gpu_set_fog(global.fog_on, global.fog_color, global.fog_start, global.fog_end);
	
	vertex_submit(world_vbuff, pr_trianglelist, world_tex);
	
	//gpu_set_fog(false, global.fog_color, global.fog_start, global.fog_end);
	
	//shader_reset();
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	gpu_set_cullmode(cull_noculling);
	gpu_set_tex_repeat(false);
	matrix_set(matrix_world, _worldMat);
	matrix_set(matrix_view, _viewMat);
	matrix_set(matrix_projection, _projMat)
	surface_reset_target();
}