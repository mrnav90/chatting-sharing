//
//  MessageItem.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/2/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class MessageItem: NSObject {
    var messageType: String?
    var messageTimer: String?
    var messageData: Data?
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.messageType = aDecoder.decodeObject(forKey: "messageType") as? String
        self.messageTimer = aDecoder.decodeObject(forKey: "messageTimer") as? String
        self.messageData = aDecoder.decodeObject(forKey: "messageData") as! Data?
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.messageType, forKey: "messageType")
        aCoder.encode(self.messageTimer, forKey: "messageTimer")
        aCoder.encode(self.messageData, forKey: "messageData")
    }
}
