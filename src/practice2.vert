precision mediump float;
uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;
const float pi = 3.141592653589793238462643383;

float sphere(vec3 p, float r) {
	float d = length(p)-r-cos(u_time)*r/3.;
	return d;
}

void main(void) {
  float depth = 3.;
  // The simple normalization works but...
  // vec2 norm_uv = ((gl_FragCoord.xy / u_resolution) - vec2(0.5))*vec2(2.);
  
  // It is a better way when we consider the different aspect ratios
  vec2 norm_uv = (gl_FragCoord.xy*vec2(2) - u_resolution) / min(u_resolution.x, u_resolution.y);
  
  vec3 view_point = vec3(0,0,-u_mouse.x*100.);
  vec3 ray = normalize(vec3(norm_uv, depth));
  
  //gl_FragColor = vec4(abs(ray.x), abs(ray.y), 0., 1.0); // visualization of ray
  float t = 0.0;
  vec3 col = vec3(0.);
  for (int i = 0; i < 99; i++) {
      vec3 pos = view_point + ray * t;
      float d = sphere(pos,u_mouse.y*10.);
      if (d < 0.0001) {
          col = vec3(abs(cos(vec3(u_time,u_time+pi/4.,u_time+pi/2.))));
          break;
      }
      t += d;
  }
  gl_FragColor = vec4(col.x, col.y, col.z, 1.0); // visualization of ray-marched scene
}
