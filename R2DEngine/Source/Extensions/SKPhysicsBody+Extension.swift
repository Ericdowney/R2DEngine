//
//  SKPhysicsBody+Extension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 5/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

extension SKPhysicsBody {
    convenience init?(r2dRectangleOfSize: CGSize?) {
        guard let size = r2dRectangleOfSize else { return nil }
        self.init(rectangleOf: size)
    }
}
