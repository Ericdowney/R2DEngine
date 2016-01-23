//
//  CGVectorExtensionTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/22/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import XCTest
import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class CGVectorExtensionTests: QuickSpec {
    override func spec() {
        describe("CGVector") {
            it("should multiply a CGVector by an amount appropriately") {
                let subject = CGVector(dx: 11.0, dy: 4.0)
                
                let result = subject.r2d_multiplyBy(3)
                
                expect(result.dx).to(equal( 33.0 ))
                expect(result.dy).to(equal( 12.0 ))
            }
        }
    }
}