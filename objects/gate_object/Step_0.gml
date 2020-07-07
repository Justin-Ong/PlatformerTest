var coins_remaining = instance_number(coin_object);
if (coins_remaining == 0) {
	is_open = true;
}

if (is_open and not has_opened) {
	image_speed = 1;
	if (image_index == (image_number - 7)) {
		has_opened = true;
		image_speed = 0.75;
	}
}

if (has_opened) {
	if (image_index >= (image_number - 1)) {
		image_speed = 0.75;
		image_index = image_number - 6;
	}
}