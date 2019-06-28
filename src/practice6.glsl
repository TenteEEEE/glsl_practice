precision mediump float;
uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;
const float pi = 3.141592653589793238462643383;
const float EPS = 0.001;

float sphere(vec3 p, float r) {
	float d = length(p)-r;
	return d;
}

float box(vec3 p, float r){
    return length(max(abs(p) - vec3(r), 0.0))-0.1;
}

float distancef(vec3 p) {
	// return sphere(p,.5);
	// return box(p,.5);
	
	// mix : linaer interpolation
	return mix(box(p,.3), sphere(p,.5), sin(u_time*1.)/2.+0.5);
	// the inverse linear interpolation result is fun
	// return mix(box(p,.3), sphere(p,.5), -sin(u_time*1.)-1.);
}

vec3 getNormal(vec3 p) {
    return normalize(vec3(
        distancef(p + vec3(EPS, 0.0, 0.0)) - distancef(p + vec3(-EPS,  0.0,  0.0)),
        distancef(p + vec3(0.0, EPS, 0.0)) - distancef(p + vec3( 0.0, -EPS,  0.0)),
        distancef(p + vec3(0.0, 0.0, EPS)) - distancef(p + vec3( 0.0,  0.0, -EPS))
    ));
}

void main(void) {
  vec2 norm_uv = (gl_FragCoord.xy*vec2(2) - u_resolution) / min(u_resolution.x, u_resolution.y);
  
	// vec3 view_point = vec3(0,0,-5);
  vec3 view_point = vec3(sin(u_time*2.),cos(u_time*1.),-5.-sin(u_time*1.5)*2.);
  vec3 ray = normalize(vec3(norm_uv, 3.));

	vec3 lightDir_r = vec3(sin(u_time*2.),cos(u_time*1.), -1.-sin(u_time*1.5));
	vec3 lightDir_g = vec3(sin(u_time*2.+pi/2.),cos(u_time*1.+pi/2.), -1.-sin(u_time*1.5));
	vec3 lightDir_b = vec3(cos(u_time*2.+pi/2.),sin(u_time*1.+pi/2.), -1.-sin(u_time*1.5));
  
  float t = 0.0;
  vec3 col = vec3(0.);
  vec3 pos = vec3(0.);
	for (int i = 0; i < 32; i++) {
      pos = view_point + ray * t;
      float d = distancef(pos);
      if (d < EPS) {
					vec3 normal = getNormal(pos);
					float diff_r = clamp(dot(lightDir_r, normal), 0.1, 0.9);
					float diff_g = clamp(dot(lightDir_g, normal), 0.1, 0.9);
					float diff_b = clamp(dot(lightDir_b, normal), 0.1, 0.9);
		      col = vec3(diff_r, diff_g, diff_b);
					break;
      }
      t += d;
  }
	gl_FragColor = vec4(col, 1.0); // visualization of ray-marched scene
}
