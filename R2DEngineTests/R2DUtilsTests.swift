//
//  R2DUtilsTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 12/6/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class R2DUtilsTests: QuickSpec {
    
    class MockScreenMember: ScreenMember {
        var size: CGSize = CGSize(width: 10, height: 15)
    }
    
    override func spec() {
        describe("R2DUtilsTests") {
            
            var mockScreen: MockScreenMember!
            
            beforeEach {
                mockScreen = MockScreenMember()
                R2DUtils.screen = mockScreen
            }
            
            describe("Screen Size") {
                it("should return the size") {
                    let result = R2DUtils.screenSize
                    
                    expect(result).to(equal(mockScreen.size))
                }
                
                it("should return the width") {
                    let result = R2DUtils.screenWidth
                    
                    expect(result).to(equal(mockScreen.size.width))
                }
                
                it("should return the height") {
                    let result = R2DUtils.screenHeight
                    
                    expect(result).to(equal(mockScreen.size.height))
                }
            }
            
            describe("When Calculating Coordinates") {
                it("should return the correct X and Y coordinates") {
                    let result = R2DUtils.get(X: 0.25, Y: 0.75)
                    
                    let expectedResult = CGPoint(x: mockScreen.size.width * 0.25, y: mockScreen.size.height * 0.75)
                    expect(result).to(equal(expectedResult))
                }
                
                it("should return the correct X coordinate") {
                    let result = R2DUtils.get(X: 0.35)
                    
                    let expectedResult = mockScreen.size.width * 0.35
                    expect(result).to(equal(expectedResult))
                }
                
                it("should return the correct Y coordinate") {
                    let result = R2DUtils.get(Y: 0.75)
                    
                    let expectedResult = mockScreen.size.height * 0.75
                    expect(result).to(equal(expectedResult))
                }
            }
        }
    }
}
