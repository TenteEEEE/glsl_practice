precision mediump float;
uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;
const float pi = 3.141592653589793238462643383;

float rand(vec2 f){
	float speed = 1./20000.;
	// if you want to generate random maps along the time
	return fract(sin(dot(f.xy,vec2(12.9898,78.233))+u_time*speed)*43758.5453123);
	// return fract(sin(dot(f.xy,vec2(12.9898,78.233)))*43758.5453123);
}

void main(void) {
	vec2 norm_uv = (gl_FragCoord.xy*2. - u_resolution) / min(u_resolution.x, u_resolution.y);
	
	float divide = 3.;
	// vec3 col = vec3(rand(norm_uv));
	float col_r = (rand(floor(norm_uv.xx*divide)+floor(u_mouse.x*divide*2.)+floor(u_mouse.y*divide*2.)));
	float col_g = (rand(floor(norm_uv.xy*divide)+floor(u_mouse.x*divide*2.)+floor(u_mouse.y*divide*2.)));
	float col_b = (rand(floor(norm_uv.yx*divide)+floor(u_mouse.x*divide*2.)+floor(u_mouse.y*divide*2.)));
	gl_FragColor = vec4(col_r, col_g, col_b, 0);
	// if you want to check the floor map
	// gl_FragColor = vec4(normalize(floor(norm_uv*divide)), 0, 0);
}
