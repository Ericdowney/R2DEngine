//
//  SKSpriteNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public extension SKSpriteNode {
    public func r2d_setAnchor(anchor: R2DAnchorPoint) {
        self.anchorPoint = anchor.value
    }
}