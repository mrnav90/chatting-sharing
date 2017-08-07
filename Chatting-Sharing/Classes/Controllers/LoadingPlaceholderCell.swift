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
        super.layoutSubviews()
        self.imagePlaceholderView.backgroundColor = Common.colorWithHexString(hex: "dfdfdf")
        self.titlePlaceholderView.backgroundColor = Common.colorWithHexString(hex: "dfdfdf")
        self.subtitlePlaceholderView.backgroundColor = Common.colorWithHexString(hex: "dfdfdf")
        self.makeConstraints()
    }
    
    func addSubViewForCell() {
        self.contentView.addSubview(self.imagePlaceholderView)
        self.contentView.addSubview(self.titlePlaceholderView)
        self.contentView.addSubview(self.subtitlePlaceholderView)
    }
    
    func makeConstraints() {
        self.contentView.snp.makeConstraints { (make) -> Void in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
            make.trailing.equalTo(self.titlePlaceholderView).offset(16)
            make.trailing.equalTo(self.subtitlePlaceholderView).offset(96)
            make.bottom.equalTo(self.imagePlaceholderView).offset(8)
        }
        self.imagePlaceholderView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.imagePlaceholderView.snp.height).multipliedBy(1/1)
            make.leading.top.equalToSuperview().offset(8)
        }
        self.titlePlaceholderView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.imagePlaceholderView.snp.trailing).offset(16)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(8)
        }
        self.subtitlePlaceholderView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(self.imagePlaceholderView.snp.trailing).offset(16)
            make.height.equalTo(8)
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
        return [self.imagePlaceholderView.gradientLayer, self.titlePlaceholderView.gradientLayer, self.subtitlePlaceholderView.gradientLayer]
    }
}

