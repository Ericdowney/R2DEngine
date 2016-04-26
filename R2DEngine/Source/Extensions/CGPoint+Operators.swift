//
//  CGPointExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

// MARK: - CGPoint + - * / CGFloat

public func +(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x + rhs, y: lhs.y + rhs)
}

public func -(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x - rhs, y: lhs.y - rhs)
}

public func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

public func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}

// MARK: - CGPoint += -= *= /= CGFloat

public func +=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x + rhs, y: lhs.y + rhs)
}

public func -=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x - rhs, y: lhs.y - rhs)
}

public func *=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

public func /=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
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

// MARK: - CGPoint + - * / CGVector

public func +(lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
}

public func -(lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
}

public func *(lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x * rhs.dx, y: lhs.y * rhs.dy)
}

public func /(lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x / rhs.dx, y: lhs.y / rhs.dy)
}

// MARK: - CGPoint += -= *= /= CGVector

public func +=(inout lhs: CGPoint, rhs: CGVector) {
    lhs = CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
}

public func -=(inout lhs: CGPoint, rhs: CGVector) {
    lhs = CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
}

public func *=(inout lhs: CGPoint, rhs: CGVector) {
    lhs = CGPoint(x: lhs.x * rhs.dx, y: lhs.y * rhs.dy)
}

public func /=(inout lhs: CGPoint, rhs: CGVector) {
    lhs = CGPoint(x: lhs.x / rhs.dx, y: lhs.y / rhs.dy)
}

