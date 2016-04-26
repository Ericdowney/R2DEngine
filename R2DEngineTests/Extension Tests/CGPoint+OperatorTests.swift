//
//  CGPointExtensionTests.swift
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

class CGPointExtensionTests: QuickSpec {
    override func spec() {
        describe("CGPoint") {
            it("should add a CGVector appropriately") {
                let subject = CGPoint(x: 10.5, y: 30.3)
                let vec = CGVector(dx: 205.0, dy: 283.0)
                
                let result = subject + vec
                
                expect(result.x).to(equal( 215.5 ))
                expect(result.y).to(equal( 313.3 ))
            }
        }
    }
}
