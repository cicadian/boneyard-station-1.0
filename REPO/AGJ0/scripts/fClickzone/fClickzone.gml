/// @func clickzone_build
/// @desc {void} builds a clickzone wall
/// @arg {id} id
function clickzone_build(_id){
	_id.vbuff = vertex_create_buffer();
	vertex_begin(_id.vbuff, oCont_World.world_format);
	var _u = oCont_World.texcoord_floor_u;
	switch (_id.type){
		case __CLICKZONE_TYPE.START_CONSOLE:
			_u = oCont_World.texcoord_console_u;
			break;
		case __CLICKZONE_TYPE.ENGINE:
			_u = oCont_World.texcoord_engine_u;
			break;
		case __CLICKZONE_TYPE.ARMORY:
			_u = oCont_World.texcoord_armory_u;
			break;
	}
	var _v = oCont_World.texcoord_special_v;
	world_build_wall(_id.grid_x, _id.grid_y, _id.wall, _id.vbuff, _u, _v);
	vertex_end(_id.vbuff);
	vertex_freeze(_id.vbuff);
}
/// @func clickzone_execute
/// @desc {void} runs clickzone behavior
/// @arg {id} id
function clickzone_execute(_id){
	switch (_id.type){
		case __CLICKZONE_TYPE.START_CONSOLE:
			//dialog event for pressing console at start
			oCont_Game.dialog_index = __DIALOG.BRIDGE_CONSOLE_START;
			break;
		case __CLICKZONE_TYPE.ARMORY:
			//dialog event for pressing console at start
			if (_id.stage == 0){
				_id.tex = oCont_World.world_tex_1;
				_id.stage++;
			}
			else if (_id.stage == 1){
				oCont_Game.dialog_index = __DIALOG.ARMORY_GET_GUN;
				_id.tex = oCont_World.world_tex_2;
				_id.stage++;
			}
			else if (_id.stage == 2){
				oCont_Game.dialog_index = __DIALOG.ARMORY_HAVE_GUN;
			}
			break;
	}
}