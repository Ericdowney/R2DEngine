//
//  R2DJumpComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/13/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public protocol R2DJumpComponent {
    var jumpCount: Int { get set }
    func jump()
    mutating func resetJump()
}

public extension R2DJumpComponent {
    mutating func resetJump() {
        self.jumpCount = 0
    }
}