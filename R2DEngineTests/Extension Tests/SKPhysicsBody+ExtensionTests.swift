//
//  SKPhysicsBody+ExtensionTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 5/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class SKPhysicsBody_ExtensionTests: QuickSpec {

    override func spec() {
        describe("SKPhysicsBody_ExtensionTests") {
            
            it("should fail initialization when passed an invalid CGSize") {
                let badSize: CGSize? = nil
                
                let result: SKPhysicsBody? = SKPhysicsBody(rectangleOfSize: badSize)
                
                expect(result).to(beNil())
            }
            
            it("should succeed initialization when passed a valid CGSize") {
                let goodSize: CGSize? = CGSize(width: 10, height: 20)
                
                let result: SKPhysicsBody? = SKPhysicsBody(rectangleOfSize: goodSize)
                
                expect(result).toNot(beNil())
            }
        }
    }
}
