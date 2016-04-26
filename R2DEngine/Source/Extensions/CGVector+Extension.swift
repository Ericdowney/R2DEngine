//
//  CGVectorExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public extension CGVector {
    public func r2d_multiplyBy(amount: CGFloat) -> CGVector {
        return CGVector(dx: self.dx * amount, dy: self.dy * amount)
    }
}

// MARK: - Simple: a + b, a - b, etc

public func +(lhs: CGVector, rhs: CGVector) -> CGVector {
    return CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
}

public func -(lhs: CGVector, rhs: CGVector) -> CGVector {
    return CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
}

public func *(lhs: CGVector, rhs: CGVector) -> CGVector {
    return CGVector(dx: lhs.dx * rhs.dx, dy: lhs.dy * rhs.dy)
}

public func /(lhs: CGVector, rhs: CGVector) -> CGVector {
    return CGVector(dx: lhs.dx / rhs.dx, dy: lhs.dy / rhs.dy)
}

// MARK: - Inout: a += b, a -= b, etc

public func +=(inout lhs: CGVector, rhs: CGVector) {
    lhs = CGVector(dx: lhs.dx + rhs.dx, dy: lhs.dy + rhs.dy)
}

public func -=(inout lhs: CGVector, rhs: CGVector) {
    lhs = CGVector(dx: lhs.dx - rhs.dx, dy: lhs.dy - rhs.dy)
}

public func *=(inout lhs: CGVector, rhs: CGVector) {
    lhs = CGVector(dx: lhs.dx * rhs.dx, dy: lhs.dy * rhs.dy)
}

public func /=(inout lhs: CGVector, rhs: CGVector) {
    lhs = CGVector(dx: lhs.dx / rhs.dx, dy: lhs.dy / rhs.dy)
}