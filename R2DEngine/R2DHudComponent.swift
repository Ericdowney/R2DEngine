//
//  R2DHudComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DHudComponentProperties {
    var name: String { get set }
}
public protocol R2DHudComponent {
    mutating func hide()
    mutating func show()
    func initialize(scene: SKScene, hudManager: R2DHudManager)
}

extension R2DHudComponent {
    public func initialize(scene: SKScene, hudManager: R2DHudManager) {}
}

public typealias R2DHud = protocol<R2DHudComponentProperties,R2DHudComponent>