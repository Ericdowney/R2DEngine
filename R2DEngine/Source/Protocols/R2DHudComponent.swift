//
//  R2DHudComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DHudComponentProperties {
    var hudName: String { get set }
    var hidden: Bool { get set }
}

public protocol R2DHudComponent {
    mutating func hide()
    mutating func show()
    func initialize<T: SKScene>(_ gameManager: T) where T: R2DGameManager
}

extension R2DHudComponent where Self: R2DHudComponentProperties {
    mutating public func hide() {
        hidden = true
    }
    
    mutating public func show() {
        hidden = false
    }
}

public typealias R2DHud = R2DHudComponentProperties & R2DHudComponent
