var input_str = argument0;
var input_key = argument1;
var output = "";

input_key = print_chr(variable_global_get(input_key));

for (var i = 1; i < (string_length(input_str) + 1); i++) {
	var tmp = string_copy(input_str, i, 1);
    if (tmp == " ") {
		output += tmp;
		output += input_key;
		break;
	}
	else {
		output += tmp;
	}
}

return output;