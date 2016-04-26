//
//  CGPointExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public extension CGPoint {
    public func r2d_addVector(vector: CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }
}

// MARK: - Simple: a + b, a - b, etc

public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

public func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}

public func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
}

// MARK: - Inout: a += b, a -= b, etc

public func +=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

public func -=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

public func *=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}

public func /=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
}