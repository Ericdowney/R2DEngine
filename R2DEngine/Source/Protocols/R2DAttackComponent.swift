//
//  R2DAttackComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/19/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

/// The properties for the R2DAttackComponent protocol
public protocol R2DAttackProperties {
    associatedtype Prey: SKSpriteNode
    /// The prey the attack component will look for and attack. Type is an associatedtype that must derive from SKSpriteNode
    weak var prey: Prey? { get set }
}

/// A protocol for creating a class that can attack a specified prey
public protocol R2DAttackComponent {
    /**
     Starts the process of looking for a prey
     
     - Parameter direction: The direction to look for a prey (Left || Right) or (Up || Down)
     */
    func startLookingForPrey(direction: R2DDirection)
    
    /**
     The function that should be called once a prey is found
     */
    func foundPrey()
    
    /**
     The function that will be responsible for attacking the prey
     */
    func attack()
}

extension R2DAttackComponent where Self: R2DAttackProperties, Self: SKSpriteNode {
    /**
     Default Implementation - Starts the process of looking for a prey
     
     - The default implementation starts an SKAction sequence that looks for a specified prey with the given direction. The sequence waits 0.35 seconds with a random +/- of 0.25.
     */
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
    
    /**
     Default Implementation - The function that should be called once a prey is found
     
     - The default implementation removes all actions started by 'startLookingForPrey:' and calls attack
     */
    public func foundPrey() {
        self.removeAllActions()
        self.attack()
    }
}

public typealias R2DAttack = protocol<R2DAttackProperties, R2DAttackComponent>