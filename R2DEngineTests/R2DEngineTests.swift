//
//  R2DEngineTests.swift
//  R2DEngineTests
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import XCTest
@testable import R2DEngine

import Quick
import Nimble

class R2DEngineTests: QuickSpec {
    override func spec() {
        describe("A Quick Test") {
            it("has everything you need to get started") {
                let hi = "hello"
                
                expect(hi).to(contain("hello"))
            }
            
            context("Some lower test context") {
                it("should run successfully") {
                    
                }
            }
        }
    }
}