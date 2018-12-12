
import MetalKit

class Graphics {
    public static var VertexDescriptors: VertexDescriptorLibrary!
    public static var RenderPipelineStates: RenderPipelineStateLibrary!
    public static var VertexShaders: VertexShaderLibrary!
    public static var FragmentShaders: FragmentShaderLibrary!

    public static func Initialize(){
        self.VertexShaders = VertexShaderLibrary()
        self.FragmentShaders = FragmentShaderLibrary()
        self.VertexDescriptors = VertexDescriptorLibrary()
        self.RenderPipelineStates = RenderPipelineStateLibrary()
    }
    
}
