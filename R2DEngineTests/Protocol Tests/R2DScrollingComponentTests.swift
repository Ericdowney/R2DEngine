//
//  R2DScrollingComponentTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 4/15/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class R2DScrollingComponentTests: QuickSpec {
    
    fileprivate class ScrollingNode: SKNode, R2DScrolling {
        var scrollDirection: R2DDirection = .left
        var scrollSpeed: CGFloat = 2.0
    }
    
    override func spec() {
        describe("R2DScrollingComponentTests") {
            
            var subject: ScrollingNode!
            
            beforeEach {
                subject = ScrollingNode()
            }
            
            context("Property Extension") {
                it("should calculate the delta") {
                    let result = subject.scrollDelta
                    
                    expect(result).to(equal(CGVector(dx: -2.0, dy: 0.0)))
                }
                
                it("should return a scroll action") {
                    let result = subject.scrollAction
                    
                    expect(result.duration).to(beCloseTo(1.0/60.0))
                }
            }
        }
    }
}
