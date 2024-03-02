#macro DEPTH_CONT -100

#macro CELL_SIZE 4
#macro NATIVE_W 320
#macro NATIVE_H 180
#macro WINDOW_SCALE 4

#macro LAYER_NAME_PATH "tile_path"

#macro GAME_ASPECT NATIVE_W / NATIVE_H

#macro START_X 224
#macro START_Y 4

#macro GAME_W room_width div CELL_SIZE
#macro GAME_H room_height div CELL_SIZE

enum __CELL_PATH {
	EMPTY,
	FULL
}

enum __CELL_WALLS {
	NORTH,
	EAST,
	SOUTH,
	WEST,
	TOP,
	BOTTOM,
	SIZE
}

enum __CARDINAL {
	EAST,
	NORTH,
	WEST,
	SOUTH,
	SIZE
}

enum __DOOR_ORIENTATION{
	HORIZONTAL,
	VERTICAL
}

#macro KEY_LEFT       vk_left
#macro KEY_RIGHT      vk_right
#macro KEY_FORWARD    vk_up
#macro KEY_BACKWARD   vk_down
#macro KEY_SKIP       vk_space
#macro MOUSE_INTERACT mb_left
#macro MOUSE_SHOOT    mb_right

#macro FONTMAP " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,!?:;'\"[]()"
#macro CHARMAX 32 // This is generally how many of the widest characters we can fit on a line, not used anywhere