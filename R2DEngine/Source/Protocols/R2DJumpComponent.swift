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

public protocol R2DJumpComponent {
    func resetJump()
    func jump()
}

public extension R2DJumpComponent where Self: R2DJumpProperties {
    func resetJump() {
        self.jumpCount = 0
    }
}

public extension R2DJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    public func jump() {
        self.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpImpluse))
        self.jumpCount += 1
    }
}

public protocol R2DMultiJumpComponent: R2DJumpComponent {
    var numberOfJumps: Int { get set }
}

public extension R2DMultiJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    func jump() {
        if self.jumpCount < numberOfJumps {
            self.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpImpluse))
            self.jumpCount += 1
        }
    }
}

public protocol R2DInfiniteJumpComponent: R2DJumpComponent {
    var waitBetweenJump: NSTimeInterval { get }
    func jumpForever()
    func jumpWithImpluse(yImpluse: CGFloat)
}

public extension R2DInfiniteJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    func jumpForever() {
        self.runAction( SKAction.sequence([
            SKAction.waitForDuration(self.waitBetweenJump),
            SKAction.runBlock { [unowned self] in
                self.jump()
            }
        ]) )
    }
}

public typealias R2DJump = protocol<R2DJumpProperties, R2DJumpComponent>
public typealias R2DMultiJump = protocol<R2DJumpProperties, R2DMultiJumpComponent>
public typealias R2DInfiniteJump = protocol<R2DJumpProperties, R2DInfiniteJumpComponent>
