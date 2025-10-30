shader_type spatial;
render_mode unshaded,diffuse_burley,specular_disabled;
uniform sampler2D texture_albedo : hint_default_white;
uniform float alpha : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec2 uv = SCREEN_UV;
    vec4 albedo_tex = texture(texture_albedo,uv);
    ALBEDO = albedo_tex.rgb;
    ALPHA = albedo_tex.a * alpha;
}