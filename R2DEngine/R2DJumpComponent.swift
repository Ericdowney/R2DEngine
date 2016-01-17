//
//  R2DJumpComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/13/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public protocol R2DJumpProperties: class {
    var jumpCount: Int { get set }
}

public protocol R2DDoubleJumpComponent {
    func jump()
    func resetJump()
}

public extension R2DDoubleJumpComponent where Self: R2DJumpProperties {
    func resetJump() {
        self.jumpCount = 0
    }
}

public typealias R2DDoubleJump = protocol<R2DJumpProperties, R2DDoubleJumpComponent>