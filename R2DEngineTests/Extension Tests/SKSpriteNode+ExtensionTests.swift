//
//  SKSpriteNodeExtensionTests.swift
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

class SKSpriteNodeExtensionTests: QuickSpec {
    override func spec() {
        
        describe("SKSpriteNode") {
            it("should set anchor point based on enum value") {
                let subject = SKSpriteNode()
                
                subject.r2d_setAnchor(.BottomLeft)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 0.0, y: 0.0) ))
                
                subject.r2d_setAnchor(.BottomRight)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 1.0, y: 0.0) ))
                
                subject.r2d_setAnchor(.TopLeft)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 0.0, y: 1.0) ))
                
                subject.r2d_setAnchor(.TopRight)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 1.0, y: 1.0) ))
                
                subject.r2d_setAnchor(.Center)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 0.5, y: 0.5) ))
                
                subject.r2d_setAnchor(.Right)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 1.0, y: 0.5) ))
                
                subject.r2d_setAnchor(.Left)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 0.0, y: 0.5) ))
                
                subject.r2d_setAnchor(.Top)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 0.5, y: 1.0) ))
                
                subject.r2d_setAnchor(.Bottom)
                expect(subject.anchorPoint).to(equal( CGPoint(x: 0.5, y: 0.0) ))
            }
            
            it("should calculate lhs x value based on the anchor point") {
                let container = SKNode()
                let subject = SKSpriteNode(texture: nil, color: .clearColor(), size: CGSize(width: 10, height: 10))
                subject.position = CGPoint(x: 100, y: 100)
                container.addChild(subject)
                
                let result1 = subject.r2d_leftX
                
                expect(result1).to(equal( 95 ))
                
                subject.anchorPoint = R2DAnchorPoint.Left.value
                
                let result2 = subject.r2d_leftX
                
                expect(result2).to(equal( 100 ))
                
                subject.anchorPoint = R2DAnchorPoint.Right.value
                
                let result3 = subject.r2d_leftX
                
                expect(result3).to(equal( 90 ))
            }
            
            it("should calculate rhs x value") {
                let container = SKNode()
                let subject = SKSpriteNode(texture: nil, color: .clearColor(), size: CGSize(width: 10, height: 10))
                subject.position = CGPoint(x: 100, y: 100)
                container.addChild(subject)
                
                let result1 = subject.r2d_rightX
                
                expect(result1).to(equal( 105 ))
                
                subject.anchorPoint = R2DAnchorPoint.Left.value
                
                let result2 = subject.r2d_rightX
                
                expect(result2).to(equal( 110 ))
                
                subject.anchorPoint = R2DAnchorPoint.Right.value
                
                let result3 = subject.r2d_rightX
                
                expect(result3).to(equal( 100 ))
            }
            
            it("should calculate top y value") {
                let container = SKNode()
                let subject = SKSpriteNode(texture: nil, color: .clearColor(), size: CGSize(width: 10, height: 10))
                subject.position = CGPoint(x: 100, y: 100)
                container.addChild(subject)
                
                let result1 = subject.r2d_topY
                
                expect(result1).to(equal( 105 ))
                
                subject.anchorPoint = R2DAnchorPoint.Bottom.value
                
                let result2 = subject.r2d_topY
                
                expect(result2).to(equal( 110 ))
                
                subject.anchorPoint = R2DAnchorPoint.Top.value
                
                let result3 = subject.r2d_topY
                
                expect(result3).to(equal( 100 ))
            }
            
            it("should calculate bottom y value") {
                let container = SKNode()
                let subject = SKSpriteNode(texture: nil, color: .clearColor(), size: CGSize(width: 10, height: 10))
                subject.position = CGPoint(x: 100, y: 100)
                container.addChild(subject)
                
                let result1 = subject.r2d_bottomY
                
                expect(result1).to(equal( 95 ))
                
                subject.anchorPoint = R2DAnchorPoint.Bottom.value
                
                let result2 = subject.r2d_bottomY
                
                expect(result2).to(equal( 100 ))
                
                subject.anchorPoint = R2DAnchorPoint.Top.value
                
                let result3 = subject.r2d_bottomY
                
                expect(result3).to(equal( 90 ))
            }
        }
    }
}