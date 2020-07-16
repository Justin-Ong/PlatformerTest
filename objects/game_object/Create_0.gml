global.deaths = 0;
global.just_died = false;

ini_open("gamedata.ini");
global.jump_key = ini_read_real("controls", "jump_key", vk_space);
global.cling_key = ini_read_real("controls", "cling_key", vk_lshift);
global.left_key = ini_read_real("controls", "left_key", ord("A"));
global.right_key = ini_read_real("controls", "right_key", ord("D"));
global.duck_key = ini_read_real("controls", "duck_key", ord("S"));
global.reset_key = ini_read_real("controls", "reset_key", ord("R"));
global.hardcore_enabled = ini_read_real("settings", "hardcore_mode", 0);
ini_close();
