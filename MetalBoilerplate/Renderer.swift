import MetalKit

class Renderer: NSObject {
    
    var mesh: Mesh!
    
    var renderPipelineState: MTLRenderPipelineState!
    var vertexDescriptor: MTLVertexDescriptor {
        let vertexDescriptor = MTLVertexDescriptor()
        
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].offset = 0
        
        vertexDescriptor.layouts[0].stride = Vertex.stride
        
        return vertexDescriptor
    }

    override init() {
        super.init()
        
        self.renderPipelineState = buildRenderPipelineWithDevice()

        self.mesh = Mesh()
    }
    
    func buildRenderPipelineWithDevice()->MTLRenderPipelineState? {
        let library = Engine.Device.makeDefaultLibrary()!
        
        let vertexFunction = library.makeFunction(name: "vertex_shader")
        let fragmentFunction = library.makeFunction(name: "fragment_shader")
        
        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.label = "Base Render Pipeline State"
        pipelineDescriptor.sampleCount = Settings.ViewSampleCount
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
        pipelineDescriptor.colorAttachments[0].pixelFormat = Settings.ViewPixelFormat
        pipelineDescriptor.depthAttachmentPixelFormat = Settings.ViewDepthStencilPixelFormat
        pipelineDescriptor.vertexDescriptor = vertexDescriptor
        
        do {
            return try Engine.Device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        }catch _ {
            return nil
        }
    }

}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        GameView.Width = Float(view.bounds.width)
        GameView.Height = Float(view.bounds.height)
    }
    
    func draw(in view: MTKView) {
        guard
            let drawable = view.currentDrawable,
            let passDescriptor = view.currentRenderPassDescriptor
        else { return }
        
        let timeStep = 1.0 / Float(view.preferredFramesPerSecond)
        GameTime.UpdateTime(timeStep)
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        commandBuffer?.label = "Base Command Buffer"
        
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: passDescriptor)
        renderCommandEncoder?.label = "Primary Render Command Encoder"
        
        renderCommandEncoder?.pushDebugGroup("Draw Mesh")
        
        renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
        
        mesh.drawPrimitives(renderCommandEncoder!)
        
        renderCommandEncoder?.popDebugGroup()
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
