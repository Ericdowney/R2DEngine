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
}

public protocol R2DGameManagerComponent: SKPhysicsContactDelegate {
    func resumeGame()
    func pauseGame()
    func gameOver()
    func setupPhysicsWorld()
}

public extension R2DGameManagerComponent where Self: R2DGameManagerProperties, Self: SKScene {
    public func resumeGame() {
        self.paused = false
        self.hudManager.showHud(self.pauseHudName)
    }
    
    public func pauseGame() {
        self.paused = true
        self.hudManager.showHud(self.gameHudName)
    }
    
    public func gameOver() {
        self.paused = true
        self.hudManager.showHud(self.gameOverHudName)
    }
    
    func setupPhysicsWorld() {
        self.physicsWorld.gravity = CGVectorMake(0,-9.8)
        self.physicsWorld.contactDelegate = self
    }
}

public typealias R2DGameManager = protocol<R2DGameManagerProperties, R2DGameManagerComponent>