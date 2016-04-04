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
    
    // MARK: - X
    
    public var r2d_leftX: CGFloat {
        return self.position.x - (self.size.width * self.anchorPoint.x)
    }
    
    public var r2d_rightX: CGFloat {
        return self.position.x + self.size.width - (self.size.width * self.anchorPoint.x)
    }
    
    // MARK: - Y
    
    public var r2d_topY: CGFloat {
        return self.position.y + self.size.height - (self.size.height * self.anchorPoint.y)
    }
    
    public var r2d_bottomY: CGFloat {
        return self.position.y - (self.size.height * self.anchorPoint.y)
    }
}