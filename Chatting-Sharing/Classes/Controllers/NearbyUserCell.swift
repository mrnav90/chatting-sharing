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
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.lblUserName)
        self.contentView.addSubview(self.lblLastMessage)
        self.contentView.addSubview(self.lblTimeago)
        self.contentView.addSubview(self.lineBottom)
    }
    
    func makeConstraints() {
        self.contentView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
            make.bottom.equalTo(self.avatarImageView).offset(15)
            make.trailing.equalTo(self.lblUserName).offset(100)
            make.trailing.equalTo(self.lblLastMessage).offset(100)
        }
        self.avatarImageView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.avatarImageView.snp.height).multipliedBy(1/1)
            make.leading.top.equalToSuperview().offset(15)
        }
        self.lblUserName.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.avatarImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(15)
        }
        self.lblLastMessage.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.avatarImageView.snp.trailing).offset(15)
            make.top.equalTo(self.lblUserName.snp.bottom)
        }
        self.lineBottom.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.centerY.equalTo(79)
        }
        self.lblTimeago.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(30)
            make.right.equalToSuperview().offset(-10)
            make.leading.equalTo(self.lblUserName.snp.trailing).offset(15)
            make.leading.equalTo(self.lblLastMessage.snp.trailing).offset(15)
            make.height.equalTo(21)
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
