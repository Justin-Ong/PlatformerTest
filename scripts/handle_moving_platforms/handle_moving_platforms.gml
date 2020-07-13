var platform = instance_place(x, y + 5, moving_platform);
if (platform != noone) {
	if (instance_exists(left_moving_wall_object) and 
		platform.object_index == left_moving_wall_object.object_index) {
		other.x += (platform.dir * platform.move_speed);
	}
	if (instance_exists(right_moving_wall_object) and 
		platform.object_index == right_moving_wall_object.object_index) {
		other.x += (platform.dir * platform.move_speed);
	}
	if (instance_exists(upwards_moving_wall_object) and 
		platform.object_index == upwards_moving_wall_object.object_index) {
		other.y += (platform.dir * platform.move_speed);
	}
	if (instance_exists(downwards_moving_wall_object) and 
		platform.object_index == downwards_moving_wall_object.object_index) {
		other.y += (platform.dir * platform.move_speed);
	}
}
