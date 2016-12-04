//
//  R2DDisappearPlatformComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DBlinkProperties {
    var fadeDuration: TimeInterval { get set }
    var numberOfBlinks: Int { get set }
}

public protocol R2DBlinkComponent {
    func blink()
    func blinkEnd() -> SKAction
}

public extension R2DBlinkComponent where Self: SKNode, Self: R2DBlinkProperties {
    func blink() {
        var sequence: [SKAction] = []
        self.numberOfBlinks.times {
            sequence.append(self.blinkAction())
        }
        sequence.append(blinkEnd())
        
        self.run(SKAction.sequence( sequence ))
    }
    
    fileprivate func blinkAction() -> SKAction {
        return SKAction.sequence([
            SKAction.fadeOut(withDuration: fadeDuration),
            SKAction.wait(forDuration: 0.05),
            SKAction.fadeIn(withDuration: fadeDuration)
        ])
    }
}

public typealias R2DBlink = R2DBlinkProperties & R2DBlinkComponent
