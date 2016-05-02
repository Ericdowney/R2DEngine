//
//  CGVectorExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

// MARK: - CGVector + - * / CGFloat

public func +(lhs: CGVector, rhs: CGFloat) -> CGVector {
    return CGVector(dx: lhs.dx + rhs, dy: lhs.dy + rhs)
}

public func -(lhs: CGVector, rhs: CGFloat) -> CGVector {
    return CGVector(dx: lhs.dx - rhs, dy: lhs.dy - rhs)
}

public func *(lhs: CGVector, rhs: CGFloat) -> CGVector {
    return CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
}

public func /(lhs: CGVector, rhs: CGFloat) -> CGVector {
    return CGVector(dx: lhs.dx / rhs, dy: lhs.dy / rhs)
}

// MARK: - CGVector += -= *= /= CGFloat

public func +=(inout lhs: CGVector, rhs: CGFloat) {
    lhs = CGVector(dx: lhs.dx + rhs, dy: lhs.dy + rhs)
}

public func -=(inout lhs: CGVector, rhs: CGFloat) {
    lhs = CGVector(dx: lhs.dx - rhs, dy: lhs.dy - rhs)
}

public func *=(inout lhs: CGVector, rhs: CGFloat) {
    lhs = CGVector(dx: lhs.dx * rhs, dy: lhs.dy * rhs)
}

public func /=(inout lhs: CGVector, rhs: CGFloat) {
    lhs = CGVector(dx: lhs.dx / rhs, dy: lhs.dy / rhs)
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

// MARK: - CGVector + - * / CGPoint

public func +(lhs: CGVector, rhs: CGPoint) -> CGVector {
    return CGVector(dx: lhs.dx + rhs.x, dy: lhs.dy + rhs.y)
}

public func -(lhs: CGVector, rhs: CGPoint) -> CGVector {
    return CGVector(dx: lhs.dx - rhs.x, dy: lhs.dy - rhs.y)
}

public func *(lhs: CGVector, rhs: CGPoint) -> CGVector {
    return CGVector(dx: lhs.dx * rhs.x, dy: lhs.dy * rhs.y)
}

public func /(lhs: CGVector, rhs: CGPoint) -> CGVector {
    return CGVector(dx: lhs.dx / rhs.x, dy: lhs.dy / rhs.y)
}

// MARK: - CGVector += -= *= /= CGPoint

public func +=(inout lhs: CGVector, rhs: CGPoint) {
    lhs = CGVector(dx: lhs.dx + rhs.x, dy: lhs.dy + rhs.y)
}

public func -=(inout lhs: CGVector, rhs: CGPoint) {
    lhs = CGVector(dx: lhs.dx - rhs.x, dy: lhs.dy - rhs.y)
}

public func *=(inout lhs: CGVector, rhs: CGPoint) {
    lhs = CGVector(dx: lhs.dx * rhs.x, dy: lhs.dy * rhs.y)
}

public func /=(inout lhs: CGVector, rhs: CGPoint) {
    lhs = CGVector(dx: lhs.dx / rhs.x, dy: lhs.dy / rhs.y)
}