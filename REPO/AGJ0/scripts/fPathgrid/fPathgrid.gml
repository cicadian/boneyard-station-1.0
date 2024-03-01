/// @func pathgrid_get_empty
/// @desc {void} gets if a grid cell is empty or not on a pathgrid
/// @arg {real} grid_x
/// @arg {real} grid_y
function pathgrid_get_empty(_grid_x, _grid_y){
	var _empty = false;
	if (point_in_rectangle(_grid_x, _grid_y, 0, 0, GAME_W, GAME_H)){
		if (global.world_grid[# _grid_x, _grid_y] == __CELL_PATH.EMPTY){
			_empty = true;
		}
	}
	return _empty;
}