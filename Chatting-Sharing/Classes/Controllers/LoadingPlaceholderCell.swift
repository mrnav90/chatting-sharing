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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.separatorInset = UIEdgeInsets.zero
        self.selectionStyle = .none
        self.addSubViewForCell()
        self.makeConstraints()
    }
    
    func addSubViewForCell() {
        
    }
    
    func makeConstraints() {

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

//extension LoadingPlaceholderCell: GradientsOwner {
//    var gradientLayers: [CAGradientLayer] {
//        return [titlePlaceholderView.gradientLayer, subtitlePlaceholderView.gradientLayer]
//    }
//}

