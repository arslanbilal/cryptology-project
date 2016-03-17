//
//  ActiveUser.swift
//  Cryptology Project
//
//  Created by Bilal Arslan on 17/03/16.
//  Copyright © 2016 Bilal Arslan. All rights reserved.
//

import UIKit
import RealmSwift


class ActiveUser: NSObject {
    
    private let realm = try! Realm()
    
    var id = 0
    var name = ""
    var lastname = ""
    var username = ""
    
    var chatList = [MessageList]()

    static let sharedInstance = ActiveUser()
    
    func setUser(user: User) {
        id = user.id
        name = user.name
        lastname = user.lastname
        username = user.username
        
        let chats = realm.objects(Chat).filter("fromUserId = \(id) OR toUserId = \(id)")
        
        for chat in chats {
            let selectedUserId = chat.fromUserId != id ? chat.fromUserId : chat.toUserId
            
            let message = realm.objects(Message).filter("id = '\(chat.messageId)'").first
            let fromUser = realm.objects(User).filter("id = '\(selectedUserId)'").first
            
            let result = chatList.filter { $0.id == fromUser?.id }.first
            
            if result != nil {
                result?.messages.append(message!)
            } else {
                chatList.append(MessageList(id: (fromUser?.id)!, name: (fromUser?.name)!, lastname: (fromUser?.lastname)!, username: (fromUser?.username)!, message: message!))
            }
        }
    }
}
