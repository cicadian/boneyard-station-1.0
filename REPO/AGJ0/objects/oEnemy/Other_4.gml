if (name == "MONSTER"){
	var _left  = instance_create_layer(x - CELL_SIZE, y, global.layer_cont);
	var _right = instance_create_layer(x + CELL_SIZE, y, global.layer_cont);
	_left.name  = "LEFT";
	_right.name = "RIGHT";
	tex = tex_monster;
	_left.tex = tex_monster_left;
	_right.tex = tex_monster_right;
}