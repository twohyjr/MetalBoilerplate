import MetalKit

class Renderer: NSObject {
    
    var scene: Scene!

    override init() {
        super.init()
        self.scene = Scene()
    }
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        GameView.Width = Float(view.bounds.width)
        GameView.Height = Float(view.bounds.height)
    }
    
    func draw(in view: MTKView) {
        guard
            let passDescriptor = view.currentRenderPassDescriptor
        else { return }
        
        let timeStep = 1.0 / Float(view.preferredFramesPerSecond)
        GameTime.UpdateTime(timeStep)
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        commandBuffer?.label = "Base Command Buffer"
        
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: passDescriptor)
        renderCommandEncoder?.label = "Primary Render Command Encoder"
        
        scene.render(renderCommandEncoder!)
        
        renderCommandEncoder?.endEncoding()
        
        commandBuffer?.present(view.currentDrawable!)
        commandBuffer?.commit()
    }
}
