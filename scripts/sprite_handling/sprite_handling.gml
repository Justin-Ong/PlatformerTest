//Sprite handling
if (is_on_ground and duck_pressed) {
	sprite_index = player_crouch_sprite;
}
else {
	sprite_index = player_sprite;
}
if (horizontal_speed != 0) {
	image_xscale = facing;	
}
