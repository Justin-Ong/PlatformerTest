var player = instance_place(x, y, player_object);
if (player != noone) {
	player.y += (other.bbox_bottom - player.bbox_top);
}