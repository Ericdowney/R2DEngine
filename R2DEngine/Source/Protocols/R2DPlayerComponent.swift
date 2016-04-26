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

public protocol R2DPlayerDeathDelegateContainer {
    var delegate: R2DPlayerDeathDelegate? { get set }
}

public protocol R2DPlayerComponent {
    func updatePlayer(currentTime: CFTimeInterval)
    func resetPlayer()
    func hurtPlayer()
}

public extension R2DPlayerComponent where Self: R2DPlayerProperties, Self: R2DPlayerDeathDelegateContainer {
    func hurtPlayer() {
        self.health -= 1
        if self.health <= 0 {
            self.delegate?.playerDied(self)
        }
    }
}

public protocol R2DPlayerDeathDelegate {
    /// Parameter name is "underscore" to allow user to fill in parameter name of their choosing
    func playerDied(_: R2DPlayer)
}

public typealias R2DPlayer = protocol<R2DPlayerProperties, R2DPlayerComponent, R2DPlayerDeathDelegateContainer>