//
//  R2DGameManager.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DGameManagerProperties {
    var hudManager: R2DHudManager { get }
    var gameHudName: String { get set }
    var pauseHudName: String { get set }
    var gameOverHudName: String { get set }
    var score: Int { get set }
}

public protocol R2DGameManagerComponent: SKPhysicsContactDelegate {
    func resumeGame()
    func pauseGame()
    func gameOver()
    func setupPhysicsWorld()
    func reset()
}

public extension R2DGameManagerComponent where Self: R2DGameManagerProperties, Self: SKScene {
    func resumeGame() {
        self.paused = false
        self.hudManager.switchToHud(self.gameHudName)
    }
    
    func pauseGame() {
        self.paused = true
        self.hudManager.switchToHud(self.pauseHudName)
    }
    
    func gameOver() {
        self.paused = true
        self.hudManager.switchToHud(self.gameOverHudName)
    }
    
    func setupPhysicsWorld() {
        self.physicsWorld.gravity = CGVectorMake(0,-9.8)
        self.physicsWorld.contactDelegate = self
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if let gameComponent = contact.bodyA.node as? R2DGameComponent {
            gameComponent.updateCollision(contact, gameManager: self)
        }
        if let gameComponent = contact.bodyB.node as? R2DGameComponent {
            gameComponent.updateCollision(contact, gameManager: self)
        }
    }
}

public typealias R2DGameManager = protocol<R2DGameManagerProperties, R2DGameManagerComponent>
