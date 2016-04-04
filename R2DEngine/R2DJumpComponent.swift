//
//  R2DJumpComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/13/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DJumpProperties: class {
    var jumpImpluse: CGFloat { get }
    var jumpCount: Int { get set }
}

public protocol R2DDoubleJumpComponent {
    func jump()
    func resetJump()
}

public protocol R2DInfiniteJumpComponent {
    var waitBetweenJump: NSTimeInterval { get }
    func jumpForever()
    func jumpWithImpluse(yImpluse: CGFloat)
    func resetJump()
}

public extension R2DDoubleJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    func jump() {
        if self.jumpCount < 2 {
            self.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpImpluse))
            self.jumpCount += 1
        }
    }
    
    func resetJump() {
        self.jumpCount = 0
    }
}

public extension R2DInfiniteJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    func jumpForever() {
        self.runAction( SKAction.sequence([
            SKAction.waitForDuration(self.waitBetweenJump),
            SKAction.runBlock {
                self.jump()
            }
        ]) )
    }
    
    func jump() {
        self.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpImpluse))
        self.jumpCount += 1
    }
    
    func resetJump() {
        self.jumpCount = 0
    }
}

public typealias R2DDoubleJump = protocol<R2DJumpProperties, R2DDoubleJumpComponent>