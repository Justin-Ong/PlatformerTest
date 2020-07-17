var coins_remaining = instance_number(coin_object);
if (coins_remaining == 0 and get_secret_status(room - 3) == false) {
	is_visible = true;
}

if (is_visible) {
	image_speed = 0.75;
	if (image_index >= (image_number - 1)) {
		image_speed = 0.75;
		image_index = 1;
	}
}
