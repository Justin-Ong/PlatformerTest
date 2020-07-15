ini_open("gamedata.ini");
global.jump_key = ini_read_real("controls", "jump_key", vk_space);
global.cling_key = ini_read_real("controls", "cling_key", vk_lshift);
global.left_key = ini_read_real("controls", "left_key", ord("A"));
global.right_key = ini_read_real("controls", "right_key", ord("D"));
global.duck_key = ini_read_real("controls", "duck_key", ord("S"));
global.reset_key = ini_read_real("controls", "reset_key", ord("R"));
ini_close();
