//
//  R2DMessengerTests.swift
//  R2DEngine
//
//  Created by Downey, Eric on 5/5/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit
@testable import R2DEngine

import Quick
import Nimble

class R2DMessengerTests: QuickSpec {
    
    class FakeCenter: NSNotificationCenter {
        var addedObserver = false
        var block: ((NSNotification) -> Void)!
        override func addObserverForName(name: String?, object obj: AnyObject?, queue: NSOperationQueue?, usingBlock block: (NSNotification) -> Void) -> NSObjectProtocol {
            addedObserver = true
            self.block = block
            return NSObject()
        }
        
        var removedObserver = false
        override func removeObserver(observer: AnyObject, name aName: String?, object anObject: AnyObject?) {
            removedObserver = true
        }
        
        var postedName: String = ""
        var postedObject: AnyObject? = nil
        var postedData: [NSObject: AnyObject]? = nil
        override func postNotificationName(aName: String, object anObject: AnyObject?, userInfo aUserInfo: [NSObject : AnyObject]?) {
            postedName = aName
            postedObject = anObject
            postedData = aUserInfo
        }
    }
    
    class MessengerCapable: R2DMessenger {
        var center = FakeCenter()
    
        func defaultCenter() -> NSNotificationCenter {
            return center
        }
    }

    override func spec() {
        describe("R2DMessengerTests") {
            
            var subject: MessengerCapable!
            
            beforeEach {
                subject = MessengerCapable()
            }
            
            it("should register with key and handler") {
                class FakeNotification: NSNotification {}
                
                let key = "Imakey"
                var completed = false
                var me: MessengerCapable? = nil
                
                subject.registerListener(key) { sub, not in
                    me = sub
                    completed = true
                }
                
                expect(subject.center.addedObserver).to(beTrue())
                
                subject.center.block(NSNotification(name: "something", object: nil))
                
                expect(me).toNot(beNil())
                expect(completed).to(beTrue())
            }
            
            it("should unregister the specfic key") {
                let key = "Imakey"
                
                subject.unregisterListener(key)
                
                expect(subject.center.removedObserver).to(beTrue())
            }
            
            it("should post a notifiication on a nil object with data") {
                let key = "Imakey"
                
                subject.postOnKey(key, data: ["hello": 1])
                
                expect(subject.center.postedName).to(equal(key))
                expect(subject.center.postedObject).to(beNil())
                expect(subject.center.postedData?["hello"] as? Int).to(equal(1))
            }
        }
    }
}
