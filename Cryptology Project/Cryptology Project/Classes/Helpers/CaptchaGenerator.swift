//
//  CaptchaGenerator.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import Foundation

class CaptchaGenerator: NSObject {
    
    static let captchaData: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    class func generate() -> String {
        var returnValue = ""
        let midSquare = MidSquareRandomNumberGenerator()
        
        for _ in 0 ..< 5 {
            let index = midSquare.next() % 36
            returnValue = returnValue + captchaData[index]
        }
        
        return returnValue
    }
}
