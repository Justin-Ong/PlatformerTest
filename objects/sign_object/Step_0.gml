//Display text if player nearby
if collision_circle(x, y, 256, player_object, false, true) {
	if (created == noone) {
		created = instance_create_layer(x, y - 50, "Text", text_object);
		created.text = self.text;
	}
}
else if (created != noone) {
	instance_destroy(created);
	created = noone;
}
