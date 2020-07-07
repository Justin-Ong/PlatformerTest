//Sub-pixel movement
sub_pixel_x += horizontal_speed;
horizontal_speed = round(sub_pixel_x);
sub_pixel_x -= horizontal_speed;
sub_pixel_y += vertical_speed;
vertical_speed = round(sub_pixel_y);
sub_pixel_y -= vertical_speed;

script_execute(get_slope_angle);
is_up_slope = (place_meeting(x + facing, y, slope_object) and not place_meeting(x - facing, y, slope_object));
is_down_slope = (place_meeting(x - facing, y, slope_object) and not place_meeting(x + facing, y, slope_object));

if (not is_on_ground) {
	vertical_speed += grav;
}
//vertical_speed += vertical_change;
if (is_on_ground and space_pressed) {
	if (s_pressed) {
		vertical_speed -= crouch_jump_speed;
	}
	else {
		vertical_speed -= jump_speed;
	}
}

//Walljumping and wallsliding
if (is_touching_left_wall and not is_on_ground) {
	if (space_pressed) {
		vertical_speed -= wall_jump_vertical_speed;
		horizontal_speed += wall_jump_horizontal_speed;
	}
	if (shift_pressed and slide_timer < slide_time_limit) {
		vertical_speed *= slide_resistance;
		slide_timer += 1;
		effect_create_below(ef_smoke, x, y, 0, c_gray);
	}
}
else if (is_touching_right_wall and not is_on_ground) {
	if (space_pressed) {
		vertical_speed -= wall_jump_vertical_speed;
		horizontal_speed -= wall_jump_horizontal_speed;
	}
	if (shift_pressed and slide_timer < slide_time_limit) {
		vertical_speed *= slide_resistance;
		slide_timer += 1;
		effect_create_below(ef_smoke, x, y, 0, c_gray);
	}
}

if (not shift_pressed and slide_timer > 0) {
	slide_timer -= 0.5;
}
repeat(abs(vertical_speed)) {
	//Flat ground
    if (place_meeting(x, y + sign(vertical_speed), solid_object)) {
        vertical_speed = 0;
		break;
	}
    y += sign(vertical_speed);
}

if (is_up_slope) {
	if (abs(horizontal_speed) >= incline) {
		horizontal_speed -= sign(horizontal_speed) * incline;
	}
	else {
		horizontal_speed = 0;
	}
}

repeat(abs(horizontal_speed)) {
    //Slopes
	if (is_up_slope) {
		y -= 1;
	}
	else if (is_down_slope) {
		for (var i = 0; i < incline; i++) {
			if (not place_meeting(x, y + 1, wall_object)) {
				y += 1;
			}
		}
	}
	if (place_meeting(x + sign(horizontal_speed), y, solid_object)) {
        horizontal_speed = 0;
		break;
	}
	x += sign(horizontal_speed);
}

//More slope physics
if (rmb_pressed) {
	if (is_down_slope) {
		//Accelerate down slopes
		var tmp = "a: " + string(facing * incline * grav) + "i: " + string(incline);
		show_debug_message(tmp);
		horizontal_speed += facing * incline * grav;
	}
	else if (is_up_slope) {
		if (abs(horizontal_speed) == 0) {
			var tmp = "b: " + string(sign(horizontal_speed) * -1);
			show_debug_message(tmp);
			horizontal_speed = -1 * sign(horizontal_speed);	//Reverse direction
		}
		else if (abs(horizontal_speed) <= 1) {
			var tmp = "c: " + string(sign(horizontal_speed) * 0.1);
			show_debug_message(tmp);
			horizontal_speed = 0 * sign(horizontal_speed);
		}
		else {
			var tmp = "d: " + string(sign(horizontal_speed) * incline * grav * fric);
			show_debug_message(tmp);
			horizontal_speed -= sign(horizontal_speed) * incline * grav * fric;
		}
	}
	else if (horizontal_speed == 0) {
		if (place_meeting(x + 1, y + 1, slope_object) and not place_meeting(x, y + 1, wall_object)) {
			horizontal_speed = -1;	
		}
		else if (place_meeting(x - 1, y + 1, slope_object) and not place_meeting(x, y + 1, wall_object)) {
			horizontal_speed = 1;
		}
	}
}

//show_debug_message(horizontal_speed);
