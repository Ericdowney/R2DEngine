//
//  R2DGameManager.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DGameManagerProperties {
    associatedtype Hud: R2DHudManager
    var hudManager: Hud { get }
    var gameHudName: String { get set }
    var pauseHudName: String { get set }
    var gameOverHudName: String { get set }
    var score: Int { get set }
}

public protocol R2DGameManagerComponent: SKPhysicsContactDelegate {
    func startGame()
    func resumeGame()
    func pauseGame()
    func gameOver()
    func setupPhysicsWorld()
    func reset()
}

public extension R2DGameManagerComponent where Self: R2DGameManagerProperties, Self: SKScene {
    func resumeGame() {
        isPaused = false
        hudManager.switchToHud(gameHudName)
    }
    
    func pauseGame() {
        isPaused = true
        hudManager.switchToHud(pauseHudName)
    }
    
    func gameOver() {
        isPaused = true
        hudManager.switchToHud(gameOverHudName)
    }
    
    func setupPhysicsWorld() {
        physicsWorld.gravity = CGVector(dx: 0,dy: -9.8)
        physicsWorld.contactDelegate = self
    }
    
    /**
     This is to get around delegate method for SKPhysicsContactDelegate
        - didBeginContact
     Delegate methods can not have default values from Protocol Extensions.
     **/
    func beginPhysicsContact(_ contact: SKPhysicsContact) {
        if let gameComponent = contact.bodyA.node as? R2DGameComponent {
            gameComponent.updateCollision(with: contact, andGameManager: self)
        }
        if let gameComponent = contact.bodyB.node as? R2DGameComponent {
            gameComponent.updateCollision(with: contact, andGameManager: self)
        }
    }
}

public typealias R2DGameManager = R2DGameManagerProperties & R2DGameManagerComponent
