//
//  Int+Extension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 4/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public extension IntegerLiteralType {
    func r2d_times(@noescape action: Void -> Void) {
        for _ in 0..<self {
            action()
        }
    }
}