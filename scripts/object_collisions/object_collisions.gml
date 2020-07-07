//Collision with coins
var coin = instance_place(x, y, coin_object)
if (coin) {
	audio_play_sound(coin_collect_sound, 1, false);
	with (coin) {
		instance_destroy();
	}
}

//Collision with hazards
if (place_meeting(x, y, hazard_object)) {
	audio_play_sound(death_sound, 1, false);
	global.deaths += 1;
	global.just_died = true;
	room_restart();
}

//Collision with gate
var gate = instance_place(x, y, gate_object);
if (gate) {
	if (gate.is_open) {
		audio_play_sound(gate_sound, 1, false);
		if room_exists(room_next(room)) {
			room_goto_next();
		}
		else {
			room_goto(room_first);
		}
	}
}
