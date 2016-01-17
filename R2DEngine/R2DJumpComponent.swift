//
//  R2DJumpComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/13/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public protocol R2DJumpProperties {
    var jumpCount: Int { get set }
}

public protocol R2DJumpComponent {
    func jump()
    mutating func resetJump()
}

public extension R2DJumpComponent where Self: R2DJumpProperties {
    mutating func resetJump() {
        self.jumpCount = 0
    }
}

public typealias R2DJump = protocol<R2DJumpProperties, R2DJumpComponent>