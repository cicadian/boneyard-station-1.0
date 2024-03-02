/// @func world_build
/// @desc {void} builds the game world grid
function world_build(){
	tile_to_grid(LAYER_NAME_PATH, global.world_grid, __CELL_PATH.EMPTY);
	
	world_vbuff = vertex_create_buffer();
	vertex_begin(world_vbuff, world_format);
	for (var _h = 0; _h < NATIVE_H div CELL_SIZE; _h++){
		for (var _w = 0; _w < NATIVE_W div CELL_SIZE; _w++){
			world_build_cell(_w, _h);
		}
	}
	vertex_end(world_vbuff);
	vertex_freeze(world_vbuff);
	
	var _vbuff;
	with (oDoor){
		var _x1 = grid_x * CELL_SIZE;
		var _x2 = _x1 + CELL_SIZE;
		var _y1 = grid_y * CELL_SIZE;
		var _y2 = _y1 + CELL_SIZE;
		var _z1 = 0;
		var _z2 = CELL_SIZE; 
		_vbuff = vertex_create_buffer();
		vertex_begin(_vbuff, other.world_format);
		if (orientation == __DOOR_ORIENTATION.HORIZONTAL){
			vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z2);
			vertex_texcoord(_vbuff, other.texcoord_default_u, other.texcoord_default_v);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z2);
			vertex_texcoord(_vbuff, other.texcoord_default_u + other.tex_spr_uvs, other.texcoord_default_v);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z1);
			vertex_texcoord(_vbuff, other.texcoord_default_u + other.tex_spr_uvs, other.texcoord_default_v + other.tex_spr_uvs);
			vertex_colour(_vbuff, c_white, 1);

			vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z2);
			vertex_texcoord(_vbuff, other.texcoord_default_u, other.texcoord_default_v);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y2, _z1);
			vertex_texcoord(_vbuff, other.texcoord_default_u + other.tex_spr_uvs, other.texcoord_default_v + other.tex_spr_uvs);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x2 - (CELL_SIZE / 2), _y1, _z1);
			vertex_texcoord(_vbuff, other.texcoord_default_u, other.texcoord_default_v + other.tex_spr_uvs);
			vertex_colour(_vbuff, c_white, 1);
		}
		else if (orientation == __DOOR_ORIENTATION.VERTICAL){
			vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
			vertex_texcoord(_vbuff, other.texcoord_default_u, other.texcoord_default_v);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z2);
			vertex_texcoord(_vbuff, other.texcoord_default_u + other.tex_spr_uvs, other.texcoord_default_v);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
			vertex_texcoord(_vbuff, other.texcoord_default_u + other.tex_spr_uvs, other.texcoord_default_v + other.tex_spr_uvs);
			vertex_colour(_vbuff, c_white, 1);

			vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z2);
			vertex_texcoord(_vbuff, other.texcoord_default_u, other.texcoord_default_v);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x2, _y1 + (CELL_SIZE / 2), _z1);
			vertex_texcoord(_vbuff, other.texcoord_default_u + other.tex_spr_uvs, other.texcoord_default_v + other.tex_spr_uvs);
			vertex_colour(_vbuff, c_white, 1);
			vertex_position_3d(_vbuff, _x1, _y1 + (CELL_SIZE / 2), _z1);
			vertex_texcoord(_vbuff, other.texcoord_default_u, other.texcoord_default_v + other.tex_spr_uvs);
			vertex_colour(_vbuff, c_white, 1);
		}
		vertex_end(_vbuff);
		vertex_freeze(_vbuff);
		var _map = ds_map_create();
		_map[? "VBUFF"] = _vbuff;
		_map[? "ID"]    = id;
		ds_list_add(other.door_buffer_list, _map);
		other.door_count++;
		ds_list_mark_as_map(other.door_buffer_list, other.door_count);
	}
}

/// @func world_build_cell
/// @desc {void} builds a world cell
/// @arg {real} grid_x
/// @arg {real} grid_y
function world_build_cell(_grid_x, _grid_y){
	for (var _i = 0; _i < __CELL_WALLS.SIZE; _i++){
		var _is_empty = global.world_grid[# _grid_x, _grid_y] == __CELL_PATH.EMPTY;
		if (_is_empty){
			world_build_wall(_grid_x, _grid_y, _i);
		}
	}
}

/// @func world_build_wall
/// @desc {void} builds a world cell wall
/// @arg {real} grid_x
/// @arg {real} grid_y
/// @arg {real} type
function world_build_wall(_grid_x, _grid_y, _type){
	var _x1 = _grid_x * CELL_SIZE;
	var _x2 = _x1 + CELL_SIZE;
	var _y1 = _grid_y * CELL_SIZE;
	var _y2 = _y1 + CELL_SIZE;
	var _z1 = 0;
	var _z2 = CELL_SIZE; 
	var _build = false;
	switch(_type){
		case __CELL_WALLS.NORTH:
			_build = !pathgrid_get_empty(_grid_x, _grid_y - 1);
			if (_build){
				vertex_position_3d(world_vbuff, _x1, _y1, _z2);
				vertex_texcoord(world_vbuff, texcoord_north_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y1, _z2);
				vertex_texcoord(world_vbuff, texcoord_north_u + tex_spr_uvs, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y1, _z1);
				vertex_texcoord(world_vbuff, texcoord_north_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);

				vertex_position_3d(world_vbuff, _x1, _y1, _z2);
				vertex_texcoord(world_vbuff, texcoord_north_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y1, _z1);
				vertex_texcoord(world_vbuff, texcoord_north_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y1, _z1);
				vertex_texcoord(world_vbuff, texcoord_north_u, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
			}
			break;
		case __CELL_WALLS.EAST:
			_build = !pathgrid_get_empty(_grid_x + 1, _grid_y);
			if (_build){
				vertex_position_3d(world_vbuff, _x2, _y1, _z2);
				vertex_texcoord(world_vbuff, texcoord_east_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y2, _z2);
				vertex_texcoord(world_vbuff, texcoord_east_u + tex_spr_uvs, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y2, _z1);
				vertex_texcoord(world_vbuff, texcoord_east_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);

				vertex_position_3d(world_vbuff, _x2, _y1, _z2);
				vertex_texcoord(world_vbuff, texcoord_east_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y2, _z1);
				vertex_texcoord(world_vbuff, texcoord_east_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y1, _z1);
				vertex_texcoord(world_vbuff, texcoord_east_u, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
			}
			break;
		case __CELL_WALLS.SOUTH:
			_build = !pathgrid_get_empty(_grid_x, _grid_y + 1);
			if (_build){
				vertex_position_3d(world_vbuff, _x2, _y2, _z2);
				vertex_texcoord(world_vbuff, texcoord_south_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y2, _z2);
				vertex_texcoord(world_vbuff, texcoord_south_u + tex_spr_uvs, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y2, _z1);
				vertex_texcoord(world_vbuff, texcoord_south_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);

				vertex_position_3d(world_vbuff, _x2, _y2, _z2);
				vertex_texcoord(world_vbuff, texcoord_south_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y2, _z1);
				vertex_texcoord(world_vbuff, texcoord_south_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x2, _y2, _z1);
				vertex_texcoord(world_vbuff, texcoord_south_u, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
			}
			break;
		case __CELL_WALLS.WEST:
			_build = !pathgrid_get_empty(_grid_x - 1, _grid_y);
			if (_build){
				vertex_position_3d(world_vbuff, _x1, _y2, _z2);
				vertex_texcoord(world_vbuff, texcoord_west_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y1, _z2);
				vertex_texcoord(world_vbuff, texcoord_west_u + tex_spr_uvs, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y1, _z1);
				vertex_texcoord(world_vbuff, texcoord_west_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);

				vertex_position_3d(world_vbuff, _x1, _y2, _z2);
				vertex_texcoord(world_vbuff, texcoord_west_u, texcoord_default_v);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y1, _z1);
				vertex_texcoord(world_vbuff, texcoord_west_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
				vertex_position_3d(world_vbuff, _x1, _y2, _z1);
				vertex_texcoord(world_vbuff, texcoord_west_u, texcoord_default_v + tex_spr_uvs);
				vertex_colour(world_vbuff, c_white, 1);
			}
			break;
		case __CELL_WALLS.TOP:
			vertex_position_3d(world_vbuff, _x1, _y1, _z2);
			vertex_texcoord(world_vbuff, texcoord_top_u, texcoord_default_v);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x2, _y1, _z2);
			vertex_texcoord(world_vbuff, texcoord_top_u + tex_spr_uvs, texcoord_default_v);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_top_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
			vertex_colour(world_vbuff, c_white, 1);

			vertex_position_3d(world_vbuff, _x1, _y1, _z2);
			vertex_texcoord(world_vbuff, texcoord_top_u, texcoord_default_v);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_top_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x1, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_top_u, texcoord_default_v + tex_spr_uvs);
			vertex_colour(world_vbuff, c_white, 1);
			break;
		case __CELL_WALLS.BOTTOM:
			vertex_position_3d(world_vbuff, _x1, _y1, _z1);
			vertex_texcoord(world_vbuff, texcoord_bottom_u, texcoord_default_v);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x2, _y1, _z1);
			vertex_texcoord(world_vbuff, texcoord_bottom_u + tex_spr_uvs, texcoord_default_v);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z1);
			vertex_texcoord(world_vbuff, texcoord_bottom_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
			vertex_colour(world_vbuff, c_white, 1);

			vertex_position_3d(world_vbuff, _x1, _y1, _z1);
			vertex_texcoord(world_vbuff, texcoord_bottom_u, texcoord_default_v);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z1);
			vertex_texcoord(world_vbuff, texcoord_bottom_u + tex_spr_uvs, texcoord_default_v + tex_spr_uvs);
			vertex_colour(world_vbuff, c_white, 1);
			vertex_position_3d(world_vbuff, _x1, _y2, _z1);
			vertex_texcoord(world_vbuff, texcoord_bottom_u, texcoord_default_v + tex_spr_uvs);
			vertex_colour(world_vbuff, c_white, 1);
			break;
	}
}

/// @func world_cleanup
/// @desc {void} frees memory of the game world
function world_cleanup(){

}