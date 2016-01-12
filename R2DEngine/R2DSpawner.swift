//
//  R2DSpawner.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/12/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public class R2DSpawner: SKNode {
    
    public typealias SpawnerFunc = Int -> [R2DScrollingSpriteNode]
    
    let minimumSpawnTime: NSTimeInterval
    let maximumSpawnTime: NSTimeInterval
    
    public var spawnNodes: SpawnerFunc?
    var seed: Int = 0
    
    public init(minimumSpawnTime: NSTimeInterval, maximumSpawnTime: NSTimeInterval, spawnNodes: SpawnerFunc? = nil) {
        self.minimumSpawnTime = minimumSpawnTime
        self.maximumSpawnTime = maximumSpawnTime
        self.spawnNodes = spawnNodes
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.minimumSpawnTime = 0
        self.maximumSpawnTime = 0
        self.spawnNodes = { seed in []}
        super.init(coder: aDecoder)
    }
    
    public func startSpawning(startingSeed: Int = 0) {
        self.seed = startingSeed
        let min: UInt32 = UInt32(self.minimumSpawnTime + 1)
        let max: UInt32 = UInt32(self.maximumSpawnTime + 1)
        let spawnTime = NSTimeInterval(arc4random_uniform(max) + min)
        let spawnAction = SKAction.sequence([SKAction.waitForDuration(spawnTime), SKAction.runBlock { [unowned self] in
            guard let scrollingNodes = self.spawnNodes?(self.seed) else {
                return
            }
            self.r2d_addChildren(scrollingNodes)
            
            scrollingNodes.forEach {
                $0.startScrolling()
            }
            ++self.seed
        }])
        self.runAction( SKAction.repeatActionForever(spawnAction) )
    }
    
    public func stopSpawning() {
        self.removeAllActions()
    }
    
    public func stop() {
        self.removeAllActions()
        self.removeAllChildren()
    }
}
