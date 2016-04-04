//
//  R2DAttackComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/19/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DAttackProperties {
    associatedtype Prey: SKSpriteNode
    weak var prey: Prey? { get set }
}

public protocol R2DAttackComponent {
    func startLookingForPrey()
    func foundPrey()
    func attack()
}

extension R2DAttackComponent where Self: R2DAttackProperties, Self: SKSpriteNode {
    public func startLookingForPrey() {
        self.runAction( SKAction.repeatActionForever(SKAction.sequence([
            SKAction.runBlock {
                guard let aPrey = self.prey else { return }
                switch aPrey.position.x {
                case self.r2d_leftX...self.r2d_rightX:
                    self.foundPrey()
                default:
                    break
                }
            },
            SKAction.waitForDuration(0.35, withRange: 0.25)
        ])) )
    }
    
    public func foundPrey() {
        self.removeAllActions()
        self.attack()
    }
}

public typealias R2DAttack = protocol<R2DAttackProperties, R2DAttackComponent>