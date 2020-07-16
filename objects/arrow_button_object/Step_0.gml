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
		is_changing = false;
		ini_open("gamedata.ini");
		ini_write_real("controls", key, keyboard_key);
		ini_close();
		script_execute(read_ini);
		text = replace_controls_text(text, key);
	}
}