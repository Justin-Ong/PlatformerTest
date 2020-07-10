repeat(abs(vertical_speed)) {
    if (!place_meeting(x, y + sign(vertical_speed), solid_object)) {
        y += sign(vertical_speed); 
		script_execute(object_collisions);
	}
    else {
        vertical_speed = 0;
        break;
    }
}