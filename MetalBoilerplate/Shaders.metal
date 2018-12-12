#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position [[ attribute(0) ]];
};

struct VertexOut {
    float4 position [[position]];
};

vertex VertexOut vertex_shader( VertexIn vertexIn [[ stage_in ]]) {

    VertexOut vOut;
    vOut.position = float4(vertexIn.position, 1.0);
    
    return vOut;
}

fragment half4 fragment_shader(VertexOut vertexIn [[stage_in]]) {
    float4 color = float4(1, 0, 0, 1);

    return half4(color.r, color.g, color.b, color.a);
}
