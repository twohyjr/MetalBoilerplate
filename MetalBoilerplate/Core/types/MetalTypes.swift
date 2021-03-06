import simd

//The types defined here are defined in metal as well

protocol sizeable{ }
extension sizeable{
    static var size: Int{ return MemoryLayout<Self>.size }
    static var stride: Int{ return MemoryLayout<Self>.stride }
    static func size(_ count: Int)->Int{ return MemoryLayout<Self>.size * count }
    static func stride(_ count: Int)->Int{ return MemoryLayout<Self>.stride * count }
}

extension UInt32: sizeable { }
extension Int32: sizeable { }
extension float2: sizeable { }
extension float3: sizeable { }
extension float4: sizeable { }

struct Vertex: sizeable {
    var position: float3
}
