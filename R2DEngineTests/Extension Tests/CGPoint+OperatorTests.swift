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
            it("should apply basic operators to CGPoint/CGFloat") {
                let subject1 = CGPoint(x: 10, y: 10)
                let subject2 = CGFloat(5)
                
                let result1 = subject1 + subject2
                let result2 = subject1 - subject2
                let result3 = subject1 * subject2
                let result4 = subject1 / subject2
                
                expect(result1).to(equal(CGPoint(x: 15, y: 15)))
                expect(result2).to(equal(CGPoint(x: 5, y: 5)))
                expect(result3).to(equal(CGPoint(x: 50, y: 50)))
                expect(result4).to(equal(CGPoint(x: 2, y: 2)))
            }
            
            it("should apply shorthand operators to CGPoint/CGFloat") {
                var subject1 = CGPoint(x: 10, y: 10)
                let subject2 = CGFloat(5)
                
                subject1 += subject2
                expect(subject1).to(equal(CGPoint(x: 15, y: 15)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 -= subject2
                expect(subject1).to(equal(CGPoint(x: 5, y: 5)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 *= subject2
                expect(subject1).to(equal(CGPoint(x: 50, y: 50)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 /= subject2
                expect(subject1).to(equal(CGPoint(x: 2, y: 2)))
                subject1 = CGPoint(x: 10, y: 10)
            }
            
            it("should apply basic operators to CGPoint/CGPoint") {
                let subject1 = CGPoint(x: 10, y: 10)
                let subject2 = CGPoint(x: 5, y: 5)
                
                let result1 = subject1 + subject2
                let result2 = subject1 - subject2
                let result3 = subject1 * subject2
                let result4 = subject1 / subject2
                
                expect(result1).to(equal(CGPoint(x: 15, y: 15)))
                expect(result2).to(equal(CGPoint(x: 5, y: 5)))
                expect(result3).to(equal(CGPoint(x: 50, y: 50)))
                expect(result4).to(equal(CGPoint(x: 2, y: 2)))
            }
            
            it("should apply shorthand operators to CGPoint/CGPoint") {
                var subject1 = CGPoint(x: 10, y: 10)
                let subject2 = CGPoint(x: 5, y: 5)
                
                subject1 += subject2
                expect(subject1).to(equal(CGPoint(x: 15, y: 15)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 -= subject2
                expect(subject1).to(equal(CGPoint(x: 5, y: 5)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 *= subject2
                expect(subject1).to(equal(CGPoint(x: 50, y: 50)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 /= subject2
                expect(subject1).to(equal(CGPoint(x: 2, y: 2)))
                subject1 = CGPoint(x: 10, y: 10)
            }
            
            it("should apply basic operators to CGPoint/CGVector") {
                let subject1 = CGPoint(x: 10, y: 10)
                let subject2 = CGVector(dx: 5, dy: 5)
                
                let result1 = subject1 + subject2
                let result2 = subject1 - subject2
                let result3 = subject1 * subject2
                let result4 = subject1 / subject2
                
                expect(result1).to(equal(CGPoint(x: 15, y: 15)))
                expect(result2).to(equal(CGPoint(x: 5, y: 5)))
                expect(result3).to(equal(CGPoint(x: 50, y: 50)))
                expect(result4).to(equal(CGPoint(x: 2, y: 2)))
            }
            
            it("should apply shorthand operators to CGPoint/CGVector") {
                var subject1 = CGPoint(x: 10, y: 10)
                let subject2 = CGVector(dx: 5, dy: 5)
                
                subject1 += subject2
                expect(subject1).to(equal(CGPoint(x: 15, y: 15)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 -= subject2
                expect(subject1).to(equal(CGPoint(x: 5, y: 5)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 *= subject2
                expect(subject1).to(equal(CGPoint(x: 50, y: 50)))
                subject1 = CGPoint(x: 10, y: 10)
                
                subject1 /= subject2
                expect(subject1).to(equal(CGPoint(x: 2, y: 2)))
                subject1 = CGPoint(x: 10, y: 10)
            }
        }
    }
}
