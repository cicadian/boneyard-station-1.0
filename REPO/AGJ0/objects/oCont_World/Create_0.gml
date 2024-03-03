surf_world = -1;

// texture stuff
tex_spr_size = 32;
tex_block_size = 34;
tex_sht_size = 256;
tex_pix_uvs  = 1 / tex_sht_size; // 1 pixel in UV coordinates
tex_spr_uvs  = tex_pix_uvs * tex_spr_size; // 32 pixels in UV coordinates
tex_spr_m_uvs = tex_spr_uvs + (tex_pix_uvs * 2); // 34 pixels in UV coordinates
texcoord_default_u = 0; // default start x position for world texture
texcoord_default_v = 0 + tex_pix_uvs; // default start y position for world_texture
texcoord_north_u  = (tex_spr_m_uvs * 1) + tex_pix_uvs;
texcoord_east_u   = (tex_spr_m_uvs * 2) + tex_pix_uvs;
texcoord_south_u  = (tex_spr_m_uvs * 3) + tex_pix_uvs;
texcoord_west_u   = (tex_spr_m_uvs * 4) + tex_pix_uvs;
texcoord_top_u    = (tex_spr_m_uvs * 5) + tex_pix_uvs;
texcoord_bottom_u = (tex_spr_m_uvs * 6) + tex_pix_uvs;

texcoord_wall_u    = 0;
texcoord_floor_u   = tex_pix_uvs * tex_block_size;
texcoord_ceiling_u = tex_pix_uvs * (tex_block_size * 2);

texcoord_kestrel_v = 0;
texcoord_station_v = tex_pix_uvs * tex_block_size;
texcoord_cargo_v   = tex_pix_uvs * (tex_block_size * 2);

// 3d stuff
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();
world_format = vertex_format_end();

world_vbuff = undefined;
world_tex = sprite_get_texture(sTex_World, 0);

door_tex = sprite_get_texture(sTex_Door, 0);

clickzone_tex = sprite_get_texture(sTex_Clickzone, 0);

global.fov = 70;
global.fog_on = true;
global.fog_color = c_black;
global.fog_start = CELL_SIZE;
global.fog_end = CELL_SIZE * 4;

global.world_grid = ds_grid_create(GAME_W, GAME_H);
ds_grid_clear(global.world_grid, __CELL_PATH.FULL);

door_buffer_list = ds_list_create();
door_count = 0;