//
//  NearbyUserCell.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/2/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit
import AvatarImageView
import SnapKit

class NearbyUserCell: UITableViewCell {
    
    var lblUserName: UILabel!
    var lblLastMessage: VerticalAlignLabel!
    var lblTimeago: UILabel!
    var avatarImageView: AvatarImageView!
    var containerView: UIView! = UIView()
    var lineBottom: UIView! = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.separatorInset = UIEdgeInsets.zero
        self.selectionStyle = .none
        self.addSubViewForCell()
    }
    
    override func layoutSubviews() {
        self.lblUserName.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        self.lblUserName.textColor = Common.colorWithHexString(hex: "5c5c5c")
        self.lineBottom.backgroundColor = Common.colorWithHexString(hex: "e9e9e9")
        self.lblLastMessage.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        self.lblLastMessage.textColor = Common.colorWithHexString(hex: "939393")
        self.lblLastMessage.verticalAlignment = .top
        self.lblLastMessage.numberOfLines = 2
        self.lblTimeago.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        self.lblTimeago.textColor = Common.colorWithHexString(hex: "c2c2c2")
        self.makeConstraints()
    }

    func addSubViewForCell() {
        self.avatarImageView = AvatarImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.avatarImageView.configuration = avatarImageConfig()
        self.lblUserName = UILabel()
        self.lblLastMessage = VerticalAlignLabel()
        self.lblTimeago = UILabel()
        self.containerView.addSubview(self.avatarImageView)
        self.containerView.addSubview(self.lblUserName)
        self.containerView.addSubview(self.lblLastMessage)
        self.containerView.addSubview(self.lblTimeago)
        self.containerView.addSubview(self.lineBottom)
        self.addSubview(self.containerView)
    }
    
    func makeConstraints() {
        self.containerView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        self.lineBottom.snp.makeConstraints { (make) -> Void in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(79)
        }
        self.avatarImageView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.top.left.equalTo(self.containerView).offset(15)
        }
        self.lblUserName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.containerView).offset(20)
            make.right.equalTo(self.containerView).offset(-80)
            make.left.equalTo(self.avatarImageView.snp.right).offset(15)
        }
        self.lblLastMessage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.lblUserName.snp.bottom)
            make.left.equalTo(self.avatarImageView.snp.right).offset(15)
            make.right.equalTo(self.containerView).offset(-80)
            make.height.equalTo(35)
        }
        self.lblTimeago.snp.makeConstraints { (make) -> Void in
            make.right.equalTo(self.containerView).offset(-15)
            make.top.equalTo(35)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
