//
//  R2DButton.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/9/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

public class R2DButton: SKNode {
    
    public typealias R2DButtonCallback = R2DButton -> Void
    
    var tapCallback: R2DButtonCallback? = nil
    
    public var fontSize: CGFloat = 12.0 {
        didSet {
            guard let label = self.childNodeWithName("button_label") as? SKLabelNode else { return }
            label.fontSize = self.fontSize
        }
    }
    
    private var originalFontColor: SKColor? = nil
    public var fontColor: SKColor = .whiteColor() {
        didSet {
            if self.originalFontColor == nil { self.originalFontColor = self.fontColor }
            guard let label = self.childNodeWithName("button_label") as? SKLabelNode else { return }
            label.fontColor = self.fontColor
        }
    }
    
    public convenience init(imageNamed: String, text: String, fontName: String) {
        let sprite = SKSpriteNode(imageNamed: imageNamed)
        sprite.name = "button_sprite"
        let label = SKLabelNode(fontNamed: fontName)
        label.name = "button_label"
        label.text = text
        
        self.init(sprite: sprite, label: label)
    }
    
    public convenience init(color: SKColor, size: CGSize, text: String, fontName: String) {
        let sprite = SKSpriteNode(color: color, size: size)
        sprite.name = "button_sprite"
        let label = SKLabelNode(fontNamed: fontName)
        label.name = "button_label"
        label.text = text
        
        self.init(sprite: sprite, label: label)
    }

    public convenience init(sprite: SKSpriteNode, label: SKLabelNode) {
        self.init()
        
        sprite.position = CGPointZero
        sprite.name = "button_sprite"
        
        label.position = CGPointZero
        label.name = "button_label"
        
        self.addChild(sprite)
        self.addChild(label)
        
        self.userInteractionEnabled = true
    }
    
    public func tapCallback(callback: R2DButtonCallback?) {
        self.tapCallback = callback
    }
    
    // MARK: - Touches
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        self.fontColor = self.fontColor.r2d_lighterColor(0.25)
    }
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        self.fontColor = self.originalFontColor ?? SKColor.clearColor()
        self.tapCallback?(self)
    }
}