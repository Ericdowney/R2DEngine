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
    func initialize<T: SKScene where T: R2DGameManager>(gameManager: T)
}

extension R2DHudComponent where Self: R2DHudComponentProperties {
    mutating public func hide() {
        self.hidden = true
    }
    
    mutating public func show() {
        self.hidden = false
    }
}

public typealias R2DHud = protocol<R2DHudComponentProperties, R2DHudComponent>