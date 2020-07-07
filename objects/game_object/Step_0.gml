//Death counter
if (global.just_died) {
	death_counter = instance_create_layer(room_width / 2, room_height / 2, "Text", death_counter_object);
	death_counter.text = string(global.deaths);
	global.just_died = false;
}
