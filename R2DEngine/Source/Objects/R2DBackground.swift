//
//  R2DBackground.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public class R2DBackground: SKNode, R2DScrolling {
    
    public var scrollDirection: R2DDirection = .Left
    public var scrollSpeed: CGFloat = 0.0
    
    public init(scrollSpeed: CGFloat, scrollDirection: R2DDirection) {
        self.scrollSpeed = scrollSpeed
        self.scrollDirection = scrollDirection
        super.init()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addSprite(sprite: SKSpriteNode) {
        self.addChild(sprite)
    }
    
    public func addSpriteToLayer(name: String, sprite: SKSpriteNode) {
        guard let child = self.childNodeWithName(name) else {
            return
        }
        child.addChild(sprite)
    }
    
    public func addSpriteLayer(layer: SKNode) {
        self.addChild(layer)
    }
    
    public func addSpriteLayerWithName(name: String) {
        self.addChild( SKNode(r2d_name: name) )
    }
}