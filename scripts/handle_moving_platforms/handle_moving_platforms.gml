var platform = instance_place(x, y + 5, moving_platform);
if (platform != noone) {
	if (platform.object_index == horizontal_moving_platform.object_index) {
		other.x += (platform.dir * platform.move_speed);
	}
	else if (platform.object_index == vertical_moving_platform.object_index) {
		other.y += (platform.dir * platform.move_speed);
	}
}
