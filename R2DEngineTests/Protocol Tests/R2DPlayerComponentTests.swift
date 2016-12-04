//
//  R2DPlayerComponentTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 5/6/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class R2DPlayerComponentTests: QuickSpec {
    
    class Player: R2DPlayer {
        
        var inventory: [R2DInventoryItem] = []
        var health: Int = 3
        
        weak var delegate: R2DPlayerDeathDelegate? = nil
        
        func updatePlayer(_ currentTime: CFTimeInterval) {}
        func resetPlayer() {}
    }
    
    class DeathDelegate: R2DPlayerDeathDelegate {
        var died = false
        weak var player: R2DPlayer? = nil
        func playerDied(_ thePlayer: R2DPlayer) {
            died = true
            player = thePlayer
        }
    }
    
    override func spec() {
        describe("R2DPlayerComponentTests") {
            
            var player: Player!
            var delegate: DeathDelegate!
            
            beforeEach {
                player = Player()
                delegate = DeathDelegate()
                
                player.delegate = delegate
            }
            
            it("should remove one of the player's health points") {
                player.hurtPlayer()
                
                expect(player.health).to(equal(2))
            }
            
            it("should call the death delegate if the player's health reaches zero") {
                for _ in 0..<3 {
                    player.hurtPlayer()
                }
                
                expect(delegate.died).to(beTrue())
                expect(delegate.player).to(beIdenticalTo(player))
            }
        }
    }
}
