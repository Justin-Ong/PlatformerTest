text = "Thanks for playing!"

if (global.secret0 == 1 and
	global.secret1 == 1 and
	global.secret2 == 1 and
	global.secret3 == 1 and
	global.secret4 == 1 and
	global.secret5 == 1 and
	global.secret6 == 1 and
	global.secret7 == 1 and
	global.secret8 == 1 and
	global.secret9 == 1 and
	global.secret10 == 1 and
	global.secret11 == 1 and
	global.secret12 == 1 and
	global.secret13 == 1 and
	global.secret14 == 1) {
	text += "\nYou collected all the secrets!";
}
else {
	var collected = 0;
	for (var i = 0; i <= 15; i++) {
		if (variable_global_get("secret" + string(i)) == 1) {
			collected += 1;
		}
	}
	text += "\nYou collected " + string(collected) + " out of 16 secrets";
}

return text;