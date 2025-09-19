// Colour pixel/fragment shader
// Basic fragment shader outputting a colour

struct InputType
{
	float4 position : SV_POSITION;
    float2 tex : TEXCOORD0;
}; 

float4 main(InputType input) : SV_TARGET
{
    //Turn the UVs into a black -> white gradient...
    //const float Mag = sqrt((input.tex[0] * input.tex[0]) + (input.tex[1] * input.tex[1]));
    const float Circ =
    10 * ((input.tex[0] - 0.5) * (input.tex[0] - 0.5))
    + 10 * ((input.tex[1] - 0.5) * (input.tex[1] - 0.5));
    
   // const float Mag = 1.f;
    return float4(Circ, Circ, Circ, 1.f);

}