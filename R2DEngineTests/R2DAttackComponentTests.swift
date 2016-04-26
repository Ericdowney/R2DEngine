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
                    
                    subject.startLookingForPrey(.Left)
                    
                    expect(subject.hasActions()).to(beTrue())
                }
            }
            
            context("Left || Right") {
                context("Looking For Prey") {
                    
                    var subject: EnemyWithFoundPrey!
                    var prey: SKSpriteNode!
                    
                    beforeEach {
                        subject = EnemyWithFoundPrey(color: .blueColor(), size: CGSize(width: 10, height: 1))
                        prey = SKSpriteNode(color: .redColor(), size: CGSize(width: 10, height: 1))
                        subject.prey = prey
                        subject.position = CGPoint(x: 10, y: 0)
                        prey.position = CGPoint(x: 15, y: 0)
                    }
                    
                    it("Left, should look for prey within its X boundaries and call found prey") {
                        subject.lookForPrey(.Left)
                        
                        expect(subject.found).to(beTrue())
                    }
                    
                    it("Right, should look for prey within its X boundaries and call found prey") {
                        subject.lookForPrey(.Right)
                        
                        expect(subject.found).to(beTrue())
                    }
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
            
            context("Up || Down") {
                context("Looking For Prey") {
                    
                    var subject: EnemyWithFoundPrey!
                    var prey: SKSpriteNode!
                    
                    beforeEach {
                        subject = EnemyWithFoundPrey(color: .blueColor(), size: CGSize(width: 1, height: 10))
                        prey = SKSpriteNode(color: .redColor(), size: CGSize(width: 1, height: 10))
                        subject.prey = prey
                        subject.position = CGPoint(x: 0, y: 10)
                        prey.position = CGPoint(x: 0, y: 14)
                    }
                    
                    it("Up, should look for prey within its Y boundaries and call found prey") {
                        subject.lookForPrey(.Up)
                        
                        expect(subject.found).to(beTrue())
                    }
                    
                    it("Down, should look for prey within its Y boundaries and call found prey") {
                        subject.lookForPrey(.Down)
                        
                        expect(subject.found).to(beTrue())
                    }
                }
            }
        }
    }
}
