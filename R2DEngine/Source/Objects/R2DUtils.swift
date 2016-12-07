//
//  R2DUtils.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/16/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public protocol ScreenMember {
    var size: CGSize { get }
}

extension UIScreen: ScreenMember {
    public var size: CGSize {
        return UIScreen.main.bounds.size
    }
}

/// A Collection of static functions to help interact with the UIScreen.main and Coordinate System
public struct R2DUtils {
    
    static var screen: ScreenMember = UIScreen.main
    
    /// UIScreen - Main Screen - Size
    public static var screenSize: CGSize {
        return screen.size
    }
    
    /// UIScreen - Main Screen - Width
    public static var screenWidth: CGFloat {
        return screen.size.width
    }
    
    /// UIScreen - Main Screen - Height
    public static var screenHeight: CGFloat {
        return screen.size.height
    }
    
    /// Get CGPoint based on percentage of screen x: 0 - 1.0, y: 0 - 1.0
    public static func get(X x: CGFloat, Y y: CGFloat) -> CGPoint {
        return CGPoint(x: screenSize.width * x, y: screenSize.height * y)
    }
    
    /// Get CGFloat based on percentage of screen x: 0 - 1.0
    public static func get(X x: CGFloat) -> CGFloat {
        return screenWidth * x
    }
    
    /// Get CGFloat based on percentage of screen y: 0 - 1.0
    public static func get(Y y: CGFloat) -> CGFloat {
        return screenHeight * y
    }
}
