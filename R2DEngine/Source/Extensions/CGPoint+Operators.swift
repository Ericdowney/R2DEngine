//
//  CGPointExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

// MARK: - CGPoint + - * / CGFloat

/// Add a CGFloat to the x and y values of a CGPoint
public func +(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x + rhs, y: lhs.y + rhs)
}

/// Subtract a CGFloat to the x and y values of a CGPoint
public func -(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x - rhs, y: lhs.y - rhs)
}

/// Multiply a CGFloat to the x and y values of a CGPoint
public func *(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

/// Divide a CGFloat to the x and y values of a CGPoint
public func /(lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    return CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}

// MARK: - CGPoint += -= *= /= CGFloat

/// Add a CGFloat to the x and y values of a CGPoint
public func +=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x + rhs, y: lhs.y + rhs)
}

/// Subtract a CGFloat from the x and y values of a CGPoint
public func -=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x - rhs, y: lhs.y - rhs)
}

/// Multiply the x and y values of a CGPoint by a CGFloat
public func *=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
}

/// Divide the x and y values of a CGPoint by a CGFloat
public func /=(inout lhs: CGPoint, rhs: CGFloat) {
    lhs = CGPoint(x: lhs.x / rhs, y: lhs.y / rhs)
}

// MARK: - Simple: a + b, a - b, etc

/// Add two CGPoints
public func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

/// Subtract two CGPoints
public func -(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

/// Multiply two CGPoints
public func *(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}

/// Divide two CGPoints
public func /(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    return CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
}

// MARK: - Inout: a += b, a -= b, etc

/// Add two CGPoints
public func +=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

/// Subtract two CGPoints
public func -=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
}

/// Multiply two CGPoints
public func *=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
}

/// Divide two CGPoints
public func /=(inout lhs: CGPoint, rhs: CGPoint) {
    lhs = CGPoint(x: lhs.x / rhs.x, y: lhs.y / rhs.y)
}

// MARK: - CGPoint + - * / CGVector

/// Add the dx and dy values of a CGVector to a CGPoint
public func +(lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
}

/// Subtract the dx and dy values of a CGVector from a CGPoint
public func -(lhs: CGPoint, rhs: CGVector) -> CGPoint {
    return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
}

/// Multiply the dx and dy values of a CGVector by the values of a CGPoint
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

