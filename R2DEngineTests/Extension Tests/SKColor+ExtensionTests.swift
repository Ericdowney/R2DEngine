//
//  SKColorExtensionTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/22/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class SKColorExtensionTests: QuickSpec {
    override func spec() {
        describe("SKColor") {
            
            it("should get a color based on values from 0...255.0") {
                let subject1 = SKColor.r2d_colorWithRed(255.0, green: 0.0, blue: 0.0, alpha: 1.0)
                let subject2 = SKColor.r2d_colorWithRed(0.0, green: 255.0, blue: 0.0, alpha: 1.0)
                let subject3 = SKColor.r2d_colorWithRed(0.0, green: 0.0, blue: 255.0, alpha: 1.0)
                
                expect(subject1).to(equal( SKColor.red ))
                expect(subject2).to(equal( SKColor.green ))
                expect(subject3).to(equal( SKColor.blue ))
            }
            
            it("should invert the current color") {
                let subject = SKColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
                let result = subject.r2dInverseColor
                
                expect(result).to(equal(SKColor.red))
            }
        }
    }
}
