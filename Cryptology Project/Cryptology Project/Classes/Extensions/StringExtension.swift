//
//  StringExtension.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 16/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//


extension String {
    var length: Int {
        return characters.count
    }
    
    func elementOfIndex(i:Int) -> String {
        return String(Array(self.characters)[i])
    }
}
