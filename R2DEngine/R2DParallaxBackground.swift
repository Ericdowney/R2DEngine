//
//  R2DParallaxBackground.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

private func +=(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public class R2DParallaxBackground: SKNode {
    
    private struct ParallaxLayer {
        var name: String
        var speed: CGFloat
        var direction: R2DDirection
        var delta: CGVector {
            return self.direction.toCGVector().r2d_multiplyBy(self.speed)
        }
    }
    
    private var layers: [ParallaxLayer]
    
    override public init() {
        self.layers = []
        super.init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.layers = []
        super.init(coder: aDecoder)
    }
    
    // MARK: - Adding Layers/Sprites
    
    public func addLayer(name: String, sprite: SKSpriteNode, speed: CGFloat, direction: R2DDirection) {
        sprite.name = name
        self.addChild(sprite)
        self.layers.append( ParallaxLayer(name: name, speed: speed, direction: direction) )
    }
    
    public func addLayer(name: String, node: SKNode, speed: CGFloat, direction: R2DDirection) {
        node.name = name
        self.addChild(node)
        self.layers.append( ParallaxLayer(name: name, speed: speed, direction: direction) )
    }
    
    public func addSpriteToLayer(name: String, sprite: SKSpriteNode) {
        guard let child = self.childNodeWithName(name) else {
            return
        }
        child.addChild(sprite)
    }
    
    // MARK: - Update
    
    public func start() {
        self.layers.forEach { layer in
            guard let nodeLayer = self.childNodeWithName(layer.name) else {
                return
            }
            
            let action = SKAction.repeatActionForever( SKAction.moveBy(layer.delta, duration: 1.0/60.0) )
            nodeLayer.runAction(action)
        }
    }
    
    public func stop() {
        self.removeAllActions()
    }
    
    public func update() {
        self.layers.forEach { layer in
            guard let nodeLayer = self.childNodeWithName(layer.name) else {
                return
            }
            
            nodeLayer.position += CGPoint(x: layer.delta.dx, y: layer.delta.dy)
        }
    }
}