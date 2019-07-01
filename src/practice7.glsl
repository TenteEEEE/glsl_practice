precision mediump float;

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 skew (vec2 st) {
    vec2 r = vec2(0.0);
    r.x = 1.1547*st.x;  //vertical
    r.y = st.y+0.5*r.x; //horizontal
    return r;
}

vec3 simplexGrid (vec2 st) {
    vec3 xyz = vec3(0.0);
    vec2 p = fract(skew(st));
    
    // I used step function instead of if
    float mask_x = step(p.y,p.x);
    float mask_y = step(p.x,p.y);
    xyz.xy = mask_x * (1.0-vec2(p.x,p.y-p.x));
    xyz.z = mask_x * p.y;
    xyz.yz += mask_y * (1.0-vec2(p.x-p.y,p.y));
    xyz.x += mask_y * p.x;
    
    // Using if, I am not sure about the difference of processing volume
    // if (p.x > p.y) {
    //   xyz.xy = 1.0-vec2(p.x,p.y-p.x);
    //   xyz.z = step(p.y,p.x) * p.y;
    // } else {
    //   xyz.yz = 1.0-vec2(p.x-p.y,p.y);
    //   xyz.x = step(p.x,p.y) * p.x;
    // }

    // return vec3(p.x > p.y);  //you can see p.x>p.y area
    return fract(xyz);
}

void main() {
    vec2 norm_uv = (gl_FragCoord.xy*vec2(2) - u_resolution) / min(u_resolution.x, u_resolution.y);
    vec3 color = vec3(0.0);
    norm_uv *= .5+abs(sin(u_time)*20.);

    color = simplexGrid(norm_uv);

    gl_FragColor = vec4(color,1.0);
}
