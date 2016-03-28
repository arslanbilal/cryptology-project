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

    var user = RealmUser()
    var chatList = [MessageList]()
    var userList = [RealmUser]()

    static let sharedInstance = ActiveUser()
    
    func setActiveUser(user: RealmUser) {
        self.user = user
        
        let users = realm.objects(RealmUser).filter("id != \(self.user.id)")
        
        for otherUser in users {
            userList.append(otherUser)
        }
        
        userList.sortInPlace({ $0.0.name < $0.1.name })
        
        loadUserChatData()
    }
    
    func loadUserChatData() {
        
        self.chatList = [MessageList]()
        
        let chats = realm.objects(RealmChat).filter("fromUser.id = \(self.user.id) OR toUser.id = \(self.user.id)")
        
        for chat in chats {
            let selectedUser = chat.fromUser != user ? chat.fromUser : chat.toUser
            let messageType = chat.fromUser != user ? MessageType.IncomingMessage : MessageType.OutgoingMessage
            
            let realmMessage = realm.objects(RealmMessage).filter("id = \(chat.message!.id)").first!
            let otherUser = realm.objects(RealmUser).filter("id = \(selectedUser!.id)").first!
            
            let result = chatList.filter { $0.otherUser.id == otherUser.id }.first
            let message = Message(message: realmMessage, type: messageType)
            
            if result != nil {
                result?.messages.append(message)
            } else {
                chatList.append(MessageList(otherUser: otherUser, message: message, messageType: messageType, messageKey: (chat.key?.key)!))
            }
        }
        
        chatList.sortInPlace({ $0.0.messages.last?.message.date.timeIntervalSince1970 >  $0.1.messages.last?.message.date.timeIntervalSince1970})
    }
    
    func getMesageListFromUserId(userId: Int) -> MessageList? {
        let messageList = chatList.filter { $0.otherUser.id == userId }.first
        return messageList
    }
    
    func exitUser() {
        self.user = RealmUser()
        self.chatList = []
        self.userList = []
    }
}
