//
//  R2DPlatform.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public class R2DScrollingPlatform: SKSpriteNode, R2DScrolling {
    
    public var scrollDirection: R2DDirection = .Left
    public var scrollSpeed: CGFloat = 0.0
    
    public init(imageNamed: String, scrollSpeed: CGFloat, scrollDirection: R2DDirection) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .clearColor(), size: texture.size())
        
        self.scrollSpeed = scrollSpeed
        self.scrollDirection = scrollDirection
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0, y: 0, width: texture.size().width, height: texture.size().height))
        self.physicsBody?.dynamic = false
    }
    
    public init(color: UIColor, size: CGSize, scrollSpeed: CGFloat, scrollDirection: R2DDirection) {
        super.init(texture: nil, color: color, size: size)
        
        self.scrollSpeed = scrollSpeed
        self.scrollDirection = scrollDirection
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.physicsBody?.dynamic = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
