//
//  R2DGameCenterComponent.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import GameKit

public protocol R2DGameCenterProperties: class {
    var r2d_gameCenterEnabled: Bool { get set }
    var r2d_gameCenterDefaultLeaderBoard: String? { get set }
}

public protocol R2DGameCenterComponent: GKGameCenterControllerDelegate {
    func authenticateLocalPlayer(viewController: UIViewController)
    func displayLeaderboard(viewController: UIViewController)
}

public extension R2DGameCenterComponent where Self: R2DGameCenterProperties {
    func authenticateLocalPlayer(viewController: UIViewController) {
        let localPlayer: GKLocalPlayer = GKLocalPlayer.localPlayer()
        
        localPlayer.authenticateHandler = { viewCtrl, err in
            guard let controller = viewCtrl else {
                self.r2d_gameCenterEnabled = false
                print(err)
                return
            }
            viewController.presentViewController(controller, animated: true, completion: nil)
            guard localPlayer.authenticated else {
                self.r2d_gameCenterEnabled = false
                print("Local player could not be authenticated, disabling game center")
                print(err)
                return
            }
            // 2 Player is already euthenticated & logged in, load game center
            self.r2d_gameCenterEnabled = true
            
            // Get the default leaderboard ID
            localPlayer.loadDefaultLeaderboardIdentifierWithCompletionHandler { leaderboardIdentifer, error in
                if error == nil {
                    self.r2d_gameCenterDefaultLeaderBoard = leaderboardIdentifer
                }
            }
        }
    }
    
    func displayLeaderboard(viewController: UIViewController) {
        let gcViewCtrl = GKGameCenterViewController()
        
        gcViewCtrl.viewState = .Leaderboards
        gcViewCtrl.leaderboardIdentifier = self.r2d_gameCenterDefaultLeaderBoard
        
        viewController.presentViewController(gcViewCtrl, animated: true, completion: nil)
    }
}

public typealias R2DGameCenter = protocol<R2DGameCenterProperties, R2DGameCenterComponent>
