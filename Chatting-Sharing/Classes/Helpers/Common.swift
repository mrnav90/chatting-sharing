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

public class VerticalAlignLabel: UILabel {
    enum VerticalAlignment {
        case top
        case middle
        case bottom
    }
    
    var verticalAlignment : VerticalAlignment = .top {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func textRect(forBounds bounds: CGRect, limitedToNumberOfLines: Int) -> CGRect {
        let rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: limitedToNumberOfLines)
        
        if UIView.userInterfaceLayoutDirection(for: .unspecified) == .rightToLeft {
            switch verticalAlignment {
            case .top:
                return CGRect(x: self.bounds.size.width - rect.size.width, y: bounds.origin.y, width: rect.size.width, height: rect.size.height)
            case .middle:
                return CGRect(x: self.bounds.size.width - rect.size.width, y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2, width: rect.size.width, height: rect.size.height)
            case .bottom:
                return CGRect(x: self.bounds.size.width - rect.size.width, y: bounds.origin.y + (bounds.size.height - rect.size.height), width: rect.size.width, height: rect.size.height)
            }
        } else {
            switch verticalAlignment {
            case .top:
                return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: rect.size.width, height: rect.size.height)
            case .middle:
                return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2, width: rect.size.width, height: rect.size.height)
            case .bottom:
                return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height), width: rect.size.width, height: rect.size.height)
            }
        }
    }
    
    override public func drawText(in rect: CGRect) {
        let r = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: r)
    }
    
}

extension Date {
    
    public var timeAgo: String {
        let components = self.dateComponents()
        
        if components.year! > 0 {
            if components.year! < 2 {
                return "Last year"
            } else {
                return String(format: "%d years ago", components.year!)
            }
        }
        
        if components.month! > 0 {
            if components.month! < 2 {
                return "Last month"
            } else {
                return String(format: "%d months ago", components.month!)
            }
        }
        
        if components.day! >= 7 {
            let week = components.day!/7
            if week < 2 {
                return "Last week"
            } else {
                return String(format: "%d weeks ago", week)
            }
        }
        
        if components.day! > 0 {
            if components.day! < 2 {
                return "Yesterday"
            } else  {
                return String(format: "%d months ago", components.day!)
            }
        }
        
        if components.hour! > 0 {
            if components.hour! < 2 {
                return "an hour ago"
            } else  {
                return String(format: "%d hours ago", components.hour!)
            }
        }
        
        if components.minute! > 0 {
            if components.minute! < 2 {
                return "a minute ago"
            } else {
                return String(format: "%d minutes ago", components.minute!)
            }
        }
        
        if components.second! > 0 {
            if components.second! < 5 {
                return "Just now"
            } else {
                return String(format: "%d seconds ago", components.second!)
            }
        }
        
        return ""
    }
    
    fileprivate func dateComponents() -> DateComponents {
        return Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: self, to: Date())
    }
}
