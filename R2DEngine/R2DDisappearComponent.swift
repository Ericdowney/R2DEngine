//
//  R2DDisappearPlatformComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DBlinkProperties {
    var fadeDuration: NSTimeInterval { get set }
    var numberOfBlinks: Int { get set }
    var blinkEndAction: (Void -> Void)? { get set }
}

public protocol R2DBlinkComponent {
    func blink()
}

public extension R2DBlinkComponent where Self: SKNode, Self: R2DBlinkProperties {
    func blink() {
        var sequence: [SKAction] = []
        for _ in 0..<numberOfBlinks {
            sequence.append(self.blinkAction())
        }
        sequence.append(SKAction.runBlock {
            self.blinkEndAction?()
        })
        
        self.runAction(SKAction.sequence(sequence))
    }
    
    private func blinkAction() -> SKAction {
        return SKAction.sequence([
            SKAction.fadeOutWithDuration(fadeDuration),
            SKAction.waitForDuration(0.05),
            SKAction.fadeInWithDuration(fadeDuration)
        ])
    }
}

public typealias R2DBlink = protocol<R2DBlinkProperties, R2DBlinkComponent>