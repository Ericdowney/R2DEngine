//
//  R2DMessenger.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/18/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation

public typealias R2DMessageCallback = Void -> Void

public protocol R2DMessage {
    var messageName: String { get set }
    var callback: R2DMessageCallback { get set }
}

public protocol R2DMessengerProperties {
    var listeners: [R2DMessage] { get set }
}

public protocol R2DMessengerComponent {
    mutating func listen(message: R2DMessage)
    func send(message: String)
}

extension R2DMessengerComponent where Self: R2DMessengerProperties {
    mutating public func listen(message: R2DMessage) {
        self.listeners.append(message)
    }
    
    public func send(message: String) {
        self.listeners.filter { $0.messageName == message }.forEach { $0.callback() }
    }
}

public struct R2DMessageObj: R2DMessage {
    public var messageName: String
    public var callback: R2DMessageCallback
    
    public init(messageName: String, callback: R2DMessageCallback) {
        self.messageName = messageName
        self.callback = callback
    }
}

public struct R2DMessenger: R2DMessengerProperties, R2DMessengerComponent {
    public static var instance = R2DMessenger()
    public var listeners: [R2DMessage] = []
}