//
//  R2DAnchorPoint.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/17/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public enum R2DAnchorPoint {
    case Center
    case Left
    case Right
    case Top
    case Bottom
    case BottomLeft
    case BottomRight
    case TopLeft
    case TopRight
    
    public var value: CGPoint {
        switch self {
        case Center: return CGPoint(x: 0.5, y: 0.5)
        case Left: return CGPoint(x: 0.0, y: 0.5)
        case Right: return CGPoint(x: 0.5, y: 0.0)
        case Top: return CGPoint(x: 0.5, y: 1.0)
        case Bottom: return CGPoint(x: 0.5, y: 0.0)
        case BottomLeft: return CGPoint(x: 0.0, y: 0.0)
        case BottomRight: return CGPoint(x: 1.0, y: 0.0)
        case TopLeft: return CGPoint(x: 0.0, y: 1)
        case TopRight: return CGPoint(x: 1, y: 1)
        }
    }
}