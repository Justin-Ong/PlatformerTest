//Controls
left_pressed = keyboard_check(global.left_key);
right_pressed = keyboard_check(global.right_key);
duck_pressed = keyboard_check(global.duck_key);
cling_pressed = keyboard_check(global.cling_key);
jump_pressed = keyboard_check_pressed(global.jump_key);

script_execute(sprite_handling);