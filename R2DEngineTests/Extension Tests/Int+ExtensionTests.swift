//
//  Int+ExtensionTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 4/4/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class Int_ExtensionTests: QuickSpec {
    override func spec() {
        describe("Int_ExtensionTests") {
            it("should loop through the closure 4 times") {
                let subject = 4
                var sum = 0
                
                subject.times {
                    sum += 1
                }
                
                expect(sum).to(equal(4))
            }
        }
    }
}
