// colour vertex shader
// Simple geometry pass
// texture coordinates and normals will be ignored.

cbuffer MatrixBuffer : register(b0)
{
	matrix worldMatrix;
	matrix viewMatrix;
	matrix projectionMatrix;
};

struct InputType
{
	float4 position : POSITION;
	float4 colour : COLOR;
};

struct OutputType
{
	float4 position : SV_POSITION;
	float4 colour : COLOR;
};

OutputType main(InputType input)
{
	OutputType output;
	

	
	// Change the position vector to be 4 units for proper matrix calculations.
	input.position.w = 1.f;

	//Double in size		
    const float4x4 DoubleScale = float4x4(2.f, 0.f, 0.f, 0.f,
										  0.f, 2.f, 0.f, 0.f,
										  0.f, 0.f, 2.f, 0.f,
										  0.f, 0.f, 0.f, 1.f);
	
	//IN THEORY this should work??
    output.position = mul(input.position, DoubleScale);

	// Calculate the position of the vertex against the world, view, and projection matrices.
	output.position = mul(output.position, worldMatrix);
	output.position = mul(output.position, viewMatrix);
	output.position = mul(output.position, projectionMatrix);

	output.colour = input.colour;
	


	return output;
}