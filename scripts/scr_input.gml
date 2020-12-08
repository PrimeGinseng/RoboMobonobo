///Get player input

if(key_right_active) key_right = keyboard_check(vk_right);
if(key_left_active) key_left = keyboard_check(vk_left);
if(key_down_active) key_down = keyboard_check(vk_down);
if(key_up_active) key_up = keyboard_check(vk_up);

if(key_jump_active) key_jump = keyboard_check_pressed(ord('Z'));
if(key_jump_active) key_jump_held = keyboard_check(ord('Z'));
if(key_jump_active) key_jump_released = keyboard_check_released(ord('Z'));

key_use = keyboard_check_pressed(ord('X'));
key_use_held = keyboard_check(ord('X'));

if(key_grapple_active) key_grapple = keyboard_check_pressed(ord('C'));
