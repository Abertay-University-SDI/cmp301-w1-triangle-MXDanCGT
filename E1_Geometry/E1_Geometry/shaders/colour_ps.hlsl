// Colour pixel/fragment shader
// Basic fragment shader outputting a colour

struct InputType
{
	float4 position : SV_POSITION;
	float4 colour : COLOR;
}; 


float4 main(InputType input) : SV_TARGET
{
	//return input.colour;
	//Temp change - make it red tinge
    return input.colour * float4(1.f, 0.5f, 0.5f, 0.5f);
	//Shouldnt we be able to see this stepping through the shaders?

}