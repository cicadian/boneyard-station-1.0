if (draw_imtired){
	draw_surface(surf_spatter, 0, 0);
}
if (draw_animatic){
	draw_sprite(spr_animatic, animatic_frame, 0, 0);
	if (animatic_string != ""){
		//draw_sprite(sGUI_Log, 0, 0, DIALOG_Y - 8 + 40);
		draw_set_color(c_black);
		draw_text_ext(DIALOG_X, DIALOG_Y + 2, animatic_string, 10, DIALOG_W);
		draw_text_ext(DIALOG_X+1, DIALOG_Y + 2, animatic_string, 10, DIALOG_W);
		draw_text_ext(DIALOG_X+1, DIALOG_Y + 1, animatic_string, 10, DIALOG_W);
		draw_set_color(c_dkgray);
		draw_text_ext(DIALOG_X, DIALOG_Y + 1, animatic_string, 10, DIALOG_W);
		draw_set_color(c_white);
		draw_text_ext(DIALOG_X, DIALOG_Y, animatic_string, 10, DIALOG_W);
	}
}
if (draw_intro){
	draw_sprite(sDeerbell, intro_frame, 0, 0);
}
if (draw_black){
	draw_surface(surf_spatter, 0, 0);
}

if (dialog_displayed){
	draw_sprite(sGUI_Log, 0, 0, DIALOG_Y - 8);
}
draw_set_color(c_black);
draw_text_ext(DIALOG_X, DIALOG_Y + 2, dialog_string, 10, DIALOG_W);
draw_text_ext(DIALOG_X+1, DIALOG_Y + 2, dialog_string, 10, DIALOG_W);
draw_text_ext(DIALOG_X+1, DIALOG_Y + 1, dialog_string, 10, DIALOG_W);
draw_set_color(c_dkgray);
draw_text_ext(DIALOG_X, DIALOG_Y + 1, dialog_string, 10, DIALOG_W);
draw_set_color(c_white);
draw_text_ext(DIALOG_X, DIALOG_Y, dialog_string, 10, DIALOG_W);
if (cursor_spr != -1){
	draw_sprite(cursor_spr, oPlayer.gun_frame, mouse_x, mouse_y);
}
if (dialog_portrait != -1){
	draw_sprite(dialog_portrait, 0, PORT_X, PORT_Y);
}