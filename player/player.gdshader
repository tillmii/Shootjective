shader_type canvas_item;

uniform vec4 color;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
		vec4 c = texture(screen_texture, SCREEN_UV);
		if (c.r == 0.0 && c.g > .5 && c.b == 0.0)
		{
			COLOR = color;
		}
        else
		{
			COLOR = c;
		}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
