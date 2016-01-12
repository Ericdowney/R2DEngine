//
//  UIColorExtension.swift
//  R2DEngine
//
//  Created by Downey, Eric on 1/9/16.
//  Copyright © 2016 Eric Downey. All rights reserved.
//

import Foundation
import UIKit

/**
 UIColor extension that add a whole bunch of utility functions like:
 - HTML/CSS RGB format conversion (i.e. 0x124672)
 - lighter color
 - darker color
 - color with modified brightness
 */
public extension UIColor {
    public class func r2d_colorWithRed(r: CGFloat, green g: CGFloat, blue b: CGFloat, alpha a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    /**
     Construct a UIColor using an HTML/CSS RGB formatted value and an alpha value
     
     :param: rgbValue RGB value
     :param: alpha color alpha value
     
     :returns: an UIColor instance that represent the required color
     */
    public class func r2d_colorWithRGB(rgbValue : UInt, alpha : CGFloat = 1.0) -> UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgbValue & 0xFF00) >> 8) / 255
        let blue = CGFloat(rgbValue & 0xFF) / 255
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     Returns a lighter color by the provided percentage
     
     :param: lighting percent percentage
     :returns: lighter UIColor
     */
    public func r2d_lighterColor(percent : Double) -> UIColor {
        return r2d_colorWithBrightnessFactor(CGFloat(1 + percent));
    }
    
    /**
     Returns a darker color by the provided percentage
     
     :param: darking percent percentage
     :returns: darker UIColor
     */
    public func r2d_darkerColor(percent : Double) -> UIColor {
        return r2d_colorWithBrightnessFactor(CGFloat(1 - percent));
    }
    
    /**
     Return a modified color using the brightness factor provided
     
     :param: factor brightness factor
     :returns: modified color
     */
    public func r2d_colorWithBrightnessFactor(factor: CGFloat) -> UIColor {
        var hue : CGFloat = 0
        var saturation : CGFloat = 0
        var brightness : CGFloat = 0
        var alpha : CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * factor, alpha: alpha)
        } else {
            return self;
        }
    }
}