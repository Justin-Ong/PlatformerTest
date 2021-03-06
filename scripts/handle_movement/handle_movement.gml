//Variables for movement
is_on_ground = place_meeting(x, y + 3, solid_object);
is_touching_left_wall = place_meeting(x - 1, y, solid_object);
is_touching_right_wall = place_meeting(x + 1, y, solid_object);

script_execute(handle_moving_platforms);

//Jump grace period
if (is_on_ground) {
	on_ground_timer = on_ground_timer_max;
}
else if (not is_on_ground and on_ground_timer > 0) {
	on_ground_timer -= 1;
}

//Sprite facing
var movement = 0;
if (left_pressed and not right_pressed) {
	movement = -1;
	facing = -1;
}
else if (right_pressed and not left_pressed) {
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


if (not place_meeting(x, y + 1, solid_object)) {
	vertical_speed += grav;
}
if ((on_ground_timer > 0) and jump_pressed) {
	if (duck_pressed) {
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
	if (jump_pressed) {
		vertical_speed -= wall_jump_vertical_speed;
		horizontal_speed += wall_jump_horizontal_speed;
	}
	if (cling_pressed and slide_timer < slide_time_limit) {
		vertical_speed *= slide_resistance;
		slide_timer += 1;
		effect_create_below(ef_smoke, x, y, 0, c_gray);
	}
}
else if (is_touching_right_wall and not is_on_ground) {
	if (jump_pressed) {
		vertical_speed -= wall_jump_vertical_speed;
		horizontal_speed -= wall_jump_horizontal_speed;
	}
	if (cling_pressed and slide_timer < slide_time_limit) {
		vertical_speed *= slide_resistance;
		slide_timer += 1;
		effect_create_below(ef_smoke, x, y, 0, c_gray);
	}
}

if (not cling_pressed and slide_timer > 0) {
	slide_timer -= 0.5;
}
repeat(abs(vertical_speed)) {
	//Flat ground
    if (place_meeting(x, y + sign(vertical_speed), solid_object)) {
        vertical_speed = 0;
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
			stop_early = true;
		}
		else {
			y -= incline;
		}
	}
	else if (is_down_slope) {
		if (place_meeting(x + sign(horizontal_speed), y + incline, solid_object)) {
			stop_early = true;
		}
		else {
			y += incline;
		}
	}
	if (place_meeting(x + sign(horizontal_speed), y, solid_object)) {
        horizontal_speed = 0;
		stop_early = true;
	}
	if (stop_early) {
		script_execute(object_collisions);
		break;
	}
	x += sign(horizontal_speed);
	script_execute(object_collisions);
}

//Slide down slopes if crouched
if (duck_pressed) {
	if (is_down_slope) {
		//Accelerate down slopes
		horizontal_speed += facing * (1 + incline);
	}
}

//Apply friction
var coefficient = air_resistance;
if (is_on_ground) {
	coefficient = fric;
}
if (duck_pressed) {
	if (is_down_slope) {
		coefficient = 0.1;
	}
}
script_execute(apply_friction_and_air_resistance, coefficient);
script_execute(object_collisions);

/*
show_debug_message("hspeed: " + string(horizontal_speed) + " vspeed " + string(vertical_speed) +
	" incline: " + string(incline) + " up slope: " + string(is_up_slope) + " on ground: " + string(is_on_ground) +
	" down slope: " + string(is_down_slope) + " phspeed: " + string(prev_horizontal_speed) +
	" x: " + string(x) + " y: " + string(y));
*/