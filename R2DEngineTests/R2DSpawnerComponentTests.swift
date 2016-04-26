//
//  R2DSpawnerComponentTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 4/13/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class R2DSpawnerComponentTests: QuickSpec {
    
    private class Spawner: R2DSpawner {
        var minimumSpawnTime: NSTimeInterval = 0.0
        var maximumSpawnTime: NSTimeInterval = 1.0
        var spawnType: R2DSpawnerType = .Cos
        
        var spawnNodes: R2DSpawnerFunc = { _, _ in [] }
        var seed: Int = 1
        
        func updateSpawnNodes(currentTime: CFTimeInterval) {
            
        }
        func stopSpawning() {
            
        }
        func stop() {
            
        }
    }

    override func spec() {
        describe("R2DSpawnerComponentTests") {
            
            var subject: Spawner!
            
            beforeEach {
                subject = Spawner()
            }
            
            it("should increment seed and spawn nodes") {
                class LocalScrolling: SKNode, R2DScrolling {
                    var scrollDirection: R2DDirection = .Left
                    var scrollSpeed: CGFloat = 1.0
                }
                var spawned = false
                subject.spawnNodes = { _, _ in
                    spawned = true
                    return []
                }
                
                let result = subject.spawn()
                
                expect(result.isEmpty).to(beTrue())
                expect(spawned).to(beTrue())
            }
            
        }
    }
}
