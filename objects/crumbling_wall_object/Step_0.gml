if (place_meeting(x, y - 3, player_object) and not is_crumbling) {
	is_crumbling = true;
}

if (is_crumbling) {
	image_speed = crumble_speed;
	if (image_index >= (image_number - 1)) {
		has_crumbled = true;
		image_speed = 0;
	}
}

if (has_crumbled) {
	if (respawn_timer <= 0) {
		image_speed = 0;
		image_index = 0;
		has_crumbled = false;
		is_crumbling = false;
		respawn_timer = 30;
	}
	else {
		respawn_timer -= 1;
	}
}

var player = instance_place(x, y, player_object);
if (player != noone) {
	player.y += (other.bbox_bottom - player.bbox_top);
}