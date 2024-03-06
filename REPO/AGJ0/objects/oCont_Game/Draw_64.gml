if (dialog_displayed){
	draw_sprite(sGUI_Log, 0, 0, DIALOG_Y - 8);
}
draw_text_ext(DIALOG_X, DIALOG_Y, dialog_string, 10, DIALOG_W);
if (cursor_spr != -1){
	draw_sprite(cursor_spr, oPlayer.gun_frame, mouse_x, mouse_y);
}
if (dialog_portrait != -1){
	draw_sprite(dialog_portrait, 0, PORT_X, PORT_Y);
}