//
//  SKNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit


extension SKNode {
    public convenience init(r2d_name: String) {
        self.init()
        self.name = r2d_name
    }
    
    public func r2d_addChildren(nodes: SKNode...) {
        nodes.forEach { self.addChild($0) }
    }
    
    public func r2d_addChildren(nodes: [SKNode]) {
        nodes.forEach { self.addChild($0) }
    }
}

extension SKNode: R2DHudComponent {
    public func hide() {
        self.hidden = true
    }
    
    public func show() {
        self.hidden = false
    }
}