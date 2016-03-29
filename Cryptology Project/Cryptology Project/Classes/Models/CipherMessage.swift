//
//  CipherMessage.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 29/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit

class CipherMessage: NSObject {
    
    let message: String!
    let owners: String!
    let date: NSDate!

    init(message: String, owners: String, date: NSDate) {
        self.message = message
        self.owners = owners
        self.date = date
    }
}
