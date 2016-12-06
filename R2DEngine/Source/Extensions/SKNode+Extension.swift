//
//  SKNodeExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/8/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

extension SKNode {
    
    // MARK: - Properties
    
    /// Getter/Setter - Tuple representation of position.
    public var r2dPosition: (x: CGFloat, y: CGFloat) {
        get {
            return ( position.x, position.y )
        }
        set {
            position = CGPoint(x: newValue.x, y: newValue.y)
        }
    }
    
    /// Getter/Setter - Tuple representation of position between 0 - 1.
    public var positionPercent: (x: CGFloat, y: CGFloat) {
        get {
            return ( position.x / R2DUtils.screenWidth, position.y / R2DUtils.screenHeight )
        }
        set {
            position = R2DUtils.get(X: newValue.x, Y: newValue.y)
        }
    }
    
    // MARK: - Init
    
    /**
     Convenience Initializer with name
     
     - Parameter r2d_name: The name of the node
     */
    public convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    // MARK: - Add Children
    
    /**
     Adds a variable number of SKNodes as children
     
     - Parameter nodes: The list of nodes, expressed variadically, to add as children.
     
     - Returns: Self
     */
    @discardableResult
    public func add(children nodes: SKNode...) -> Self {
        return add(children: nodes)
    }
    
    /**
     Adds a variable number of SKNodes as children
     
     - Parameter nodes: The list of nodes, expressed as an Array, to add as children.
     
     - Returns: Self
     */
    @discardableResult
    public func add(children nodes: [SKNode]) -> Self {
        nodes.forEach { addChild($0) }
        return self
    }
    
    // MARK: - Loop through Children
    
    /**
     Calls the loop closure for each child, passing each child into the closure
     
     - Parameter loop: The closure for each child.
     
     - Returns: Self
     */
    @discardableResult
    public func eachChild(_ loop: (SKNode) -> Void) -> Self {
        children.forEach(loop)
        return self
    }
    
    /**
     Calls the loop closure for each child with the specified name, passing each child into the closure
     
     - Parameter name: The name to filter the children of this node before running the loop closure.
     - Parameter loop: The closure for each child.
     
     - Returns: Self
     */
    @discardableResult
    public func eachChildBy(name: String, _ loop: (SKNode) -> Void) -> Self {
        children.filter { $0.name == name }.forEach(loop)
        return self
    }
    
    /**
     Calls the loop closure for each child that name contains, passing each child into the closure
     
     - Parameter name: The name to filter the children of this node before running the loop closure.
     - Parameter loop: The closure for each child.
     
     - Returns: Self
     */
    @discardableResult
    public func eachChildContaining(name: String, _ loop: (SKNode) -> Void) -> Self {
        children.filter { $0.name?.contains(name) ?? false }.forEach(loop)
        return self
    }
    
    // MARK: - Setters
    
    /**
     Chainable - Setter for this node's position property
     
     - Parameter position: The CGPoint used to set the position of this node.
     
     - Returns: Self
     */
    @discardableResult
    public func set(position: CGPoint) -> Self {
        self.position = position
        return self
    }
    
    /**
     Chainable - Setter for this node's position property
     
     - Parameter x: The CGFloat value used to set the x coordinate of this node's position
     - Parameter y: The CGFloat value used to set the y coordinate of this node's position
     
     - Returns: Self
     */
    @discardableResult
    public func setPosition(byX x: CGFloat, Y y: CGFloat) -> Self {
        position = CGPoint(x: x, y: y)
        return self
    }
    
    /**
     Chainable - Setter for this node's position property in percentage (0 - 1)
     
     - Parameter x: The CGFloat value between 0 - 1, used to set the x coordinate of this node's position
     - Parameter y: The CGFloat value between 0 - 1, used to set the y coordinate of this node's position
     
     - Returns: Self
     */
    @discardableResult
    public func setPosition(byXPercent x: CGFloat, YPercent y: CGFloat) -> Self {
        position = R2DUtils.get(X: x, Y: y)
        return self
    }
    
    /**
     Chainable - Used to add an individual SKNode as a child of this node
     
     - Parameter node: The SKNode to add as a child of this node.
     
     - Returns: Self
     */
    @discardableResult
    public func addTo(node: SKNode) -> Self {
        node.addChild(self)
        return self
    }
}
