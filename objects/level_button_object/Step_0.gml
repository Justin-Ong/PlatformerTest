//Display text if player nearby
if (created == noone) {
	created = instance_create_layer(x, y, "Text", text_object);
	created.text = self.text;
}
