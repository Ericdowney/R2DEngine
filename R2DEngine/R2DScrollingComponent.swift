//
//  MovementComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/13/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DScrollingProperties {
    var scrollDirection: R2DDirection { get set }
    var scrollSpeed: CGFloat { get set }
}

public protocol R2DScrollingComponent {
    func startScrolling()
    func startScrollingForever()
    func moveAction() -> SKAction
    func moveForeverAction() -> SKAction
}

public extension R2DScrollingComponent where Self: R2DScrollingProperties {
    var scrollDelta: CGVector {
        return self.scrollDirection.vector.r2d_multiplyBy(self.scrollSpeed)
    }
    
    func moveAction() -> SKAction {
        return SKAction.moveBy(self.scrollDelta, duration: 1.0/60.0)
    }
    
    func moveForeverAction() -> SKAction {
        return SKAction.repeatActionForever( self.moveAction() )
    }
}

public extension R2DScrollingComponent where Self: SKNode {
    func startScrollingForever() {
        self.runAction(self.moveForeverAction())
    }
    
    func startScrolling() {
        self.runAction(self.moveAction())
    }
}

public typealias R2DScrolling = protocol<R2DScrollingProperties, R2DScrollingComponent>