//
//  SKNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

extension SKNode {
    
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
    
    public func eachChild(@noescape loop: SKNode -> Void) -> Self {
        children.forEach(loop)
        return self
    }
    
    public func eachChildWithName(name: String, @noescape loop: SKNode -> Void) -> Self {
        children.filter { $0.name == name }.forEach(loop)
        return self
    }
    
    public func eachChildContainsName(name: String, @noescape loop: SKNode -> Void) -> Self {
        children.filter { $0.name?.containsString(name) ?? false }.forEach(loop)
        return self
    }
}