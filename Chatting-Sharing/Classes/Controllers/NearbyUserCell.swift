//
//  NearbyUserCell.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/2/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class NearbyUserCell: UITableViewCell {
    
    var lblUserName: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.lblUserName = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        self.addSubview(self.lblUserName)
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
