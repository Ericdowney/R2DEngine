//
//  R2DGameObject.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public class R2DScrollingNode: SKNode {

    var delta: CGVector {
        return self.scrollDirection.toCGVector().r2d_multiplyBy(self.scrollSpeed)
    }
    
    let scrollSpeed: CGFloat
    let scrollDirection: R2DDirection

    public init(scrollSpeed: CGFloat, scrollDirection: R2DDirection) {
        self.scrollSpeed = scrollSpeed
        self.scrollDirection = scrollDirection
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.scrollSpeed = 0.0
        self.scrollDirection = .Left
        super.init(coder: aDecoder)
    }
    
    public func startScrolling() {
        let action = SKAction.repeatActionForever( SKAction.moveBy(self.delta, duration: 1.0/60.0) )
        self.runAction(action)
    }
    
    public func stopScrolling() {
        self.removeAllActions()
    }
}