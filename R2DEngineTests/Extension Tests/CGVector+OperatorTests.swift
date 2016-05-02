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
            it("should apply basic operators to CGVector/CGFloat") {
                let subject1 = CGVector(dx: 10, dy: 10)
                let subject2 = CGFloat(5)
                
                let result1 = subject1 + subject2
                let result2 = subject1 - subject2
                let result3 = subject1 * subject2
                let result4 = subject1 / subject2
                
                expect(result1).to(equal(CGVector(dx: 15, dy: 15)))
                expect(result2).to(equal(CGVector(dx: 5, dy: 5)))
                expect(result3).to(equal(CGVector(dx: 50, dy: 50)))
                expect(result4).to(equal(CGVector(dx: 2, dy: 2)))
            }
            
            it("should apply shorthand operators to CGVector/CGFloat") {
                var subject1 = CGVector(dx: 10, dy: 10)
                let subject2 = CGFloat(5)
                
                subject1 += subject2
                expect(subject1).to(equal(CGVector(dx: 15, dy: 15)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 -= subject2
                expect(subject1).to(equal(CGVector(dx: 5, dy: 5)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 *= subject2
                expect(subject1).to(equal(CGVector(dx: 50, dy: 50)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 /= subject2
                expect(subject1).to(equal(CGVector(dx: 2, dy: 2)))
                subject1 = CGVector(dx: 10, dy: 10)
            }
            
            it("should apply basic operators to CGVector/CGVector") {
                let subject1 = CGVector(dx: 10, dy: 10)
                let subject2 = CGVector(dx: 5, dy: 5)
                
                let result1 = subject1 + subject2
                let result2 = subject1 - subject2
                let result3 = subject1 * subject2
                let result4 = subject1 / subject2
                
                expect(result1).to(equal(CGVector(dx: 15, dy: 15)))
                expect(result2).to(equal(CGVector(dx: 5, dy: 5)))
                expect(result3).to(equal(CGVector(dx: 50, dy: 50)))
                expect(result4).to(equal(CGVector(dx: 2, dy: 2)))
            }
            
            it("should apply shorthand operators to CGVector/CGVector") {
                var subject1 = CGVector(dx: 10, dy: 10)
                let subject2 = CGVector(dx: 5, dy: 5)
                
                subject1 += subject2
                expect(subject1).to(equal(CGVector(dx: 15, dy: 15)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 -= subject2
                expect(subject1).to(equal(CGVector(dx: 5, dy: 5)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 *= subject2
                expect(subject1).to(equal(CGVector(dx: 50, dy: 50)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 /= subject2
                expect(subject1).to(equal(CGVector(dx: 2, dy: 2)))
                subject1 = CGVector(dx: 10, dy: 10)
            }
            
            it("should apply basic operators to CGVector/CGPoint") {
                let subject1 = CGVector(dx: 10, dy: 10)
                let subject2 = CGPoint(x: 5, y: 5)
                
                let result1 = subject1 + subject2
                let result2 = subject1 - subject2
                let result3 = subject1 * subject2
                let result4 = subject1 / subject2
                
                expect(result1).to(equal(CGVector(dx: 15, dy: 15)))
                expect(result2).to(equal(CGVector(dx: 5, dy: 5)))
                expect(result3).to(equal(CGVector(dx: 50, dy: 50)))
                expect(result4).to(equal(CGVector(dx: 2, dy: 2)))
            }
            
            it("should apply shorthand operators to CGVector/CGPoint") {
                var subject1 = CGVector(dx: 10, dy: 10)
                let subject2 = CGPoint(x: 5, y: 5)
                
                subject1 += subject2
                expect(subject1).to(equal(CGVector(dx: 15, dy: 15)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 -= subject2
                expect(subject1).to(equal(CGVector(dx: 5, dy: 5)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 *= subject2
                expect(subject1).to(equal(CGVector(dx: 50, dy: 50)))
                subject1 = CGVector(dx: 10, dy: 10)
                
                subject1 /= subject2
                expect(subject1).to(equal(CGVector(dx: 2, dy: 2)))
                subject1 = CGVector(dx: 10, dy: 10)
            }
        }
    }
}