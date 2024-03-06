event_inherited();

regen_counter = 0;
regen_counter_max = 15 * 60; // regen one hp every 15 seconds

life = 4;
checkpoint_x = START_X;
checkpoint_y = START_Y;
checkpoint_dir = __CARDINAL.NORTH;

vec_x = 0;
vec_y = 0;

death_counter = 0;
death_counter_max = 60; // wait one second before player can prompt a respawn

gun_out = false;
gun_x = 0;
gun_y = 0;

gun_counter = 90;
gun_counter_max = 90;
gun_fire_counter = 0;
gun_fire_counter_max = 15;
gun_fire = false;
gun_frame = 0;
target_x = mouse_x;
target_y = mouse_y;