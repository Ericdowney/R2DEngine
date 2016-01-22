//
//  SKSpriteNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public extension SKSpriteNode {
    public func r2d_setAnchor(anchor: R2DAnchorPoint) {
        self.anchorPoint = anchor.value
    }
    
    public var r2d_leftX: CGFloat {
        let width = self.size.width
        let anchorX = self.anchorPoint.x
        if anchorX == 0 {
            return self.position.x
        }
        if anchorX == 1 {
            return self.position.x + width
        }
        return self.position.x - (width * anchorX)
    }
    
    public var r2d_rightX: CGFloat {
        let width = self.size.width
        let anchorX = self.anchorPoint.x
        if anchorX == 0 {
            return self.position.x + width
        }
        if anchorX == 1 {
            return self.position.x
        }
        return self.position.x + (width * anchorX)
    }
}