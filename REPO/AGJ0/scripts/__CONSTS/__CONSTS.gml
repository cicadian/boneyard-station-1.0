#macro DEPTH_CONT -100

#macro CELL_SIZE 4
#macro NATIVE_W 320
#macro NATIVE_H 180
#macro WINDOW_SCALE 4

#macro LAYER_NAME_PATH "tile_path"

#macro GAME_ASPECT NATIVE_W / NATIVE_H

#macro START_X 224
#macro START_Y 12

#macro GAME_W room_width div CELL_SIZE
#macro GAME_H room_height div CELL_SIZE

enum __CELL_PATH {
	EMPTY,
	FULL
}

enum __CELL_WALLS {
	EAST,
	NORTH,
	WEST,
	SOUTH,
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

enum __CLICKZONE_TYPE{
	START_CONSOLE,
	ARMORY,
	ENGINE,
	START_EXIT,
	EMERGENCY_LIGHTSWITCH,
	FUEL_SLOT,
	ELEVATOR_UP,
	ELEVATOR_DOWN,
	FUEL,
	BRIDGE_CONSOLE,
	CAPTAIN,
	
	DOOR_FAKE,
	RUBBLE,
	
	NONE
}

enum __WALKZONE_TYPE{
	ARMORY,
	STATION,
	CARGO,
	ENEMIES
}

#macro PORT_X 2
#macro PORT_Y 122
#macro DIALOG_X 40
#macro DIALOG_Y 128
#macro DIALOG_W 270

#macro KEY_LEFT       ord("A")
#macro KEY_RIGHT      ord("D")
#macro KEY_FORWARD    ord("W")
#macro KEY_BACKWARD   ord("S")
#macro KEY_SKIP       vk_space
#macro MOUSE_INTERACT mb_left
#macro MOUSE_SHOOT    mb_right

#macro FONTMAP " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,!?:;'\"[]()"
#macro CHARMAX 32 // This is generally how many of the widest characters we can fit on a line, not used anywhere