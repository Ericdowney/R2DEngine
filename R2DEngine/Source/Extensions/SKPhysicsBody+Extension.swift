//
//  SKPhysicsBody+Extension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 5/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

extension SKPhysicsBody {
    convenience init?(rectangleOfSize: CGSize?) {
        guard let size = rectangleOfSize else { return nil }
        self.init(rectangleOf: size)
    }
}
