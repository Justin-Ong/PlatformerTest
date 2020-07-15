var str1 = argument0;
var str2 = "";

if (str1 >= 48 && str1 <= 90) {
    str2 = string_lettersdigits(chr(str1));
}
else {
    switch (str1) {
        case vk_enter: 
			str2 = "Enter"; 
			break;
        case vk_left: 
			str2 = "Left"; 
			break;
        case vk_right: 
			str2 = "Right"; 
			break;
        case vk_up: 
			str2 = "Up"; 
			break;
        case vk_down: 
			str2 = "Down"; 
			break;
        case vk_escape: 
			str2 = "Escape"; 
			break;
        case vk_space: 
			str2 = "Space"; 
			break;
        case vk_shift: 
			str2 = "Shift"; 
			break;
		case vk_lshift: 
			str2 = "LShift"; 
			break;
		case vk_rshift: 
			str2 = "RShift"; 
			break;
        case vk_control: 
			str2 = "Control"; 
			break;
		case vk_lcontrol: 
			str2 = "LControl"; 
			break;
		case vk_rcontrol: 
			str2 = "RControl"; 
			break;
        case vk_alt: 
			str2 = "Alt"; 
			break;
		case vk_lalt: 
			str2 = "LAlt"; 
			break;
		case vk_ralt: 
			str2 = "RAlt"; 
			break;
        case vk_backspace: 
			str2 = "Backspace"; 
			break;
        case vk_tab: 
			str2 = "Tab"; 
			break;
        case vk_home: 
			str2 = "Home"; 
			break;
        case vk_end: 
			str2 = "End"; 
			break;
        case vk_delete: 
			str2 = "Delete"; 
			break;
        case vk_insert: 
			str2 = "Insert"; 
			break;
        case vk_pageup: 
			str2 = "Page Up"; 
			break;
        case vk_pagedown: 
			str2 = "Page Down"; 
			break;
        case vk_pause: 
			str2 = "Pause"; 
			break;
        case vk_printscreen: 
			str2 = "Printscreen"; 
			break;
        case vk_f1: 
			str2 = "F1"; 
			break;
        case vk_f2: 
			str2 = "F2"; 
			break;
        case vk_f3: 
			str2 = "F3"; 
			break;
        case vk_f4: 
			str2 = "F4"; 
			break;
        case vk_f5: 
			str2 = "F5"; 
			break;
        case vk_f6: 
			str2 = "F6"; 
			break;
        case vk_f7: 
			str2 = "F7"; 
			break;
        case vk_f8: 
			str2 = "F8"; 
			break;
        case vk_f9: 
			str2 = "F9"; 
			break;
        case vk_f10: 
			str2 = "F10"; 
			break;
        case vk_f11: 
			str2 = "F11"; 
			break;
        case vk_f12: 
			str2 = "F12"; 
			break;
        case vk_numpad0: 
			str2 = "Numpad 0"; 
			break;
        case vk_numpad1: 
			str2 = "Numpad 1"; 
			break;
        case vk_numpad2: 
			str2 = "Numpad 2"; 
			break;
        case vk_numpad3: 
			str2 = "Numpad 3"; 
			break;
        case vk_numpad4: 
			str2 = "Numpad 4"; 
			break;
        case vk_numpad5: 
			str2 = "Numpad 5"; 
			break;
        case vk_numpad6: 
			str2 = "Numpad 6"; 
			break;
        case vk_numpad7: 
			str2 = "Numpad 7"; 
			break;
        case vk_numpad8: 
			str2 = "Numpad 8"; 
			break;
        case vk_numpad9: 
			str2 = "Numpad 9"; 
			break;
        case vk_multiply: 
			str2 = "Numpad *"; 
			break;
        case vk_divide: 
			str2 = "Numpad /"; 
			break;
        case vk_add: 
			str2 = "Numpad +"; 
			break;
        case vk_subtract: 
			str2 = "Numpad -"; 
			break;
        case vk_decimal: 
			str2 = "Numpad ."; 
			break;
    }
}

return string(str2);