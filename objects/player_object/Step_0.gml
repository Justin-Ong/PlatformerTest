//Controls
s_pressed = keyboard_check(ord("s")) or keyboard_check(ord("S"));
a_pressed = keyboard_check(ord("a")) or keyboard_check(ord("A"));
d_pressed = keyboard_check(ord("d")) or keyboard_check(ord("D"));
shift_pressed = keyboard_check(vk_lshift);
space_pressed = keyboard_check_pressed(vk_space);
lmb_pressed = mouse_check_button(mb_left);
rmb_pressed = mouse_check_button(mb_right);

script_execute(sprite_handling);