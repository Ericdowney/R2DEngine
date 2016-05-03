//
//  R2DMessenger.swift
//  R2DEngine
//
//  Created by Downey, Eric on 5/3/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public protocol R2DMessenger: class {
    func registerListener(key: String, handler: (Self, NSNotification) -> Void)
    func unregisterListener(key: String)
    func unregisterListeners()
    func postOnKey(key: String, data: AnyObject)
    func defaultCenter() -> NSNotificationCenter
}

public extension R2DMessenger {
    func registerListener(key: String, handler: (Self, NSNotification) -> Void) {
        defaultCenter().addObserverForName(key, object: self, queue: NSOperationQueue.mainQueue()) {
            [unowned self] notification in
            handler(self, notification)
        }
    }
    
    func unregisterListener(key: String) {
        defaultCenter().removeObserver(self, name: key, object: nil)
    }
    
    func unregisterListeners() {
        defaultCenter().removeObserver(self)
    }
    
    func postOnKey(key: String, data: AnyObject) {
        defaultCenter().postNotificationName(key, object: data)
    }
    
    func defaultCenter() -> NSNotificationCenter {
        return NSNotificationCenter.defaultCenter()
    }
}