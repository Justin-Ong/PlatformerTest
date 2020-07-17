//Collision with coins
var coin = instance_place(x, y, coin_object);
if (coin) {
	audio_play_sound(coin_collect_sound, 1, false);
	with (coin) {
		instance_destroy();
	}
}

//Collision with secret
var secret = instance_place(x, y, secret_object);
if (secret and secret.is_visible) {
	audio_play_sound(coin_collect_sound, 1, false);
	with (secret) {
		instance_destroy();
	}
	var level = room - 3; //exclude main menu, level select, options
	ini_open("gamedata.ini");
	ini_write_real("secrets", level, 1);
	ini_close();
	script_execute(read_ini);
}

//Collision with hazards
if (place_meeting(x, y, hazard_object)) {
	audio_play_sound(death_sound, 1, false);
	instance_destroy();
	if (global.hardcore_enabled == 1) {
		room_goto(main_menu);
	}
	else {
		global.deaths += 1;
		global.just_died = true;
		room_restart();
	}
}

//Collision with gate
var gate = instance_place(x, y, gate_object);
if (gate) {
	if (gate.is_open) {
		audio_play_sound(gate_sound, 1, false);
		if room_exists(room_next(room)) {
			instance_destroy();
			room_goto_next();
		}
		else {
			instance_destroy();
			room_goto(main_menu);
		}
	}
}
