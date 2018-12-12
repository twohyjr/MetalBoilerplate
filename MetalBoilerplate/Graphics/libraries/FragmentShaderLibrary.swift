import MetalKit

enum FragmentShaderTypes {
    case Basic
}

class FragmentShaderLibrary: Library<FragmentShaderTypes, MTLFunction> {
    private var library: [FragmentShaderTypes : Shader] = [:]
    
    override func fillLibrary() {
        library.updateValue(Shader(label: "Basic Fragment Shader",
                                   functionName: "basic_fragment_shader"),
                            forKey: .Basic)
    }
    
    override subscript(_ type: FragmentShaderTypes) -> MTLFunction {
        return (library[type]?.function)!
    }
}

private class Shader {
    var name: String = ""
    var functionName: String = ""
    var function: MTLFunction!
    
    init(label: String, functionName: String) {
        self.function = Engine.DefaultLibrary.makeFunction(name: functionName)
        self.function.label = label
    }
}
