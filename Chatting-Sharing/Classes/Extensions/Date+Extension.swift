//
//  Date+Extension.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/6/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import Foundation

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
