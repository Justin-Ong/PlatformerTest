if (y <= initial_y - y_limit) {
	dir = 1;
}
else if (y >= initial_y) {
	dir = -1;
}

y += dir * move_speed;