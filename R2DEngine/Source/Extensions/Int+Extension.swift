//
//  Int+Extension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 4/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public extension Int {
    /**
     Ruby-esk loop.
     
     - Parameter loop: The closure used to loop n times
     */
    func r2d_times(_ loop: (Void) -> Void) {
        for _ in 0..<self {
            loop()
        }
    }
}
