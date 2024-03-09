event_inherited();

death_counter = 0;
death_counter_max = 60; // wait one second before player can prompt a respawn

turn_left = false;
turn_right = false;
move_forward = false;
move_backward = false;
shoot_at_player = false;

name = "";
life = 1;

action_counter = 0;
action_counter_max = 90;

tex_south = sprite_get_texture(sEnemy_Tex, 1);
tex_west = sprite_get_texture(sEnemy_Tex, 2);
tex_north = sprite_get_texture(sEnemy_Tex, 3);
tex_east = sprite_get_texture(sEnemy_Tex, 0);
tex_dead = sprite_get_texture(sEnemy_Tex, 4);
tex_monster = sprite_get_texture(sEnemy_Tex, 5);
tex_monster_left = sprite_get_texture(sEnemy_Tex, 6);
tex_monster_right = sprite_get_texture(sEnemy_Tex, 7);

tex = tex_north;
vbuff = vertex_create_buffer();
var _vbuff = vbuff;
var _x1 = -CELL_SIZE / 2;
var _x2 = CELL_SIZE / 2
var _y1 = -CELL_SIZE / 2;
var _y2 = CELL_SIZE / 2;
var _z1 = 0;
var _z2 = CELL_SIZE;
var _u = 0;
var _v = 0;

tex_sht_size = 34;
tex_pix_uvs  = 1 / tex_sht_size;
_u = tex_pix_uvs
_v = tex_pix_uvs
tex_spr_uvs = 32 * tex_pix_uvs;

vertex_begin(_vbuff, oCont_World.world_format);

vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
vertex_texcoord(_vbuff, _u, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z2);
vertex_texcoord(_vbuff, _u + tex_spr_uvs, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
vertex_texcoord(_vbuff, _u + tex_spr_uvs, _v + tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);

vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
vertex_texcoord(_vbuff, _u, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
vertex_texcoord(_vbuff, _u + tex_spr_uvs, _v + tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z1);
vertex_texcoord(_vbuff, _u, _v + tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);

vertex_end(_vbuff);
vertex_freeze(_vbuff);