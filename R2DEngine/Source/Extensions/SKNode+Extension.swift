//
//  SKNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

extension SKNode {
    
    // MARK: - Properties
    
    public var r2dPosition: (x: CGFloat, y: CGFloat) {
        get {
            return ( self.position.x, self.position.y )
        }
        set {
            self.position = CGPoint(x: newValue.x, y: newValue.y)
        }
    }
    
    public var r2dPositionPercent: (x: CGFloat, y: CGFloat) {
        get {
            return ( self.position.x / R2DUtils.screenWidth, self.position.y / R2DUtils.screenHeight )
        }
        set {
            self.position = R2DUtils.getX(newValue.x, y: newValue.y)
        }
    }
    
    // MARK: - Init
    
    public convenience init(r2d_name: String) {
        self.init()
        self.name = r2d_name
    }
    
    // MARK: - Add Children
    
    public func r2d_addChildren(nodes: SKNode...) -> Self {
        nodes.forEach { self.addChild($0) }
        return self
    }
    
    public func r2d_addChildren(nodes: [SKNode]) -> Self {
        nodes.forEach { self.addChild($0) }
        return self
    }
    
    // MARK: - Loop through Children
    
    public func r2d_eachChild(@noescape loop: SKNode -> Void) -> Self {
        children.forEach(loop)
        return self
    }
    
    public func r2d_eachChildWithName(name: String, @noescape loop: SKNode -> Void) -> Self {
        children.filter { $0.name == name }.forEach(loop)
        return self
    }
    
    public func r2d_eachChildContainsName(name: String, @noescape loop: SKNode -> Void) -> Self {
        children.filter { $0.name?.containsString(name) ?? false }.forEach(loop)
        return self
    }
    
    // MARK: - Setters
    
    public func r2d_position(position: CGPoint) -> Self {
        self.position = position
        return self
    }
    
    public func r2d_position(x: CGFloat, y: CGFloat) -> Self {
        self.position = CGPoint(x: x, y: y)
        return self
    }
    
    public func r2d_positionPercent(x: CGFloat, y: CGFloat) -> Self {
        self.position = R2DUtils.getX(x, y: y)
        return self
    }
    
    public func r2d_addToNode(node: SKNode) -> Self {
        node.addChild(self)
        return self
    }
}