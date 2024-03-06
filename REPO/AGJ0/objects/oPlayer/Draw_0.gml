if (gun_fire){
	draw_triangle(gun_x + LASER_X - 8, gun_y + LASER_Y - 4, gun_x + LASER_X + 8, gun_y + LASER_Y + 4, target_x, target_y, false);
	draw_triangle(gun_x + LASER_X - 4, gun_y + LASER_Y - 8, gun_x + LASER_X + 4, gun_y + LASER_Y + 8, target_x, target_y, false);
	draw_set_color(c_lime);
	draw_triangle(gun_x + LASER_X - 6, gun_y + LASER_Y - 3, gun_x + LASER_X + 6, gun_y + LASER_Y + 3, target_x, target_y, false);
	draw_triangle(gun_x + LASER_X - 3, gun_y + LASER_Y - 6, gun_x + LASER_X + 3, gun_y + LASER_Y + 6, target_x, target_y, false);
	draw_set_color(c_white);
}
if (gun_out){
	draw_sprite(sGun, 0, gun_x, gun_y);
}