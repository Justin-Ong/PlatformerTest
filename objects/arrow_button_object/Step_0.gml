if (created == noone) {
	created = instance_create_layer(x, y, "Text", text_object);
	created.text = self.text;
}

if (is_changing) {
	if (created != noone) {
		instance_destroy(created);
		created = noone;
	}
	if (keyboard_key != 0) {
		new_key = keyboard_key;
		is_changing = false;
		ini_open("gamedata.ini");
		ini_write_real("controls", key, new_key);
		ini_close();
		script_execute(get_controls);
	}
}