//
//  ColorExtension.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 13/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit


extension UIColor {
    
    public class func loginViewBackgroundColor() -> UIColor {
        return UIColor(netHex: 0xDE4C5E)
    }
    
    public class func navigationBarBackgroundColor() -> UIColor {
        return UIColor(netHex: 0xDE4C5E)
    }
    
    public class func outgoingMessageColor() -> UIColor {
        return UIColor(netHex: 0x23DA54)
    }
    
    public class func incomingMessageColor() -> UIColor {
        return UIColor(netHex: 0xA4AAB3)
    }
    
    public class func loginButtonBacgrounColor() -> UIColor {
        return UIColor(netHex: 0x4A90E2)
    }
    
    public class func sendMessageButtonTintColor() -> UIColor {
        return UIColor(netHex: 0x4A90E2)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid Red")
        assert(green >= 0 && green <= 255, "Invalid Green")
        assert(blue >= 0 && blue <= 255, "Invalid Blue")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
