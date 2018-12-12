import MetalKit

class Library<T, K> {
    
    init(){
        fillLibrary()
    }
    
    internal func fillLibrary() {
        //Override this function
    }
    
    subscript(_ index: T) -> K? {
        return nil
    }
    
}
