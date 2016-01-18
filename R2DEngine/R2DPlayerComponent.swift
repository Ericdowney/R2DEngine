//
//  R2DPlayer.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DInventoryItem {
    var itemName: String { get set }
}

public protocol R2DPlayerProperties: class {
    var inventory: [R2DInventoryItem] { get set }
    var health: Int { get set }
}

public protocol R2DPlayerComponent {
    func updatePlayer(currentTime: CFTimeInterval)
    func resetPlayer()
    func hurtPlayer()
}

public extension R2DPlayerComponent where Self: R2DPlayerProperties {
    func hurtPlayer() {
        self.health--
    }
}

public protocol R2DPlayerDeathDelegate {
    func playerDied()
}

public typealias R2DPlayer = protocol<R2DPlayerProperties, R2DPlayerComponent>