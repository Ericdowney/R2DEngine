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
        jumpCount = 0
    }
}

public extension R2DJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    public func jump() {
        physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpImpluse))
        jumpCount += 1
    }
}

public protocol R2DMultiJumpComponent: R2DJumpComponent {
    var numberOfJumps: Int { get set }
}

public extension R2DMultiJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    func jump() {
        if jumpCount < numberOfJumps {
            physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: jumpImpluse))
            jumpCount += 1
        }
    }
}

public protocol R2DInfiniteJumpComponent: R2DJumpComponent {
    var waitBetweenJump: TimeInterval { get }
    func jumpForever()
}

public extension R2DInfiniteJumpComponent where Self: R2DJumpProperties, Self: SKSpriteNode {
    func jumpForever() {
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.wait(forDuration: waitBetweenJump),
                SKAction.run(jump)
            ])
        ))
    }
}

public typealias R2DJump = R2DJumpProperties & R2DJumpComponent
public typealias R2DMultiJump = R2DJumpProperties & R2DMultiJumpComponent
public typealias R2DInfiniteJump = R2DJumpProperties & R2DInfiniteJumpComponent
