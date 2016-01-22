//
//  R2DDashComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/21/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DDashProperties {
    var dashSpeed: CGFloat { get set }
    var dashDirection: R2DDirection { get set }
}

public protocol R2DDashComponent {
    func dash()
    func onDash()
}

public extension R2DDashComponent where Self: R2DDashProperties, Self: SKSpriteNode {
    var dashDelta: CGVector {
        return self.dashDirection.vector.r2d_multiplyBy(self.dashSpeed)
    }
    
    func dash() {
        self.runAction( SKAction.sequence([
            SKAction.runBlock {
                self.position.r2d_addVector(self.dashDelta)
            },
            SKAction.waitForDuration(1.0)
        ]) )
    }
}

public typealias R2DDash = protocol<R2DDashProperties, R2DDashComponent>