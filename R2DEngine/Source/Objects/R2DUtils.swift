//
//  R2DUtils.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public struct R2DUtils {
    
    /// Get CGPoint based on percentage of screen x: 0 - 1.0, y: 0 - 1.0
    public static func getX(x: CGFloat, y: CGFloat) -> CGPoint {
        let screenSize = UIScreen.mainScreen().bounds.size
        return CGPoint(x: screenSize.width * x, y: screenSize.height * y)
    }
    
    /// Get CGFloat based on percentage of screen x: 0 - 1.0
    public static func getX(x: CGFloat) -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width * x
    }
    
    /// Get CGFloat based on percentage of screen y: 0 - 1.0
    public static func getY(y: CGFloat) -> CGFloat {
        return UIScreen.mainScreen().bounds.size.height * y
    }
}