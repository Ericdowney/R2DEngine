//
//  R2DEnums.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

/// Enum - Used to define a direction i.e. Left, Right, Up, Down
public enum R2DDirection {
    /// CGVector - (dx: -1.0, dy: 0.0)
    case left
    /// CGVector - (dx: 1.0, dy: 0.0)
    case right
    /// CGVector - (dx: 0.0, dy: 1.0)
    case up
    /// CGVector - (dx: 0.0, dy: -1.0)
    case down
    
    /// Get R2DDirection enum value as a CGVector
    public var vector: CGVector {
        switch self {
        case .left: return CGVector(dx: -1.0, dy: 0.0)
        case .right: return CGVector(dx: 1.0, dy: 0.0)
        case .up: return CGVector(dx: 0.0, dy: 1.0)
        case .down: return CGVector(dx: 0.0, dy: -1.0)
        }
    }
    
    /// Returns a random (Left or Right) R2DDirection
    public static var randomHorizontal: R2DDirection {
        if arc4random_uniform(2) == 0 {
            return .left
        }
        return .right
    }
    
    /// Returns a random (Up or Down) R2DDirection
    public static var randomVertical: R2DDirection {
        if arc4random_uniform(2) == 0 {
            return .up
        }
        return .down
    }
}
