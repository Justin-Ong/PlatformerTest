var coefficient = argument0;

var friction_reduction = sign(horizontal_speed) * horizontal_speed * coefficient;

if (horizontal_speed < 0) {
	if (horizontal_speed - friction_reduction) > -0.1 {
		horizontal_speed = 0;
	}
	else {
		horizontal_speed += friction_reduction;
	}
}
else if (horizontal_speed > 0) { 
	if (horizontal_speed - friction_reduction) < 0.1 {
		horizontal_speed = 0;
	}
	else {
		horizontal_speed -= friction_reduction;
	}
}