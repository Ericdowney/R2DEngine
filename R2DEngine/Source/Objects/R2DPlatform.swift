//
//  R2DPlatform.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/10/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public class R2DPlatform: SKSpriteNode {
    
    public init(imageNamed: String) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: .clearColor(), size: texture.size())
        
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0, y: 0, width: texture.size().width, height: texture.size().height))
        self.physicsBody?.dynamic = false
    }
    
    public init(color: SKColor, size: CGSize) {
        super.init(texture: nil, color: color, size: size)
        
        self.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        self.physicsBody?.dynamic = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
