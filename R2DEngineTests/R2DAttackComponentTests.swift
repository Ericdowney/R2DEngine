//
//  R2DAttackComponentTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 4/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class R2DAttackComponentTests: QuickSpec {
    
    private class EnemyDefault: SKSpriteNode, R2DAttack {
        weak var prey: SKSpriteNode?
        var attacked: Bool = false
        
        func attack() {
            self.attacked = true
        }
    }
    
    private class EnemyWithFoundPrey: SKSpriteNode, R2DAttack {
        weak var prey: SKSpriteNode?
        var found: Bool = false
        
        private func foundPrey() {
            self.found = true
        }
        
        func attack() {}
    }

    override func spec() {
        describe("R2DAttackComponentTests") {
            
            context("Start Look for Prey") {
                it("should have SKActions") {
                    let subject = EnemyDefault()
                    
                    subject.startLookingForPrey()
                    
                    expect(subject.hasActions()).to(beTrue())
                }
            }
            
            context("Looking For Prey") {
                it("should look for prey within its X boundaries and call found prey") {
                    let subject = EnemyWithFoundPrey(color: .blueColor(), size: CGSize(width: 10, height: 1))
                    let prey = SKSpriteNode(color: .redColor(), size: CGSize(width: 10, height: 1))
                    subject.prey = prey
                    subject.position = CGPoint(x: 10, y: 0)
                    prey.position = CGPoint(x: 15, y: 0)
                    
                    subject.lookForPrey()
                    
                    expect(subject.found).to(beTrue())
                }
            }
            
            context("Found Prey") {
                it("should remove all actions and call attack") {
                    let subject = EnemyDefault()
                    subject.runAction(SKAction.waitForDuration(5.0))
                    
                    subject.foundPrey()
                    
                    expect(subject.attacked).to(beTrue())
                    expect(subject.hasActions()).to(beFalse())
                }
            }
        }
    }
}
