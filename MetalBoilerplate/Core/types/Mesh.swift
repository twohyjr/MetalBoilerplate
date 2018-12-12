import MetalKit

class Mesh {
    var vertices: [Vertex] = []
    var indices: [UInt32] = []
    var vertexBuffer: MTLBuffer!
    var indexBuffer: MTLBuffer!
    var vertexCount: Int { return vertices.count }
    var indexCount: Int { return indices.count }
    var indexType: MTLIndexType = MTLIndexType.uint32
    var primitiveType: MTLPrimitiveType = MTLPrimitiveType.triangle
    var instanceCount: Int = 1
    
    init() {
        buildVertices()
        buildIndices()
        buildBuffers()
    }
    
    func addVertex(position: float3) {
        self.vertices.append(Vertex(position: position))
    }
    
    func buildVertices() {
        addVertex(position: float3( 0.0, 0.5, 0.0))
        addVertex(position: float3(-0.5,-0.5, 0.0))
        addVertex(position: float3( 0.5,-0.5, 0.0))
    }
    
    func buildIndices() {
        self.indices = [
            0, 1, 2
        ]
    }
    
    func buildBuffers() {
        self.vertexBuffer = Engine.Device.makeBuffer(bytes: vertices,
                                                     length: Vertex.size(vertexCount),
                                                     options: [])
        if(indexCount > 0){
            self.indexBuffer = Engine.Device.makeBuffer(bytes: indices,
                                                         length: UInt32.size(indexCount),
                                                         options: [])
        }
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBuffer(vertexBuffer,
                                             offset: 0,
                                             index: 0)
        
        if(indexCount > 0){
            renderCommandEncoder.drawIndexedPrimitives(type: self.primitiveType,
                                                       indexCount: self.indexCount,
                                                       indexType: self.indexType,
                                                       indexBuffer: self.indexBuffer,
                                                       indexBufferOffset: 0,
                                                       instanceCount: self.instanceCount)
        }
    }
}
