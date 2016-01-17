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
    mutating func registerComponent(component: R2DHud)
    func initialize<T: SKScene where T: R2DGameManager>(gameManager: T) -> [R2DHud]
    func showHud(name: String) -> R2DHud?
    func hideHud(name: String) -> R2DHud?
    func getHud(name: String) -> R2DHud?
    func switchToHud(name: String)
}

public extension R2DHudManagerComponent where Self: R2DHudManagerProperties {
    mutating func registerComponent(component: R2DHud) {
        self.hudComponents.append(component)
    }
    
    func initialize<T: SKScene where T: R2DGameManager>(gameManager: T) -> [R2DHud] {
        self.hudComponents.forEach {
            $0.initialize(gameManager)
        }
        return self.hudComponents
    }
    
    func showHud(name: String) -> R2DHud? {
        var hud: R2DHud? = self.hudComponents.filter { $0.hudName == name }[0]
        hud?.show()
        return hud
    }
    
    func hideHud(name: String) -> R2DHud? {
        var hud: R2DHud? = self.hudComponents.filter { $0.hudName == name }[0]
        hud?.hide()
        return hud
    }
    
    func getHud(name: String) -> R2DHud? {
        return self.hudComponents.filter { $0.hudName == name }[0]
    }
    
    func switchToHud(name: String) {
        for var i in self.hudComponents {
            i.hide()
            if i.hudName == name {
                i.show()
            }
        }
    }
}

public typealias R2DHudManager = protocol<R2DHudManagerProperties, R2DHudManagerComponent>
