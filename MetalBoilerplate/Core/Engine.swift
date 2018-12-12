import MetalKit

class Engine {
    
    private static var _device: MTLDevice!
    private static var _commandQueue: MTLCommandQueue!
    
    public static var Device: MTLDevice {
        return _device
    }
    
    public static var CommandQueue: MTLCommandQueue {
        return _commandQueue
    }
    
    public static func Ignite(_ device: MTLDevice){
        self._device = device
        self._commandQueue = _device.makeCommandQueue()
    }
    
}
