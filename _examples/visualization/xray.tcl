pload XDE VISUALIZATION

# load and display STL file
jsupload {{site.baseurl}}/models/skull/skull_w_jaw.stl
readstl s skull_w_jaw.stl
vinit View1
vdisplay -dispMode 1 s
vfit

# apply custom GLSL program
set aShaderVert "
THE_SHADER_OUT float Intensity;
THE_SHADER_OUT vec3  Color;
void main()
{
  float aFalloff = (1.0 - occColor.a) * 3.0;
  vec4 aNorm4 = occWorldViewMatrixInverseTranspose * occModelWorldMatrixInverseTranspose * vec4 (occNormal, 0.0);
  vec3 aNorm  = normalize (aNorm4.xyz);
  Intensity   = pow (1.0 - abs (dot (aNorm, vec3 (0.0, 0.0, 1.0))), aFalloff);
  Color = occColor.rgb;
  gl_Position = occProjectionMatrix * occWorldViewMatrix * occModelWorldMatrix * occVertex;
}"

set aShaderFrag "
THE_SHADER_IN float Intensity;
THE_SHADER_IN vec3  Color;
void main() {
  occSetFragColor (vec4 (Color * Intensity, Intensity));
}"

vshaderprog s -vert $aShaderVert -frag $aShaderFrag
vaspects s -alphaMode blend
vaspects s -color WHITE -transparency 0.5
