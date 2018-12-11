import MetalKit

class Settings {
    
    public static var ViewPixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
    
    public static var ClearColor: MTLClearColor = MTLClearColor(red: 0.2,
                                                                green: 0.25,
                                                                blue: 0.27,
                                                                alpha: 1.0)
    
    public static var ViewDepthStencilPixelFormat: MTLPixelFormat = MTLPixelFormat.depth32Float
    
    public static var ViewSampleCount: Int = 4
}
