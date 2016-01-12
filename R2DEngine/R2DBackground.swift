//
//  R2DBackground.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public class R2DBackground: R2DScrollingNode {
    
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