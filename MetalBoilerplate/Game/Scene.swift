import MetalKit

class Scene {
    
    var gameObjects: [GameObject] = []
    
    init() {
        gameObjects.append(GameObject())
    }
    
    func update() {
        
    }
    
    func render(_ renderCommandEncoder: MTLRenderCommandEncoder){
        for gameObject in gameObjects {
            gameObject.render(renderCommandEncoder)
        }
    }
    
}
