//
//  R2DDashComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/21/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DDashProperties {
    var dashSpeed: CGFloat { get set }
    var dashDirection: R2DDirection { get set }
}

public protocol R2DDashComponent {
    func dash()
    func onDash()
}

public extension R2DDashComponent where Self: R2DDashProperties, Self: SKSpriteNode {
    var dashDelta: CGVector {
        return self.dashDirection.vector * self.dashSpeed
    }
    
    func dash() {
        self.run( dashSequence() )
    }
    
    fileprivate func dashSequence() -> SKAction {
        return SKAction.sequence([
            SKAction.run { [unowned self] in
                self.position += self.dashDelta
            },
            SKAction.wait(forDuration: 1.0),
            SKAction.run { [weak self] in
                self?.onDash()
            }
        ])
    }
}

public typealias R2DDash = R2DDashProperties & R2DDashComponent
