if (global.hardcore_enabled) {
	global.hardcore_enabled = 0;
	ini_open("gamedata.ini");
	ini_write_real("settings", key, 0);
	ini_close();
	script_execute(read_ini);
}
else {
	global.hardcore_enabled = 1;
	ini_open("gamedata.ini");
	ini_write_real("settings", key, 1);
	ini_close();
	script_execute(read_ini);
}