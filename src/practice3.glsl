precision mediump float;
uniform float u_time;
uniform vec2 u_mouse;
uniform vec2 u_resolution;
const float pi = 3.141592653589793238462643383;

float sphere(vec3 p, float r) {
	// length(mod(p,10.)-5.) makes tiling ray matrix. It means that we can visualize multi spheres
	// fract(sin(u_time)) provides simple random value
	float sp = 500.; // speed of sin wave. When the speed is enough fast, the fraction value seems random
	// float d = length(p)-(fract(sin(u_time*sp)))/1.-1.; // simple one
	float d = length(mod(p,u_mouse.x*10.)-u_mouse.x*10./2.)-(fract(sin(u_time*sp)))/3.-r;
	return d;
}

void main(void) {
  float screen_depth = 2.;
  vec2 norm_uv = (gl_FragCoord.xy*2. - u_resolution) / min(u_resolution.x, u_resolution.y);
	vec3 view_point = vec3(u_mouse.x*10.-5.,u_mouse.y*10.-5.,-10);
  //vec3 view_point = vec3(0.,0.,-10);
  vec3 ray = normalize(vec3(norm_uv, screen_depth));

	float t = 0.0;
  vec3 col = vec3(0.);
  for (int i = 0; i < 64; i++) {
      vec3 pos = view_point + ray * t;
      float d = sphere(pos,u_mouse.y*1.);
      if (d < 0.0001) {
				col = vec3(abs(cos(sin(vec3(i/10))/2.+vec3(u_time,u_time+pi/4.,u_time+pi/2.))));
        break;
      }
      t += d;
  }
  gl_FragColor = vec4(col.x, col.y, col.z, 1.0); // visualization of ray-marched scene
	// You may have an interest about the modulo(tiling) ray matrix. Please check it out.
	// gl_FragColor = vec4(mod(ray.x,u_mouse.x*3.)/(u_mouse.x*3.), mod(ray.y,u_mouse.y*3.)/(u_mouse.y*3.), .5, 1.0); // visualization of modulo ray
}
