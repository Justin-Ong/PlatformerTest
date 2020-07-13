if (x >= initial_x + x_limit) {
	dir = -1;
}
else if (x <= initial_x) {
	dir = 1
}

x += dir * move_speed;

var player = instance_place(x, y, player_object);
if (player != noone) {
	player.x += dir * move_speed;
}