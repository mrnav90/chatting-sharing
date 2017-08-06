//
//  NearbyUsersVC.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/2/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit
import Hype
import SnapKit

class NearbyUsersVC: UIViewController, ChatApplicationDelegate {
    
    var tableView: UITableView!
    var cellReuseIdentifier = "LoadingPlaceholderCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Nearby Network Users"
        self.tableView = UITableView()
        self.tableView.register(LoadingPlaceholderCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.separatorStyle = .none
        self.view.addSubview(self.tableView)
        ChatApplication.sharedInstance.delegate = self
        ChatApplication.sharedInstance.userName = "Mr. Nav 91"
        ChatApplication.sharedInstance.requestHypeToStart()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didReceivedChangeHype()-> Void {
        DispatchQueue.main.async {
//            self.tableView.reloadData()
        }
    }
    
    func didReceivedMessage(message: MessageItem)-> Void {
        
    }
    
    func makeConstraints() {
        self.tableView.snp.makeConstraints { (make) in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }

}

extension NearbyUsersVC: UITableViewDataSource, UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LoadingPlaceholderCell.self), for: indexPath) as! LoadingPlaceholderCell
        
        cell.gradientLayers.forEach { gradientLayer in
            let baseColor = Common.colorWithHexString(hex: "dfdfdf")
            gradientLayer.colors = [baseColor.cgColor,
                                    baseColor.brightened(by: 0.93).cgColor,
                                    baseColor.cgColor]
        }
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let skeletonCell = cell as! LoadingPlaceholderCell
        skeletonCell.slide(to: .right)
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! NearbyUserCell
//        let user = ChatApplication.sharedInstance.nearbyUsers[indexPath.row]
//        if indexPath.row % 2 == 0 {
//            cell.containerView.backgroundColor = UIColor.white
//        } else {
//            cell.containerView.backgroundColor = Common.colorWithHexString(hex: "f7f7f7")
//        }
//        cell.lblUserName.text = user.identifier
//        cell.lblLastMessage.text = "This is my description"
//        cell.lblTimeago.text = "3 hours ago"
//        cell.avatarImageView.dataSource = avatarImageData.init(text: user.identifier!)
//    
//        return cell
//    }
//    
//    func numberOfSectionsInTableView(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ChatApplication.sharedInstance.nearbyUsers.count
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 80
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("OK")
//    }
}

extension UIColor {
    func brightened(by factor: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * factor, alpha: a)
    }
}

