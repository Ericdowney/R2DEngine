//
//  R2DJumpComponentTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 5/6/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class R2DJumpComponentTests: QuickSpec {
    
    class Jumper: SKSpriteNode, R2DJumpProperties, R2DJumpComponent {
        var jumpImpluse: CGFloat = 5.0
        var jumpCount: Int = 0
    }
    
    class DoubleJumper: SKSpriteNode, R2DMultiJump {
        var jumpImpluse: CGFloat = 5.0
        var jumpCount: Int = 0
        var numberOfJumps: Int = 2
    }

    override func spec() {
        describe("R2DJumpComponentTests") {
            
            describe("R2DJumpComponent") {
                var subject: Jumper!
                
                beforeEach {
                    subject = Jumper()
                }
                
                it("should reset the jump count") {
                    subject.jump()
                    subject.jump()
                    subject.jump()
                    subject.jump()
                    
                    expect(subject.jumpCount).to(equal(4))
                    
                    subject.resetJump()
                    
                    expect(subject.jumpCount).to(equal(0))
                }
            }
            
            describe("R2DDoubleJump") {
                var subject: DoubleJumper!
                
                beforeEach {
                    subject = DoubleJumper()
                    subject.physicsBody = SKPhysicsBody()
                }
                
                it("should apply jump impluse and increment count") {
                    subject.jump()
                    
                    expect(subject.jumpCount).to(equal(1))
                }
                
                it("should not increment the count above 2") {
                    subject.jump()
                    subject.jump()
                    subject.jump()
                    subject.jump()
                    
                    expect(subject.jumpCount).to(equal(2))
                }
            }
        }
    }
}
