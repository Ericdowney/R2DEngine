//
//  SKSpriteNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public extension SKSpriteNode {
    
    // MARK: - Properties
    
    public var r2dAnchor: R2DAnchorPoint {
        get {
            return R2DAnchorPoint.fromCGPoint(self.anchorPoint)
        }
        set {
            self.anchorPoint = newValue.value
        }
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
    
    // MARK: - Setters
    
    public func r2d_color(color: SKColor) -> Self {
        self.color = color
        return self
    }
    
    public func r2d_anchor(anchor: R2DAnchorPoint) -> Self {
        self.anchorPoint = anchor.value
        return self
    }
    
    public func r2d_texture(texture: SKTexture) -> Self {
        self.texture = texture
        return self
    }
    
    public func r2d_imageNamed(imageNamed: String) -> Self {
        self.texture = SKTexture(imageNamed: imageNamed)
        return self
    }
}