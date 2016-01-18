//
//  R2DSpawner.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/12/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public typealias R2DSpawnerFunc = (seed: Int, type: R2DSpawnerType) -> [R2DScrollingComponent]

public protocol R2DSpawnProperties: class {
    var minimumSpawnTime: NSTimeInterval { get set }
    var maximumSpawnTime: NSTimeInterval { get set }
    var spawnType: R2DSpawnerType { get set }
    
    var spawnNodes: R2DSpawnerFunc { get set }
    var seed: Int { get set }
}

public protocol R2DSpawnerComponent {
    func spawn() -> [R2DScrollingComponent]
    func updateSpawnNodes(currentTime: CFTimeInterval)
    func stopSpawning()
    func stop()
}

public extension R2DSpawnerComponent where Self: R2DSpawnProperties {
    func spawn() -> [R2DScrollingComponent] {
        return self.spawnNodes(seed: self.seed++, type: self.spawnType)
    }
}

public typealias R2DSpawner = protocol<R2DSpawnProperties, R2DSpawnerComponent>

//public class R2DSpawner: SKNode {
//    
//    public typealias SpawnerFunc = (seed: Int, type: SpawnerType) -> [R2DScrollingComponent]
//    
//    let minimumSpawnTime: NSTimeInterval
//    let maximumSpawnTime: NSTimeInterval
//    let spawnType: SpawnerType
//    
//    public var spawnNodes: SpawnerFunc?
//    var seed: Int = 0
//
//    public init(minimumSpawnTime: NSTimeInterval, maximumSpawnTime: NSTimeInterval, spawnType: SpawnerType, spawnNodes: SpawnerFunc? = nil) {
//        self.minimumSpawnTime = minimumSpawnTime
//        self.maximumSpawnTime = maximumSpawnTime
//        self.spawnType = spawnType
//        self.spawnNodes = spawnNodes
//        super.init()
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        self.minimumSpawnTime = 0
//        self.maximumSpawnTime = 0
//        self.spawnType = .Cos
//        self.spawnNodes = { seed in []}
//        super.init(coder: aDecoder)
//    }
//    
//    public func startSpawning(startingSeed: Int = 0) {
//        self.seed = startingSeed
//        self.spawn()
//    }
//    
//    private func spawn() {
//        let min: UInt32 = UInt32(self.minimumSpawnTime + 1)
//        let max: UInt32 = UInt32(self.maximumSpawnTime + 1)
//        let spawnTime = NSTimeInterval(arc4random_uniform(max) + min)
//        let spawnAction = SKAction.sequence([SKAction.waitForDuration(spawnTime),
//            SKAction.runBlock { [unowned self] in
//                guard let scrollingNodes = self.spawnNodes?(seed: self.seed, type: self.spawnType) else {
//                    return
//                }
//                self.r2d_addChildren(scrollingNodes)
//                
//                scrollingNodes.forEach {
//                    $0.startScrolling()
//                }
//                ++self.seed
//                self.spawn()
//            }
//        ])
//        self.runAction( spawnAction )
//    }
//
//    public func updateSpawnedNodes() {
//        let toBeRemoved = self.children.filter { node in
//            guard let scrollingSprite = node as? R2DScrollingSpriteNode else {
//                return false
//            }
//            return scrollingSprite.position.x + scrollingSprite.size.width < 0
//        }
//        
//        toBeRemoved.forEach {
//            $0.removeFromParent()
//        }
//        self.removeChildrenInArray(toBeRemoved)
//    }
//    
//    public func stopSpawning() {
//        self.removeAllActions()
//    }
//    
//    public func stop() {
//        self.removeAllActions()
//        self.removeAllChildren()
//    }
//}
