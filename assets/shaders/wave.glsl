precision highp float;

uniform sampler2D fromImage;
uniform sampler2D toImage;

uniform float progress;
uniform vec2 resolution;
uniform float amplitude;
uniform float waves;
uniform float colorSeparation;

varying vec2 vTexCoord;

void main() {
    vec2 uv = vTexCoord;

    float wave = sin(uv.y * waves * 6.28318 + progress * 6.28318) * amplitude;

    vec2 distorted = vec2(
        uv.x + wave * (1.0 - progress),
        uv.y
    );

    vec4 fromColor = texture2D(fromImage, distorted);
    vec4 toColor = texture2D(toImage, uv);

    // RGB shift
    float r = texture2D(fromImage, distorted + colorSeparation).r;
    float g = fromColor.g;
    float b = texture2D(fromImage, distorted - colorSeparation).b;

    vec4 separated = vec4(r, g, b, 1.0);

    gl_FragColor = mix(separated, toColor, progress);
}
