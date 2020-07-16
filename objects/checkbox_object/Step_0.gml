//Display text if player nearby
if (created == noone) {
	created = instance_create_layer(x + 120, y, "Text", text_object);
	created.text = self.text;
}
if (global.hardcore_enabled == 1) {
	image_index = 1;
}
else {
	image_index = 0;
}
