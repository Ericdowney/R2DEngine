//
//  R2DSpawner.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/12/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public typealias R2DSpawnerFunc = (_ seed: Int, _ type: R2DSpawnerType) -> [R2DScrolling]

public protocol R2DSpawnProperties: class {
    var minimumSpawnTime: TimeInterval { get set }
    var maximumSpawnTime: TimeInterval { get set }
    var spawnType: R2DSpawnerType { get set }
    
    var spawnNodes: R2DSpawnerFunc { get set }
    var seed: Int { get set }
}

public protocol R2DSpawnerComponent {
    func spawn() -> [R2DScrolling]
    func spawnAction()
    func startSpawning()
    func updateSpawnNodes(_ currentTime: CFTimeInterval)
    func stopSpawning()
    func stop()
}

public extension R2DSpawnerComponent where Self: R2DSpawnProperties {
    func spawn() -> [R2DScrolling] {
        self.seed += 1
        return self.spawnNodes(self.seed, self.spawnType)
    }
}

public extension R2DSpawnerComponent where Self: R2DSpawnProperties, Self: SKNode {
    func startSpawning() {
        let min: UInt32 = UInt32(self.minimumSpawnTime + 1)
        let max: UInt32 = UInt32(self.maximumSpawnTime + 1)
        let spawnTime = TimeInterval(arc4random_uniform(max) + min)
        let range = self.maximumSpawnTime - self.minimumSpawnTime
        let action = SKAction.repeatForever( SKAction.sequence([
            SKAction.wait(forDuration: spawnTime, withRange: spawnTime/range),
            SKAction.run(self.spawnAction)
            ] ) )
        self.run(action)
    }
    
    func stopSpawning() {
        self.removeAllActions()
        self.children.forEach { $0.removeAllActions() }
    }
    
    func stop() {
        self.removeAllActions()
        self.removeAllChildren()
    }
}

public typealias R2DSpawner = R2DSpawnProperties & R2DSpawnerComponent
