//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_worldpos;

uniform float u_fog_start;
uniform float u_fog_end;
uniform vec4 u_fog_color;

void main()
{
	vec4 samp = texture2D(gm_BaseTexture, v_vTexcoord);
	
	float d = length(v_worldpos);
	float f = clamp((d - u_fog_start) / (u_fog_end - u_fog_start), 0.0, 1.0);
	//float f = 0.0;
	vec4 final = mix(samp, u_fog_color, f);
	final.rgb = floor(final.rgb * 12.) / 12.;
	if (samp.a <= 0.1){
		discard;
	}
    gl_FragColor = v_vColour * vec4(final.rgb, samp.a);
}

/*

vec4 post = floor(samp.rgb * 11.) / 11.);



	
*/