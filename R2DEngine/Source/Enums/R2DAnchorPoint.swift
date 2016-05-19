//
//  R2DAnchorPoint.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

/// Enum - Used to set Sprite Node anchor point
public enum R2DAnchorPoint {
    /// CGPoint - (x: 0.5, y: 0.5)
    case Center
    /// CGPoint - (x: 0.0, y: 0.5)
    case Left
    /// CGPoint - (x: 1.0, y: 0.5)
    case Right
    /// CGPoint - (x: 0.5, y: 1.0)
    case Top
    /// CGPoint - (x: 0.5, y: 0.0)
    case Bottom
    /// CGPoint - (x: 0.0, y: 0.0)
    case BottomLeft
    /// CGPoint - (x: 1.0, y: 0.0)
    case BottomRight
    /// CGPoint - (x: 0.0, y: 1.0)
    case TopLeft
    /// CGPoint - (x: 1.0, y: 1.0)
    case TopRight
    /// CGPoint - CGPointZero
    case None
    
    /// Get R2DAnchorPoint enum value as a CGPoint
    public var value: CGPoint {
        switch self {
        case Center: return CGPoint(x: 0.5, y: 0.5)
        case Left: return CGPoint(x: 0.0, y: 0.5)
        case Right: return CGPoint(x: 1.0, y: 0.5)
        case Top: return CGPoint(x: 0.5, y: 1.0)
        case Bottom: return CGPoint(x: 0.5, y: 0.0)
        case BottomLeft: return CGPoint(x: 0.0, y: 0.0)
        case BottomRight: return CGPoint(x: 1.0, y: 0.0)
        case TopLeft: return CGPoint(x: 0.0, y: 1.0)
        case TopRight: return CGPoint(x: 1.0, y: 1.0)
        default:
            return CGPointZero
        }
    }
    
    /**
     Returns an R2DAnchorPoint from a CGPoint. Returns R2DAnchorPoint.None if not a valid R2DAnchorPoint representation
     
     - Parameter point: The CGPoint used to get the R2DAnchorPoint representation
     
     - Returns: Self
     */
    public static func fromCGPoint(point: CGPoint) -> R2DAnchorPoint {
        switch point {
        case CGPoint(x: 0.5, y: 0.5):
            return .Center
        case CGPoint(x: 0.0, y: 0.5):
            return .Left
        case CGPoint(x: 1.0, y: 0.5):
            return .Right
        case CGPoint(x: 0.5, y: 1.0):
            return .Top
        case CGPoint(x: 0.5, y: 0.0):
            return .Bottom
        case CGPoint(x: 0.0, y: 0.0):
            return .BottomLeft
        case CGPoint(x: 1.0, y: 0.0):
            return .BottomRight
        case CGPoint(x: 0.0, y: 1.0):
            return .TopLeft
        case CGPoint(x: 1.0, y: 1.0):
            return .TopRight
        default:
            return .None
        }
    }
}