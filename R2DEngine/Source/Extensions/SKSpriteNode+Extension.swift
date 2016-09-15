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
            return R2DAnchorPoint.fromCGPoint(anchorPoint)
        }
        set {
            anchorPoint = newValue.value
        }
    }
    
    // MARK: X
    
    public var r2d_leftX: CGFloat {
        return position.x - (size.width * anchorPoint.x)
    }
    
    public var r2d_rightX: CGFloat {
        return position.x + size.width - (size.width * anchorPoint.x)
    }
    
    // MARK: Y
    
    public var r2d_topY: CGFloat {
        return position.y + size.height - (size.height * anchorPoint.y)
    }
    
    public var r2d_bottomY: CGFloat {
        return position.y - (size.height * anchorPoint.y)
    }
    
    // MARK: - Setters
    
    public func r2d_color(_ color: SKColor) -> Self {
        self.color = color
        return self
    }
    
    public func r2d_anchor(_ anchor: R2DAnchorPoint) -> Self {
        anchorPoint = anchor.value
        return self
    }
    
    public func r2d_texture(_ texture: SKTexture) -> Self {
        self.texture = texture
        return self
    }
    
    public func r2d_imageNamed(_ imageNamed: String) -> Self {
        texture = SKTexture(imageNamed: imageNamed)
        return self
    }
    
    // MARK: - Physics
    
    func r2d_physicsBody(_ body: SKPhysicsBody) -> Self {
        physicsBody = body
        return self
    }
    
    func r2d_physicsBodyFromSize(_ size: CGSize) -> Self {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        return self
    }

    func r2d_physicsBodyFromTexture() -> Self {
        physicsBody = SKPhysicsBody(r2dRectangleOfSize: texture?.size())
        return self
    }
}
