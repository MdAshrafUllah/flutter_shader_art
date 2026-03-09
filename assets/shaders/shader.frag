#version 460 core
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float uTime;
uniform float uValue1;
uniform float uValue2;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord().xy;
    
    vec2 uv = (fragCoord * 2.0 - uSize) / min(uSize.x, uSize.y);
    vec3 finalColor = vec3(0.0);
    
    for (float i = 0.0; i < 4.0; i++) {
        uv = fract(uv * 1.5 * uValue1) - 0.5;
        float d = length(uv) * exp(-length(uv));
        vec3 col = 0.5 + 0.5 * cos(uTime + uv.xyx + vec3(0,2,4));
        d = sin(d * 8.0 + uTime) / 8.0;
        d = abs(d);
        d = pow(0.01 / d, 1.2 * uValue2);
        finalColor += col * d;
    }
    
    fragColor = vec4(finalColor, 1.0);
}