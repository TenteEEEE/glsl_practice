precision mediump float;

uniform vec2 u_resolution;
uniform float u_time;
const float pi = 3.141592653589793238462643383;

mat2 rotate(float rad){
  return mat2(cos(rad),-sin(rad),sin(rad),cos(rad));
}
mat2 magnification(vec2 mag){
  return mat2(mag.x,0.0,0.0,mag.y);
}
void main() {
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    uv = rotate(sin(u_time)*pi)*uv;
    uv = magnification(vec2(sin(u_time)*10.))*uv;
    vec3 color = vec3(cos((uv.x*uv.x)*pi)/2.+0.5);
    gl_FragColor = vec4(color,1.0);
}
