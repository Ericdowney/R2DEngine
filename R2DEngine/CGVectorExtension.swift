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