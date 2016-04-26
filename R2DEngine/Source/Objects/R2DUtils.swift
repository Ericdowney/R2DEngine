//
//  R2DUtils.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public struct R2DUtils {
    
    public static var r2dScreenSize: CGSize {
        return UIScreen.mainScreen().bounds.size
    }
    
    public static var r2dScreenWidth: CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    public static var r2dScreenHeight: CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    /// Get CGPoint based on percentage of screen x: 0 - 1.0, y: 0 - 1.0
    public static func getX(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: R2DUtils.r2dScreenSize.width * x, y: R2DUtils.r2dScreenSize.height * y)
    }
    
    /// Get CGFloat based on percentage of screen x: 0 - 1.0
    public static func getX(x: CGFloat) -> CGFloat {
        return R2DUtils.r2dScreenWidth * x
    }
    
    /// Get CGFloat based on percentage of screen y: 0 - 1.0
    public static func getY(y: CGFloat) -> CGFloat {
        return R2DUtils.r2dScreenHeight * y
    }
}