/// @func clickzone_build
/// @desc {void} builds a clickzone wall
/// @arg {id} id
function clickzone_build(_id){
	vbuff = vertex_create_buffer();
	vertex_begin(vbuff, oCont_World.world_format);
	var _u = oCont_World.texcoord_default_u;
	var _v = oCont_World.texcoord_default_v;
	world_build_wall(_id.grid_x, _id.grid_y, _id.wall, vbuff, _u, _v);
	vertex_end(vbuff);
	vertex_freeze(vbuff);
}