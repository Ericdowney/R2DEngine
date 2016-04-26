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
    func startLookingForPrey(direction: R2DDirection)
    func foundPrey()
    func attack()
}

extension R2DAttackComponent where Self: R2DAttackProperties, Self: SKSpriteNode {
    public func startLookingForPrey(direction: R2DDirection) {
        self.runAction( SKAction.repeatActionForever(SKAction.sequence([
            SKAction.runBlock { [unowned self] in
                self.lookForPrey(direction)
            },
            SKAction.waitForDuration(0.35, withRange: 0.25)
        ])) )
    }
    
    func lookForPrey(direction: R2DDirection) {
        guard let aPrey = self.prey else { return }
        if (direction == .Left || direction == .Right) && self.checkLeftRight(aPrey) {
            self.foundPrey()
        }
        
        if (direction == .Up || direction == .Down) && self.checkUpDown(aPrey) {
            self.foundPrey()
        }
    }
    
    private func checkLeftRight(prey: Prey) -> Bool {
        switch prey.position.x {
            case self.r2d_leftX...self.r2d_rightX:
                return true
            default:
                return false
        }
    }
    
    private func checkUpDown(prey: Prey) -> Bool {
        switch prey.position.y {
        case self.r2d_bottomY...self.r2d_topY:
            return true
        default:
            return false
        }
    }
    
    public func foundPrey() {
        self.removeAllActions()
        self.attack()
    }
}

public typealias R2DAttack = protocol<R2DAttackProperties, R2DAttackComponent>