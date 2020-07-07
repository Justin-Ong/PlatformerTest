//Controls
s_pressed = keyboard_check(ord("s")) or keyboard_check(ord("S"));
a_pressed = keyboard_check(ord("a")) or keyboard_check(ord("A"));
d_pressed = keyboard_check(ord("d")) or keyboard_check(ord("D"));
shift_pressed = keyboard_check(vk_lshift);
space_pressed = keyboard_check_pressed(vk_space);
lmb_pressed = mouse_check_button(mb_left);
rmb_pressed = mouse_check_button(mb_right);

//Variables for movement
is_on_ground = place_meeting(x, y + 1, solid_object);
is_touching_left_wall = place_meeting(x - 1, y, solid_object);
is_touching_right_wall = place_meeting(x + 1, y, solid_object);

//Horizontal motion calculations
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

var coefficient = air_resistance;
if (is_on_ground) {
	coefficient = fric;
}
if (rmb_pressed) {
	coefficient = 0;
}
script_execute(apply_friction_and_air_resistance, coefficient);

//Sprite handling
if (is_on_ground and s_pressed) {
	sprite_index = player_crouch_sprite;
}
else {
	sprite_index = player_sprite;
}
if (horizontal_speed != 0) {
	image_xscale = facing;	
}
