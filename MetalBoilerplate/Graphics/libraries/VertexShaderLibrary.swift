import MetalKit

enum VertexShaderTypes {
    case Basic
}

class VertexShaderLibrary: Library<VertexShaderTypes, MTLFunction> {
    private var library: [VertexShaderTypes : Shader] = [:]

    override func fillLibrary() {
        library.updateValue(Shader(label: "Basic Vertex Shader",
                                   functionName: "basic_vertex_shader"),
                            forKey: .Basic)
    }
    
    override subscript(_ type: VertexShaderTypes) -> MTLFunction {
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

