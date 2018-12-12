import MetalKit

class GameView: MTKView {
    
    public static var Width: Float = 0
    public static var Height: Float = 0
    public static var AspectRatio: Float {
        return GameView.Width / GameView.Height
    }
    
    var renderer: Renderer!
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        GameView.Width = Float(self.bounds.width)
        GameView.Height = Float(self.bounds.height)
        
        self.device = MTLCreateSystemDefaultDevice()
        
        Engine.Ignite(self.device!)
        
        self.clearColor = Settings.ClearColor
        
        self.colorPixelFormat = Settings.ViewPixelFormat
        
        self.depthStencilPixelFormat = Settings.ViewDepthStencilPixelFormat
        
        self.sampleCount = Settings.ViewSampleCount
        
        self.renderer = Renderer()
        
        self.delegate = self.renderer
    }
    
}
