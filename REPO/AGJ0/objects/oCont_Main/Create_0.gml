application_surface_draw_enable(false);
window_set_size(NATIVE_W * WINDOW_SCALE, NATIVE_H * WINDOW_SCALE);

global.layer_cont = layer_create(DEPTH_CONT);

instance_create_layer(START_X + CELL_SIZE / 2, START_Y + CELL_SIZE / 2, global.layer_cont, oPlayer);
instance_create_layer(0, 0, global.layer_cont, oCont_World);

window_center();
display_set_gui_size(1280, 720);