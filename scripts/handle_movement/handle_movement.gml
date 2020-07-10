//Variables for movement
is_on_ground = place_meeting(x, y + 3, solid_object);
is_touching_left_wall = place_meeting(x - 1, y, solid_object);
is_touching_right_wall = place_meeting(x + 1, y, solid_object);

//Sprite facing
var movement = 0;
if (a_pressed and not d_pressed) {
	movement = -1;
	facing = -1;
}
else if (d_pressed and not a_pressed) {
	movement = 1;
	facing = 1;
}
else {
	movement = 0;
}

horizontal_accel = air_accel;
if (is_on_ground) {
	horizontal_accel = ground_accel;
}
horizontal_speed += movement * horizontal_accel;


if (not is_on_ground) {
	vertical_speed += grav;
}
if (is_on_ground and space_pressed) {
	if (s_pressed) {
		vertical_speed -= crouch_jump_speed;
	}
	else {
		vertical_speed -= jump_speed;
	}
}

//Sub-pixel movement
sub_pixel_x += horizontal_speed;
horizontal_speed = round(sub_pixel_x);
sub_pixel_x -= horizontal_speed;
sub_pixel_y += vertical_speed;
vertical_speed = round(sub_pixel_y);
sub_pixel_y -= vertical_speed;

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
		show_debug_message("bonk0")
		break;
	}
    y += sign(vertical_speed);
	script_execute(object_collisions);
}

//Horizontal motion
var upslope_slowed = false;
repeat(abs(horizontal_speed)) {
	//Check for slopes
	var slope = instance_nearest(x, y, slope_object);
	is_up_slope = (place_meeting(x + facing, y + 1, slope_object) and not place_meeting(x - facing, y - 1, slope_object) and
		slope.bbox_bottom >= other.bbox_bottom);
	is_down_slope = (place_meeting(x - facing, y + 1, slope_object) and not place_meeting(x + facing, y - 1, slope_object) or 
		(place_meeting(x + facing, y + 1, slope_object) and not is_up_slope) and slope.bbox_bottom >= other.bbox_bottom);
	if (is_up_slope or is_down_slope) {
		script_execute(get_slope_angle);
	}
	
	//Slow down when walking up slopes
	if (is_up_slope and not upslope_slowed) {
		if (abs(horizontal_speed) >= incline) {
			horizontal_speed -= sign(horizontal_speed) * incline;
		}
		else {
			horizontal_speed = 0;
		}
		upslope_slowed = true;
	}
	
	var stop_early = false;
    //Slopes
	if (is_up_slope) {
		if (place_meeting(x, y - incline, solid_object)) {
			show_debug_message("bonk1")
			stop_early = true;
			break;
		}
		y -= incline;
	}
	else if (is_down_slope) {
		if (place_meeting(x + sign(horizontal_speed), y + incline, solid_object)) {
			show_debug_message("bonk2")
			stop_early = true;
			break;
		}
		y += incline;
	}
	if (place_meeting(x + sign(horizontal_speed), y, solid_object)) {
		show_debug_message("bonk3")
        horizontal_speed = 0;
		stop_early = true;
		break;
	}
	if (stop_early) {
		break;
	}
	x += sign(horizontal_speed);
	script_execute(object_collisions);
}

//Slide down slopes if crouched
if (s_pressed) {
	if (is_down_slope) {
		//Accelerate down slopes
		horizontal_speed += facing * incline * grav;
	}
}

//Apply friction
var coefficient = air_resistance;
if (is_on_ground) {
	coefficient = fric;
}
if (s_pressed) {
	if (is_down_slope) {
		coefficient = 0;
	}
}
script_execute(apply_friction_and_air_resistance, coefficient);

/*
show_debug_message("hspeed: " + string(horizontal_speed) + " vspeed " + string(vertical_speed) +
	" incline: " + string(incline) + " up slope: " + string(is_up_slope) + " on ground: " + string(is_on_ground) +
	" down slope: " + string(is_down_slope) + " phspeed: " + string(prev_horizontal_speed) +
	" x: " + string(x) + " y: " + string(y));
*/