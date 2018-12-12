import MetalKit

class GameObject {
    
    var mesh: Mesh!
    
    init() {
        self.mesh = Mesh()
    }
    
    func update() {
        
    }
    
    func render(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.pushDebugGroup("Render Scene")
        
        renderCommandEncoder.setRenderPipelineState(Graphics.RenderPipelineStates[.Basic])
        
        mesh.drawPrimitives(renderCommandEncoder)
        
        renderCommandEncoder.popDebugGroup()
    }
}
