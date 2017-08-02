//
//  ChatApplication.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/2/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit
import Hype

protocol ChatApplicationDelegate {
    func didReceivedChangeHype()-> Void
    func didReceivedMessage(message: MessageItem)-> Void
}

class ChatApplication: NSObject {
    static let sharedInstance = ChatApplication()
    var delegate: ChatApplicationDelegate?
    var userName: String! = "anonymous"
    var nearbyUsers: Array<Any>! = Array<Any>()
    
    private override init() {
        super.init()
    }
    
    func requestHypeToStart() {
        HYP.instance().add(self as HYPStateObserver)
        HYP.instance().add(self as HYPNetworkObserver)
        HYP.instance().add(self as HYPMessageObserver)
        let data = userName.data(using: String.Encoding.utf8)
        HYP.instance().start(options:[HYPOptionRealmKey:"a8ee6e61", HYPOptionAnnouncementKey: data as Any])
    }
}

extension ChatApplication: HYPStateObserver, HYPNetworkObserver, HYPMessageObserver {
    
    public func hype(_ hype: HYP!, didLose instance: HYPInstance!, error: Error!) {
        
    }
    
    func hypeDidStart(_ hype: HYP!) {
        print("Hype started!")
    }
    
    func hypeDidStop(_ hype: HYP!, error: Error!) {
        print("Hype stoped!")
    }
    
    func hypeDidFailStarting(_ hype: HYP!, error: Error!) {
        print("Hype fail starting!")
    }
    
    func hypeDidBecomeReady(_ hype: HYP!) {
        
    }
    
    func hype(_ hype: HYP!, didFind instance: HYPInstance!) {
        DispatchQueue.main.async {
            print("Found instance: \(instance.stringIdentifier)")
            let identifier = String.init(data: instance.announcement, encoding: String.Encoding.utf8)
            let userObject:UserObject = UserObject()
            userObject.identifier = identifier
            userObject.instance = instance
            self.nearbyUsers.append(userObject)
            self.delegate?.didReceivedChangeHype()
        }
    }
    
    func hype(_ hype: HYP!, didFailSendingMessage messageInfo: HYPMessageInfo!, to toInstance: HYPInstance!, error: Error!) {
        
    }

    public func hype(_ hype: HYP!, didReceive message: HYPMessage!, from fromInstance: HYPInstance!) {
        let message:MessageItem = NSKeyedUnarchiver.unarchiveObject(with: message.data) as! MessageItem
        self.delegate?.didReceivedMessage(message: message)
    }
    
    func hype(_ hype: HYP!, didSendMessage messageInfo: HYPMessageInfo!, to toInstance: HYPInstance!, progress: Float, complete: Bool) {
        
    }
    
    func sendMessageData(_ message:Data, _ instance:HYPInstance) {
        HYP.instance().send(message, to: instance)
    }
}
