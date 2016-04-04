//
//  R2DEnums.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public enum R2DDirection {
    case Left,Right,Up,Down
    
    public var vector: CGVector {
        switch self {
        case .Left: return CGVector(dx: -1.0, dy: 0.0)
        case .Right: return CGVector(dx: 1.0, dy: 0.0)
        case .Up: return CGVector(dx: 0.0, dy: 1.0)
        case .Down: return CGVector(dx: 0.0, dy: -1.0)
        }
    }
}