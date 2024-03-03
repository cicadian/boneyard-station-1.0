event_inherited();

regen_counter = 0;
regen_counter_max = 15 * 60; // regen one hp every 15 seconds

life = 4;
checkpoint_x = START_X;
checkpoint_y = START_Y;
checkpoint_dir = __CARDINAL.NORTH;

death_counter = 0;
death_counter_max = 60; // wait one second before player can prompt a respawn