//
//  LoadingPlaceholderCell.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/6/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit
import SnapKit
import Skeleton

class LoadingPlaceholderCell: UITableViewCell {
    
    var imagePlaceholderView: GradientContainerView! = GradientContainerView()
    var titlePlaceholderView: GradientContainerView! = GradientContainerView()
    var subtitlePlaceholderView: GradientContainerView! = GradientContainerView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.separatorInset = UIEdgeInsets.zero
        self.selectionStyle = .none
        self.addSubViewForCell()
    }
    
    override func layoutSubviews() {
        self.imagePlaceholderView.layer.cornerRadius = imagePlaceholderView.bounds.width / 2
        self.imagePlaceholderView.backgroundColor = Common.colorWithHexString(hex: "dfdfdf")
        self.titlePlaceholderView.backgroundColor = Common.colorWithHexString(hex: "dfdfdf")
        self.subtitlePlaceholderView.backgroundColor = Common.colorWithHexString(hex: "dfdfdf")
        self.makeConstraints()
    }
    
    func addSubViewForCell() {
        self.addSubview(self.imagePlaceholderView)
        self.addSubview(self.titlePlaceholderView)
        self.addSubview(self.subtitlePlaceholderView)
    }
    
    func makeConstraints() {
        self.contentView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.imagePlaceholderView.snp.bottom).offset(8)
            make.trailing.equalTo(self.titlePlaceholderView.snp.trailing).offset(16)
            make.trailing.equalTo(self.subtitlePlaceholderView.snp.trailing).offset(96)
        }
        self.imagePlaceholderView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.contentView.snp.leading).offset(8)
            make.width.equalTo(self.imagePlaceholderView.snp.height).multipliedBy(1/1)
            make.top.equalTo(self.contentView.snp.top).offset(8)
        }
        self.titlePlaceholderView.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(8)
            make.leading.equalTo(self.imagePlaceholderView.snp.trailing).offset(16)
            make.centerY.equalTo(self.imagePlaceholderView.snp.centerY).offset(-8)
        }
        self.subtitlePlaceholderView.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(self.contentView.snp.trailing).offset(96)
            make.height.equalTo(8)
            make.leading.equalTo(self.titlePlaceholderView.snp.leading)
            make.top.equalTo(self.titlePlaceholderView.snp.bottom).offset(8)
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

extension LoadingPlaceholderCell: GradientsOwner {
    var gradientLayers: [CAGradientLayer] {
        return [imagePlaceholderView.gradientLayer, titlePlaceholderView.gradientLayer, subtitlePlaceholderView.gradientLayer]
    }
}

