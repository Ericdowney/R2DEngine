//
//  R2DSpawner.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/12/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public typealias R2DSpawnerFunc = (seed: Int, type: R2DSpawnerType) -> [R2DScrolling]

public protocol R2DSpawnProperties: class {
    var minimumSpawnTime: NSTimeInterval { get set }
    var maximumSpawnTime: NSTimeInterval { get set }
    var spawnType: R2DSpawnerType { get set }
    
    var spawnNodes: R2DSpawnerFunc { get set }
    var seed: Int { get set }
}

public protocol R2DSpawnerComponent {
    func spawn() -> [R2DScrolling]
    func updateSpawnNodes(currentTime: CFTimeInterval)
    func stopSpawning()
    func stop()
}

public extension R2DSpawnerComponent where Self: R2DSpawnProperties {
    func spawn() -> [R2DScrolling] {
        self.seed += 1
        return self.spawnNodes(seed: self.seed, type: self.spawnType)
    }
}

public typealias R2DSpawner = protocol<R2DSpawnProperties, R2DSpawnerComponent>
