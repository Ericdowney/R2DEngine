//
//  R2DHudManager.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol R2DHudManagerProperties {
    var hudComponents: [R2DHud] { get set }
}

public protocol R2DHudManagerComponent {
    mutating func registerComponent(_ component: R2DHud)
    func initialize<T: SKScene>(_ gameManager: T) -> [R2DHud] where T: R2DGameManager
    func showHud(by name: String) -> R2DHud?
    func hideHud(by name: String) -> R2DHud?
    func getHud(by name: String) -> R2DHud?
    func hudsExcept(_ name: String) -> [R2DHud]
    func switchToHud(by name: String)
}

public extension R2DHudManagerComponent where Self: R2DHudManagerProperties {
    mutating func registerComponent(_ component: R2DHud) {
        hudComponents.append(component)
    }
    
    func initialize<T: SKScene>(_ gameManager: T) -> [R2DHud] where T: R2DGameManager {
        hudComponents.forEach {
            $0.initialize(gameManager)
        }
        return hudComponents
    }
    
    func showHud(by name: String) -> R2DHud? {
        var hud: R2DHud? = getHud(by: name)
        hud?.show()
        return hud
    }
    
    func hideHud(by name: String) -> R2DHud? {
        var hud: R2DHud? = getHud(by: name)
        hud?.hide()
        return hud
    }
    
    func getHud(by name: String) -> R2DHud? {
        return hudComponents.first { $0.hudName == name }
    }
    
    func hudsExcept(_ name: String) -> [R2DHud] {
        return hudComponents.filter { $0.hudName != name }
    }
    
    func switchToHud(_ name: String) {
        for var hud in hudComponents {
            hud.hide()
            if hud.hudName == name {
                hud.show()
            }
        }
    }
}

public typealias R2DHudManager = R2DHudManagerProperties & R2DHudManagerComponent
