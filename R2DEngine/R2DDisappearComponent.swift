//
//  R2DDisappearPlatformComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DDisappearProperties {
    var fadeDuration: NSTimeInterval { get set }
    var numberOfBlinks: Int { get set }
    var blinkEndAction: (Void -> Void)? { get set }
}

public protocol R2DDisappearComponent {
    func disappear()
}

public extension R2DDisappearComponent where Self: SKNode, Self: R2DDisappearProperties {
    func disappear() {
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

public typealias R2DDisappear = protocol<R2DDisappearProperties, R2DDisappearComponent>