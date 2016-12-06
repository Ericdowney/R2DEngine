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
            describe("Initializer") {
                it("should construct an SKNode with a name") {
                    let subject = SKNode(name: "aNode")
                    
                    expect(subject.name).to(contain("aNode"))
                }
            }
            
            describe("SKNode Properties") {
                var subject: SKNode!
                
                beforeEach {
                    subject = SKNode()
                }
                
                it("should get the node's position as a tuple") {
                    subject.position = CGPoint(x: 11, y: 12)
                    
                    let result = subject.r2dPosition
                    
                    expect(result.x).to(equal(11))
                    expect(result.y).to(equal(12))
                }
                
                it("should set position from tuple") {
                    
                    subject.r2dPosition = (1.0, 3.0)
                    
                    expect(subject.position.x).to(equal(1.0))
                    expect(subject.position.y).to(equal(3.0))
                }
            }
            
            describe("Adding Children") {
                var subject: SKNode!
                
                beforeEach {
                    subject = SKNode()
                }
                
                it("should add multiple nodes as children from variadic params") {
                    let c1 = SKNode(name: "node1")
                    let c2 = SKNode(name: "node2")
                    
                    subject.add(children: c1, c2)
                    
                    expect(subject.children).to(contain(c1, c2))
                }
                
                it("should add multiple nodes as children from an array of params") {
                    let c1 = SKNode(name: "node1")
                    let c2 = SKNode(name: "node2")
                    
                    subject.add(children: [c1, c2])
                    
                    expect(subject.children).to(contain(c1, c2))
                }
                
                it("should add the current node to another node") {
                    let other = SKNode()
                    
                    subject.addTo(node: other)
                    
                    expect(other.children).to(contain(subject))
                }
            }
            
            describe("Looping Children") {
                var subject: SKNode!
                
                beforeEach {
                    subject = SKNode()
                }
                
                it("should run the loop closure for each child of node") {
                    let c1 = SKNode()
                    let c2 = SKNode()
                    subject.addChild(c1)
                    subject.addChild(c2)
                    var times = 0
                    
                    subject.eachChild { _ in
                        times += 1
                    }
                    
                    expect(times).to(equal(2))
                }
                
                it("should run the loop closure for each child with the specified name") {
                    let c1 = SKNode()
                    let c2 = SKNode()
                    c1.name = "1"
                    c2.name = "2"
                    subject.addChild(c1)
                    subject.addChild(c2)
                    var times = 0
                    
                    subject.eachChildBy(name: "1") { _ in
                        times += 1
                    }
                    
                    expect(times).to(equal(1))
                }
                
                it("should run the loop closure for each child that contains the specified name") {
                    let c1 = SKNode()
                    let c2 = SKNode()
                    let c3 = SKNode()
                    c1.name = "1fdggddfsg"
                    c2.name = "gsfdgsf1d1"
                    subject.addChild(c1)
                    subject.addChild(c2)
                    subject.addChild(c3)
                    var times = 0
                    
                    subject.eachChildContaining(name: "1") { _ in
                        times += 1
                    }
                    
                    expect(times).to(equal(2))
                }
            }
            
            describe("Position Setters") {
                var subject: SKNode!
                
                beforeEach {
                    subject = SKNode()
                }
                
                it("should set the position from a CGPoint") {
                    let p1 = CGPoint(x: 15, y: 20)
                    
                    subject.set(position: p1)
                    
                    expect(subject.position).to(equal(p1))
                }
                
                it("should set the position from x and y") {
                    let p1 = CGPoint(x: 15, y: 20)
                    
                    subject.setPosition(byX: p1.x, Y: p1.y)
                    
                    expect(subject.position).to(equal(p1))
                }
            }
        }
    }
}
