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
    
    public var anchor: R2DAnchorPoint {
        get {
            return R2DAnchorPoint.fromCGPoint(anchorPoint)
        }
        set {
            anchorPoint = newValue.value
        }
    }
    
    // MARK: X
    
    public var leftX: CGFloat {
        return position.x - (size.width * anchorPoint.x)
    }
    
    public var rightX: CGFloat {
        return position.x + size.width - (size.width * anchorPoint.x)
    }
    
    // MARK: Y
    
    public var topY: CGFloat {
        return position.y + size.height - (size.height * anchorPoint.y)
    }
    
    public var bottomY: CGFloat {
        return position.y - (size.height * anchorPoint.y)
    }
    
    // MARK: - Setters
    
    public func set(color: SKColor) -> Self {
        self.color = color
        return self
    }
    
    public func set(anchor: R2DAnchorPoint) -> Self {
        anchorPoint = anchor.value
        return self
    }
    
    public func set(texture: SKTexture) -> Self {
        self.texture = texture
        return self
    }
    
    public func set(imageNamed: String) -> Self {
        texture = SKTexture(imageNamed: imageNamed)
        return self
    }
    
    // MARK: - Physics
    
    func set(physicsBody: SKPhysicsBody) -> Self {
        self.physicsBody = physicsBody
        return self
    }
    
    func set(physicsBodyFromSize size: CGSize) -> Self {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        return self
    }

    func setPhysicsBodyFromTexture() -> Self {
        physicsBody = SKPhysicsBody(rectangleOfSize: texture?.size())
        return self
    }
}
