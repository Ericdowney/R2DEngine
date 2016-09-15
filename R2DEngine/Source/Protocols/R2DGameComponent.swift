//
//  R2DGameObject.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DGameComponent {
    func updateCollision(with contact: SKPhysicsContact, andGameManager gameManager: R2DGameManagerComponent)
}
