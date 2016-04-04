//
//  UIColorExtensionTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/22/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class UIColorExtensionTests: QuickSpec {
    override func spec() {
        describe("UIColor") {
            
            it("should get a color based on values from 0...255.0") {
                let subject1 = UIColor.r2d_colorWithRed(255.0, green: 0.0, blue: 0.0, alpha: 1.0)
                let subject2 = UIColor.r2d_colorWithRed(0.0, green: 255.0, blue: 0.0, alpha: 1.0)
                let subject3 = UIColor.r2d_colorWithRed(0.0, green: 0.0, blue: 255.0, alpha: 1.0)
                
                expect(subject1).to(equal( UIColor.redColor() ))
                expect(subject2).to(equal( UIColor.greenColor() ))
                expect(subject3).to(equal( UIColor.blueColor() ))
            }
            
            it("should invert the current color") {
                let subject = UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
                let result = subject.r2dInverseColor
                
                expect(result).to(equal(UIColor.redColor()))
            }
        }
    }
}
