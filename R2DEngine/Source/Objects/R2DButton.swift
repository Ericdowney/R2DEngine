//
//  R2DButton.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/9/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import SpriteKit

open class R2DButton: SKNode {
    public typealias R2DButtonCallback = (R2DButton) -> Void
    
    var tapCallback: R2DButtonCallback? = nil
    
    open var fontSize: CGFloat = 12.0 {
        didSet {
            guard let label = childNode(withName: "button_label") as? SKLabelNode else { return }
            label.fontSize = fontSize
        }
    }
    
    fileprivate var originalFontColor: SKColor? = nil
    open var fontColor: SKColor = .white {
        didSet {
            if self.originalFontColor == nil { originalFontColor = fontColor }
            guard let label = childNode(withName: "button_label") as? SKLabelNode else { return }
            label.fontColor = fontColor
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
        
        sprite.position = CGPoint.zero
        sprite.name = "button_sprite"
        
        label.position = CGPoint.zero
        label.name = "button_label"
        
        addChild(sprite)
        addChild(label)
        
        isUserInteractionEnabled = true
    }
    
    open func tapCallback(_ callback: R2DButtonCallback?) {
        self.tapCallback = callback
    }
    
    // MARK: - Touches
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.fontColor = fontColor.r2d_lighterColor(0.25)
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        self.fontColor = originalFontColor ?? SKColor.clear
        self.tapCallback?(self)
    }
}
