//
//  SKNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public extension SKNode {
    convenience init(r2d_name: String) {
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