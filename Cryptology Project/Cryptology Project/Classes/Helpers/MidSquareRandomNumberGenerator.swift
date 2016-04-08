//
//  MidSquareRandomNumberGenerator.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 08/04/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import Foundation

class MidSquareRandomNumberGenerator: NSObject {
    
    private var startValue: Int!
    
    override init() {
        super.init()
        self.startValue = getTimeInput()
    }
    
    func next() -> Int {
        startValue = midSqureRandomNumber(startValue)
        return startValue
    }
    
    private func midSqureRandomNumber(input: Int) -> Int {
        let squareString = "\(input * input)"
        let completedString = completeTo8Digit(squareString)
        let midString = completedString[2...5]
        
        return Int(midString)!
    }
    
    private func completeTo8Digit(input: String) -> String {
        if input.length > 7 {
            return input
        }
        
        let count = 8 - input.length
        var returnValue = input
        
        for _ in 0 ..< count {
            returnValue = "0" + returnValue
        }
        
        return returnValue
    }
    
    private func getTimeInput() -> Int {
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "ssmm"
        
        let dateString = dateFormater.stringFromDate(NSDate())
        
        return Int(dateString)!
    }
    
}
