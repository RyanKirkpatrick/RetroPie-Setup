// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)
varying     vec2 VARc22;
varying     vec2 VARc20;
varying     vec2 VARc02;
varying     vec2 VARc00;


struct tex_coord {
    vec2 VARc00;
    vec2 VARc02;
    vec2 VARc20;
    vec2 VARc22;
};

struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};

vec4 _oPosition1;
tex_coord _coords1;
uniform mat4 MVPMatrix;
input_dummy _IN1;
vec4 _r0004;
attribute vec4 VertexCoord;
attribute vec4 COLOR;
varying vec4 COL0;
attribute vec4 TexCoord;
varying vec4 TEX0;

 

         mat4 transpose_(mat4 matrix)
         {
            mat4 ret;
            for (int i = 0; i != 4; i++)
               for (int j = 0; j != 4; j++)
                  ret[i][j] = matrix[j][i];

            return ret;
         }
         
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{
    mat4 MVPMatrix_ = transpose_(MVPMatrix);

    vec4 _oColor;
    vec2 _oTex;
    vec2 _delta;
    tex_coord _TMP2;

    _r0004.x = dot(MVPMatrix_[0], VertexCoord);
    _r0004.y = dot(MVPMatrix_[1], VertexCoord);
    _r0004.z = dot(MVPMatrix_[2], VertexCoord);
    _r0004.w = dot(MVPMatrix_[3], VertexCoord);
    _oPosition1 = _r0004;
    _oColor = COLOR;
    _oTex = TexCoord.xy;
    _delta = 5.00000000E-001/TextureSize;
    _TMP2.VARc00 = TexCoord.xy + vec2(-_delta.x, -_delta.y);
    _TMP2.VARc02 = TexCoord.xy + vec2(-_delta.y, _delta.y);
    _TMP2.VARc20 = TexCoord.xy + vec2(_delta.x, -_delta.y);
    _TMP2.VARc22 = TexCoord.xy + vec2(_delta.x, _delta.y);
    VARc00 = _TMP2.VARc00;
    VARc02 = _TMP2.VARc02;
    VARc20 = _TMP2.VARc20;
    VARc22 = _TMP2.VARc22;
    gl_Position = _r0004;
    COL0 = COLOR;
    TEX0.xy = TexCoord.xy;
} 
#elif defined(FRAGMENT)
#ifdef GL_ES
precision mediump float;
#endif
varying     vec2 VARc22;
varying     vec2 VARc20;
varying     vec2 VARc02;
varying     vec2 VARc00;


struct tex_coord {
    vec2 VARc00;
    vec2 VARc02;
    vec2 VARc20;
    vec2 VARc22;
};

struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};

vec4 _ret_0;
vec3 _TMP12;
vec3 _TMP8;
float _TMP11;
float _TMP7;
float _TMP6;
float _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
vec4 _TMP0;
tex_coord _co1;
input_dummy _IN1;
uniform sampler2D Texture;
float _x0028;
vec3 _TMP29;
float _x0034;
vec3 _TMP35;
float _x0040;
vec3 _TMP41;
vec3 _a0046;
vec3 _TMP53;
varying vec4 TEX0;

 
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{

    vec3 _final;

    _TMP0 = texture2D(Texture, VARc00);
    _TMP1 = texture2D(Texture, VARc02);
    _TMP2 = texture2D(Texture, TEX0.xy);
    _TMP3 = texture2D(Texture, VARc20);
    _TMP4 = texture2D(Texture, VARc22);
    _x0028 = TEX0.x*TextureSize.x + 5.00000000E-001;
    _TMP5 = fract(_x0028);
    _TMP29 = _TMP0.xyz + _TMP5*(_TMP3.xyz - _TMP0.xyz);
    _x0034 = TEX0.x*TextureSize.x + 5.00000000E-001;
    _TMP6 = fract(_x0034);
    _TMP35 = _TMP1.xyz + _TMP6*(_TMP4.xyz - _TMP1.xyz);
    _x0040 = TEX0.y*TextureSize.y + 5.00000000E-001;
    _TMP7 = fract(_x0040);
    _TMP41 = _TMP29 + _TMP7*(_TMP35 - _TMP29);
    _a0046 = _TMP41 - _TMP2.xyz;
    _TMP8 = abs(_a0046);
    _TMP11 = dot(_TMP8, vec3( 3.00000012E-001, 5.89999974E-001, 1.09999999E-001));
    _final = 5.00000000E+000*vec3(_TMP11, _TMP11, _TMP11);
    _TMP12 = min(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000), _final);
    _TMP53 = max(vec3( 0.00000000E+000, 0.00000000E+000, 0.00000000E+000), _TMP12);
    _ret_0 = vec4(_TMP53.x, _TMP53.y, _TMP53.z, 1.00000000E+000);
    gl_FragColor = _ret_0;
    return;
} 
#endif