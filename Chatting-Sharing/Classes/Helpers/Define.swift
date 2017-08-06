//
//  Define.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/4/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import Foundation
import AvatarImageView

struct avatarImageData: AvatarImageViewDataSource {
    var name: String
    init(text: String) {
        name = text
    }
}

struct avatarImageConfig: AvatarImageViewConfiguration {
    var shape: Shape = .circle
}
