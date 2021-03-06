// Shell scripts can be defined here
// Method names must start with sh_, but will not include that when being invoked
// For example, to invoke sh_test_method from an rt-shell, you would simply type test_method
// 
// If a method returns a string value, it will be print to the shell output

function sh_help() { // this doesn't fit into the standard shell
	return (
		"List of available commands:"+
		"get_bgspeed                - returns current background speed\n"+
		"set_bg_hspeed <hspeed>     - sets background hspeed\n"+
		"set_bg_vspeed <vspeed>     - sets background vspeed\n"+
		"set_bg_color <red> <green> <blue> - sets background color\n"+
		"test_duplicate_spawn       - creates a second instance of obj_shell\n"+
		"say_greeting <toWhom>      - says hello to <toWhom>\n"+
		"theme_rtshell_*            - a bunch of functions that change shell's presence\n"+
		"set_shell_width <width>    - sets the shell's width\n"+
		"set_shell_height <height>  - sets the shell's width"
	)
}

function sh_get_bgspeed() {
	var bgHspeed = obj_test_room.bgHspeed;
	var bgVspeed = obj_test_room.bgVspeed;
	return "hspeed: " + string(bgHspeed) + ", vspeed: " + string(bgVspeed);
}

// If you want a method to take arguments at the command line, pass in an args object here
// args[0] will always be the function name, args[1] and onwards will be your actual arguments
function sh_set_bg_hspeed(args) {
	var newHspeed = args[1];
	try {
		obj_test_room.bgHspeed = real(newHspeed);
	} catch (e) {
		return e.message;
	}
}

function sh_set_bg_vspeed(args) {
	var newVspeed = args[1];
	try {
		obj_test_room.bgVspeed = real(newVspeed);
	} catch (e) {
		return e.message;
	}
}

// Here is an example of a shell script that takes multiple command line arguments
// See how I've assigned args[1], args[2], and args[3] into local variables for easier use
function sh_set_bg_color(args) {
	var red = args[1];
	var green = args[2];
	var blue = args[3];
	
	var backgroundId = layer_background_get_id(layer_get_id("Background"));
	layer_background_blend(backgroundId, make_color_rgb(red, green, blue));
}

function sh_test_duplicate_spawn() {
	instance_create_layer(0, 0, "Instances", obj_shell);
}

function sh_set_shell_width(args) {
	obj_shell.width = args[1];
}

function sh_set_shell_height(args) {
	obj_shell.height = args[1];
}

function sh_set_shell_anchor(args) {
	var newAnchor = args[1];
	if (newAnchor == "top" || newAnchor == "bottom") {
		obj_shell.screenAnchorPoint = newAnchor;
	} else {
		return "Invalid anchor point. Possible values: [top, bottom]";
	}
}

function sh_say_greeting(args) {
	var whomToGreet = args[1];
	return "Hello " + whomToGreet + "!";
}

function sh_theme_rtshell_dark() {
	obj_shell.consoleAlpha = 0.9;
	obj_shell.consoleColor = c_black;
	obj_shell.fontColor = make_color_rgb(255, 242, 245);
	obj_shell.fontColorSecondary = make_color_rgb(140, 118, 123);
	obj_shell.cornerRadius = 12;
	obj_shell.anchorMargin = 4;
	obj_shell.promptColor = make_color_rgb(237, 0, 54);
	obj_shell.prompt = "$";
}

function sh_theme_rtshell_light() {
	obj_shell.consoleAlpha = 0.9;
	obj_shell.consoleColor = make_color_rgb(235, 235, 235);
	obj_shell.fontColor = make_color_rgb(40, 40, 45);
	obj_shell.fontColorSecondary = make_color_rgb(120, 120, 128);
	obj_shell.cornerRadius = 12;
	obj_shell.anchorMargin = 4;
	obj_shell.promptColor = make_color_rgb(29, 29, 196);
	obj_shell.prompt = "$";
}

function sh_theme_ocean_blue() {
	obj_shell.consoleAlpha = 1;
	obj_shell.consoleColor = make_color_rgb(29, 31, 33);
	obj_shell.fontColor = make_color_rgb(197, 200, 198);
	obj_shell.fontColorSecondary = make_color_rgb(116, 127, 140);
	obj_shell.cornerRadius = 0;
	obj_shell.anchorMargin = 0;
	obj_shell.promptColor = make_color_rgb(57, 113, 237);
	obj_shell.prompt = "%";
}

function sh_theme_dracula() {
	obj_shell.consoleAlpha = 1;
	obj_shell.consoleColor = make_color_rgb(40, 42, 54);
	obj_shell.fontColor = make_color_rgb(248, 248, 242);
	obj_shell.fontColorSecondary = make_color_rgb(98, 114, 164);
	obj_shell.cornerRadius = 8;
	obj_shell.anchorMargin = 4;
	obj_shell.promptColor = make_color_rgb(80, 250, 123);
	obj_shell.prompt = "->";
}

function sh_theme_solarized_light() {
	obj_shell.consoleAlpha = 1;
	obj_shell.consoleColor = make_color_rgb(253, 246, 227);
	obj_shell.fontColor = make_color_rgb(101, 123, 131);
	obj_shell.fontColorSecondary = make_color_rgb(147, 161, 161);
	obj_shell.cornerRadius = 2;
	obj_shell.anchorMargin = 4;
	obj_shell.promptColor = make_color_rgb(42, 161, 152);
	obj_shell.prompt = "~";
}

function sh_theme_solarized_dark() {
	obj_shell.consoleAlpha = 1;
	obj_shell.consoleColor = make_color_rgb(0, 43, 54);
	obj_shell.fontColor = make_color_rgb(131, 148, 150);
	obj_shell.fontColorSecondary = make_color_rgb(88, 110, 117);
	obj_shell.cornerRadius = 2;
	obj_shell.anchorMargin = 4;
	obj_shell.promptColor = make_color_rgb(42, 161, 152);
	obj_shell.prompt = "~";
}