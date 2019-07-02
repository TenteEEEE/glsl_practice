precision mediump float;

uniform vec2 u_resolution;
uniform float u_time;
const float pi = 3.141592653589793238462643383;

void main() {
    float scale = 20.+15.*(sin(u_time*2.)); // the scale changes 5~35
    vec2 uv = gl_FragCoord.xy / u_resolution.xy;
    vec3 color = vec3(cos((uv.x*uv.x)*pi*u_resolution.x/scale)/2.+0.5);
    gl_FragColor = vec4(color,1.0);
}
