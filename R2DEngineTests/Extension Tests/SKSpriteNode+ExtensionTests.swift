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
            describe("") {
                it("should set anchor point based on enum value") {
                    let subject = SKSpriteNode()
                    
                    subject.anchor = .bottomLeft
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 0.0, y: 0.0) ))
                    
                    subject.anchor = .bottomRight
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 1.0, y: 0.0) ))
                    
                    subject.anchor = .topLeft
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 0.0, y: 1.0) ))
                    
                    subject.anchor = .topRight
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 1.0, y: 1.0) ))
                    
                    subject.anchor = .center
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 0.5, y: 0.5) ))
                    
                    subject.anchor = .right
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 1.0, y: 0.5) ))
                    
                    subject.anchor = .left
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 0.0, y: 0.5) ))
                    
                    subject.anchor = .top
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 0.5, y: 1.0) ))
                    
                    subject.anchor = .bottom
                    expect(subject.anchorPoint).to(equal( CGPoint(x: 0.5, y: 0.0) ))
                }
            }
            
            describe("Left/Right/Top/Bottom") {
                it("should calculate lhs x value based on the anchor point") {
                    let container = SKNode()
                    let subject = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 10, height: 10))
                    subject.position = CGPoint(x: 100, y: 100)
                    container.addChild(subject)
                    
                    let result1 = subject.leftX
                    
                    expect(result1).to(equal( 95 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.left.value
                    
                    let result2 = subject.leftX
                    
                    expect(result2).to(equal( 100 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.right.value
                    
                    let result3 = subject.leftX
                    
                    expect(result3).to(equal( 90 ))
                }
                
                it("should calculate rhs x value") {
                    let container = SKNode()
                    let subject = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 10, height: 10))
                    subject.position = CGPoint(x: 100, y: 100)
                    container.addChild(subject)
                    
                    let result1 = subject.rightX
                    
                    expect(result1).to(equal( 105 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.left.value
                    
                    let result2 = subject.rightX
                    
                    expect(result2).to(equal( 110 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.right.value
                    
                    let result3 = subject.rightX
                    
                    expect(result3).to(equal( 100 ))
                }
                
                it("should calculate top y value") {
                    let container = SKNode()
                    let subject = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 10, height: 10))
                    subject.position = CGPoint(x: 100, y: 100)
                    container.addChild(subject)
                    
                    let result1 = subject.topY
                    
                    expect(result1).to(equal( 105 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.bottom.value
                    
                    let result2 = subject.topY
                    
                    expect(result2).to(equal( 110 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.top.value
                    
                    let result3 = subject.topY
                    
                    expect(result3).to(equal( 100 ))
                }
                
                it("should calculate bottom y value") {
                    let container = SKNode()
                    let subject = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: 10, height: 10))
                    subject.position = CGPoint(x: 100, y: 100)
                    container.addChild(subject)
                    
                    let result1 = subject.bottomY
                    
                    expect(result1).to(equal( 95 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.bottom.value
                    
                    let result2 = subject.bottomY
                    
                    expect(result2).to(equal( 100 ))
                    
                    subject.anchorPoint = R2DAnchorPoint.top.value
                    
                    let result3 = subject.bottomY
                    
                    expect(result3).to(equal( 90 ))
                }
            }
            
            describe("Chainable Setters") {
                var subject: SKSpriteNode!
                
                beforeEach {
                    subject = SKSpriteNode()
                }
                
                it("should set the color") {
                    subject.set(color: .red)
                    
                    expect(subject.color).to(equal(SKColor.red))
                }
                
                it("should set the anchor") {
                    subject.set(anchor: .bottomLeft)
                    
                    expect(subject.anchorPoint).to(equal(CGPoint(x: 0.0, y: 0.0)))
                }
                
                it("should set the texture") {
                    let img = UIImage()
                    let texture = SKTexture(image: img)
                    subject.set(texture: texture)
                    
                    expect(subject.texture?.size()).to(equal(img.size))
                }
                
                it("should set the physics body from another SKPhysicsBody") {
                    let body = SKPhysicsBody()
                    
                    subject.set(physicsBody: body)
                    
                    expect(subject.physicsBody).to(beIdenticalTo(body))
                }
                
                it("should set the physics body from a size") {
                    let size = CGSize(width: 10, height: 10)
                    
                    subject.set(physicsBodyFromSize: size)
                    
                    expect(subject.physicsBody).toNot(beNil())
                }
            }
        }
    }
}
