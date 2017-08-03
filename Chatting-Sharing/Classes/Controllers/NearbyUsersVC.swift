//
//  NearbyUsersVC.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/2/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit
import Hype
import AvatarImageView

class NearbyUsersVC: UIViewController, ChatApplicationDelegate {
    
    var tableView: UITableView!
    var cellReuseIdentifier = "NearbyUserCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Nearby Network Users"
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.tableView.register(NearbyUserCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        ChatApplication.sharedInstance.delegate = self
        ChatApplication.sharedInstance.userName = "Mr. Nav"
        ChatApplication.sharedInstance.requestHypeToStart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceivedChangeHype()-> Void {
        self.tableView.reloadData()
    }
    
    func didReceivedMessage(message: MessageItem)-> Void {
        
    }

}

extension NearbyUsersVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! NearbyUserCell
        let user = ChatApplication.sharedInstance.nearbyUsers[indexPath.row]
        struct avatarImageData: AvatarImageViewDataSource {
            var name: String = "Mr Nav"
            var bgColor = UIColor.red
        }
        cell.lblUserName.text = user.identifier
        cell.avatarImageView.dataSource = avatarImageData()
        return cell
    }
    
    func numberOfSectionsInTableView(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatApplication.sharedInstance.nearbyUsers.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
