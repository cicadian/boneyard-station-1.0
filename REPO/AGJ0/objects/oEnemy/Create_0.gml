event_inherited();

death_counter = 0;
death_counter_max = 60; // wait one second before player can prompt a respawn

turn_left = false;
turn_right = false;
move_forward = false;
move_backward = false;
shoot_at_player = false;

name = "";

action_counter = 0;
action_counter_max = 60;

tex = sprite_get_texture(sTex_Enemy, 0);
vbuff = vertex_create_buffer();
var _vbuff = vbuff;
var _x1 = 0;
var _x2 = _x1 + CELL_SIZE;
var _y1 = 0;
var _y2 = _y1 + CELL_SIZE;
var _z1 = 0;
var _z2 = CELL_SIZE; 
var _u = 0;
var _v = 0;

vertex_begin(_vbuff, oCont_World.world_format);

vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z2);
vertex_texcoord(_vbuff, _u, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z2);
vertex_texcoord(_vbuff, _u + oCont_World.tex_spr_uvs, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z1);
vertex_texcoord(_vbuff, _u + oCont_World.tex_spr_uvs, _v + oCont_World.tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);

vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z2);
vertex_texcoord(_vbuff, _u, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z1);
vertex_texcoord(_vbuff, _u + oCont_World.tex_spr_uvs, _v + oCont_World.tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z1);
vertex_texcoord(_vbuff, _u, _v + oCont_World.tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);

vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
vertex_texcoord(_vbuff, _u, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z2);
vertex_texcoord(_vbuff, _u + oCont_World.tex_spr_uvs, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
vertex_texcoord(_vbuff, _u + oCont_World.tex_spr_uvs, _v + oCont_World.tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);

vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
vertex_texcoord(_vbuff, _u, _v);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
vertex_texcoord(_vbuff, _u + oCont_World.tex_spr_uvs, _v + oCont_World.tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);
vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z1);
vertex_texcoord(_vbuff, _u, _v + oCont_World.tex_spr_uvs);
vertex_colour(_vbuff, c_white, 1);

vertex_end(_vbuff);
vertex_freeze(_vbuff);