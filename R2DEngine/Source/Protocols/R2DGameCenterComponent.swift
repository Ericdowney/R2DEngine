//
//  R2DGameCenterComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import GameKit

public protocol R2DGameCenterProperties: class {
    var gameCenterEnabled: Bool { get set }
    var gameCenterDefaultLeaderBoard: String? { get set }
}

public protocol R2DGameCenterComponent: GKGameCenterControllerDelegate {
    func authenticateLocalPlayer(_ viewController: UIViewController)
    func displayLeaderboard(_ viewController: UIViewController)
}

public extension R2DGameCenterComponent where Self: R2DGameCenterProperties {
    func authenticateLocalPlayer(_ viewController: UIViewController) {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        func defaultLeaderboardHandler(with identifier: String?, andError error: Error?) {
            if error == nil {
                gameCenterDefaultLeaderBoard = identifier
            }
        }
        
        func handler(with viewCtrl: UIViewController?, andError err: Error?) {
            guard let controller = viewCtrl else {
                gameCenterEnabled = false
                print(err as Any)
                return
            }
            viewController.present(controller, animated: true, completion: nil)
            guard localPlayer.isAuthenticated else {
                gameCenterEnabled = false
                print("Local player could not be authenticated, disabling game center")
                print(err as Any)
                return
            }
            // 2 Player is already euthenticated & logged in, load game center
            gameCenterEnabled = true
            
            // Get the default leaderboard ID
            localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: defaultLeaderboardHandler)
        }
        
        localPlayer.authenticateHandler = handler
    }
    
    func displayLeaderboard(_ viewController: UIViewController) {
        let gcViewCtrl = GKGameCenterViewController()
        
        gcViewCtrl.viewState = .leaderboards
        gcViewCtrl.leaderboardIdentifier = gameCenterDefaultLeaderBoard
        
        viewController.present(gcViewCtrl, animated: true, completion: nil)
    }
}

public typealias R2DGameCenter = R2DGameCenterProperties & R2DGameCenterComponent
