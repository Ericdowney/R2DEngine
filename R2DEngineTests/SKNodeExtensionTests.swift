//
//  SKNodeExtensionTests.swift
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

class SKNodeExtensionTests: QuickSpec {
    
    override func spec() {
        
        describe("SKNode") {
            
            it("should construct an SKNode with a name") {
                let subject = SKNode(r2d_name: "aNode")
                
                expect(subject.name).to(contain("aNode"))
            }
            
            it("should add multiple nodes as children from variadic params") {
                let subject = SKNode()
                let c1 = SKNode(r2d_name: "node1")
                let c2 = SKNode(r2d_name: "node2")
                
                subject.r2d_addChildren(c1, c2)
                
                expect(subject.children).to(contain(c1, c2))
            }
            
            it("should add multiple nodes as children from an array of params") {
                let subject = SKNode()
                let c1 = SKNode(r2d_name: "node1")
                let c2 = SKNode(r2d_name: "node2")
                
                subject.r2d_addChildren(c1, c2)
                
                expect(subject.children).to(contain(c1, c2))
            }
        }
    }
}