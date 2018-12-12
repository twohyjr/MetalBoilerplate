import MetalKit

class Engine {
    
    private static var _device: MTLDevice!
    private static var _commandQueue: MTLCommandQueue!
    private static var _defaultLibrary: MTLLibrary!
    
    public static var Device: MTLDevice {
        return _device
    }
    
    public static var CommandQueue: MTLCommandQueue {
        return _commandQueue
    }
    
    public static var DefaultLibrary: MTLLibrary {
        return _defaultLibrary
    }
    
    public static func Ignite(_ device: MTLDevice){
        self._device = device
        self._commandQueue = _device.makeCommandQueue()
        self._defaultLibrary = _device.makeDefaultLibrary()
        
        Graphics.Initialize()
    }
    
}
