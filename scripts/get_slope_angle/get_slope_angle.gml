var angle_found = false;

for (incline = 1; incline <= 8; incline++) {
	//Up slope
	if (is_up_slope) {
		if (place_meeting(x + facing, y - (incline - 1), slope_object)) {
			if (not place_meeting(x + facing, y - incline , slope_object)) {
				angle_found = true;
				break;
			}
		}
	}
	//Down slope
	else if (is_down_slope) {
		if (not place_meeting(x + facing, y + incline, slope_object)) {
			if (place_meeting(x + facing, y + (incline + 1) , slope_object)) {
				angle_found = true;
				break;
			}
		}
	}
}

if (not angle_found) {
	incline = 0;
}
