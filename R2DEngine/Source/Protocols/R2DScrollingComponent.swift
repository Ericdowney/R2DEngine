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
    var scrollAction: SKAction { get }
    var scrollForeverAction: SKAction { get }
    
    func scroll()
    func scrollForever()
}

public extension R2DScrollingComponent where Self: R2DScrollingProperties {
    var scrollDelta: CGVector {
        return scrollDirection.vector * scrollSpeed
    }
    
    var scrollAction: SKAction {
        return SKAction.move(by: scrollDelta, duration: 1.0/60.0)
    }
    
    var scrollForeverAction: SKAction {
        return SKAction.repeatForever( scrollAction )
    }
}

public extension R2DScrollingComponent where Self: SKNode {
    func startScrollingForever() {
        run( scrollAction )
    }
    
    func startScrolling() {
        run( scrollForeverAction )
    }
}

public typealias R2DScrolling = R2DScrollingProperties & R2DScrollingComponent
