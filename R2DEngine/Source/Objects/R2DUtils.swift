//
//  R2DUtils.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

/// A Collection of static functions to help interact with the UIScreen.mainScreen() and Coordinate System
public struct R2DUtils {
    
    /// UIScreen - Main Screen - Size
    public static var screenSize: CGSize {
        return UIScreen.main.bounds.size
    }
    
    /// UIScreen - Main Screen - Width
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    /// UIScreen - Main Screen - Height
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    /// Get CGPoint based on percentage of screen x: 0 - 1.0, y: 0 - 1.0
    public static func getX(_ x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: R2DUtils.screenSize.width * x, y: R2DUtils.screenSize.height * y)
    }
    
    /// Get CGFloat based on percentage of screen x: 0 - 1.0
    public static func getX(_ x: CGFloat) -> CGFloat {
        return R2DUtils.screenWidth * x
    }
    
    /// Get CGFloat based on percentage of screen y: 0 - 1.0
    public static func getY(_ y: CGFloat) -> CGFloat {
        return R2DUtils.screenHeight * y
    }
}
