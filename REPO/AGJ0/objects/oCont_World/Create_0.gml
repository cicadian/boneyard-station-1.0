surf_world = -1;
surf_fog = -1;

// texture stuff
tex_spr_size = 32;
tex_block_size = 34;
tex_sht_size = 256;
tex_pix_uvs  = 1 / tex_sht_size; // 1 pixel in UV coordinates
tex_spr_uvs  = tex_pix_uvs * tex_spr_size; // 32 pixels in UV coordinates
tex_spr_m_uvs = tex_spr_uvs + (tex_pix_uvs * 2); // 34 pixels in UV coordinates

texcoord_wall_u    = 0 + tex_pix_uvs;
texcoord_floor_u   = tex_pix_uvs * tex_block_size + tex_pix_uvs;
texcoord_ceiling_u = tex_pix_uvs * (tex_block_size * 3) + tex_pix_uvs;
texcoord_light_u = tex_pix_uvs * (tex_block_size * 2) + tex_pix_uvs;
texcoord_console_u = 0 + tex_pix_uvs;
texcoord_engine_u  = tex_pix_uvs * tex_block_size + tex_pix_uvs;
texcoord_armory_u  = tex_pix_uvs * (tex_block_size * 2) + tex_pix_uvs;
texcoord_lightswitch_u  = tex_pix_uvs * (tex_block_size * 5) + tex_pix_uvs;
texcoord_fuelslot_u     = tex_pix_uvs * (tex_block_size * 3) + tex_pix_uvs;
texcoord_fuel_u         = tex_pix_uvs * (tex_block_size * 4) + tex_pix_uvs;
texcoord_elevator_u     = tex_pix_uvs * (tex_block_size * 6) + tex_pix_uvs;
texcoord_door_u         = tex_pix_uvs * (tex_block_size * 4) + tex_pix_uvs;

texcoord_bloodmod_v = tex_pix_uvs * (tex_block_size * 4);

texcoord_kestrel_v = 0 + tex_pix_uvs;
texcoord_station_v = tex_pix_uvs * tex_block_size + tex_pix_uvs;
texcoord_cargo_v   = tex_pix_uvs * (tex_block_size * 2) + tex_pix_uvs;
texcoord_special_v = tex_pix_uvs * (tex_block_size * 3) + tex_pix_uvs;

// lighting
global.light_grid = -1;

// 3d stuff
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();
world_format = vertex_format_end();

world_light_vbuff = undefined;
world_tex_0 = sprite_get_texture(sTex_World, 0);
world_tex_1 = sprite_get_texture(sTex_World, 1);
world_tex_2 = sprite_get_texture(sTex_World, 2);

world_dark_vbuff = undefined;

world_vbuff = world_light_vbuff;

door_tex = sprite_get_texture(sTex_Door, 0);

clickzone_tex = sprite_get_texture(sTex_Clickzone, 0);

global.fov = 70;
global.fog_on = true;
global.fog_color_r = 0.0;
global.fog_start = CELL_SIZE * 0;
global.fog_end = CELL_SIZE * 4;
global.light_ambient = 1;
global.light_toggle = false;

u_fog_start = shader_get_uniform(gPos, "u_fog_start");
u_fog_end   = shader_get_uniform(gPos, "u_fog_end");
u_fog_color = shader_get_uniform(gPos, "u_fog_color");
u_gamma = shader_get_uniform(gPos, "u_gamma");
global.gamma = 0;

u_fog_start2 = shader_get_uniform(gFogCrunch, "u_fog_start");
u_fog_end2   = shader_get_uniform(gFogCrunch, "u_fog_end");
u_fog_color2 = shader_get_uniform(gFogCrunch, "u_fog_color");

global.world_grid = ds_grid_create(GAME_W, GAME_H);
ds_grid_clear(global.world_grid, __CELL_PATH.FULL);

door_buffer_list = ds_list_create();
door_buffer_list_dark = ds_list_create();
door_count = 0;

hit_counter = 0;
hit_counter_max = 60;
hit = false;