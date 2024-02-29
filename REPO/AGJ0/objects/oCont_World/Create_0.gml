tex_world = sprite_get_texture(sTex_World, 0);
tex_spr_size = 32;
tex_sht_size = 512;
tex_pix_uvs  = 1 / tex_sht_size; // 1 pixel in UV coordinates
tex_spr_uvs  = tex_pix_uvs * tex_spr_size; // 32 pixels in UV coordinates
texcoord_default_x = tex_pix_uvs; // default start x position for world texture
texcoord_default_y = tex_pix_uvs; // default start y position for world_texture
texcoord_north_x  = texcoord_default_x + (tex_spr_uvs * 1) + (tex_pix_uvs * 1);
texcoord_east_x   = texcoord_default_x + (tex_spr_uvs * 2) + (tex_pix_uvs * 2);
texcoord_south_x  = texcoord_default_x + (tex_spr_uvs * 3) + (tex_pix_uvs * 3);
texcoord_west_x   = texcoord_default_x + (tex_spr_uvs * 4) + (tex_pix_uvs * 4);
texcoord_top_x    = texcoord_default_x + (tex_spr_uvs * 5) + (tex_pix_uvs * 5);
texcoord_bottom_x = texcoord_default_x + (tex_spr_uvs * 6) + (tex_pix_uvs * 6);

