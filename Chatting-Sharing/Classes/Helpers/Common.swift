//
//  Common.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/4/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import Foundation
import UIKit

class Common: NSObject {
    
    class func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    class func sizeOfString(string: String!, inFont font: UIFont!, andMaxWidth width: CGFloat!) -> CGSize {
        
        if string.isEmpty {
            return CGSize(width: width, height: 1.0)
        } else {
            let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byTruncatingTail
            label.font = font
            label.text = string
            
            label.sizeToFit()
            return CGSize(width: width, height: label.frame.size.height)
        }
    }
    
    class func sizeOfString(string: String!, inFont font: UIFont!, andMaxHeight height: CGFloat!) -> CGSize {
        
        if string.isEmpty {
            return CGSize(width: 0.0, height: height)
        } else {
            let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
            label.numberOfLines = 0
            label.lineBreakMode = NSLineBreakMode.byTruncatingTail
            label.font = font
            label.text = string
            
            label.sizeToFit()
            return CGSize(width: label.frame.size.width, height: height)
        }
    }
    
    class func stringToDate(dateString: String) -> Date {
        //2017-08-6 9:00:00+07:00
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ssZ"
        let date = dateFormatter.date(from: dateString)
        return date!
    }
    
}
