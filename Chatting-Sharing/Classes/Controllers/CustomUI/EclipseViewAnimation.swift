//
//  EclipseViewAnimation.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/3/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import UIKit

class EclipseViewAnimation: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        let elipsePath: UIBezierPath = UIBezierPath(ovalIn: CGRect(x:0, y:0, width: 160, height: 285))
        for index in 0...3 {
            let ovalView = UIView(frame: CGRect(x:0, y:0, width: 160, height: 285))
            let angle = CGFloat(2 * Double.pi) / CGFloat(3) * CGFloat(index)
            let ovalLayer: CAShapeLayer! = CAShapeLayer()
            let animation = CAKeyframeAnimation(keyPath: "position")
            
            for idx in 0...3 {
                
            }
            
            
            let animation2 = CAKeyframeAnimation(keyPath: "position")
            let nodeView = UIView(frame: CGRect(x: (ovalView.frame.size.width / 2)  - 68, y: ovalView.frame.size.height - 55, width: 24, height: 24))
            let nodeView2 = UIView(frame: CGRect(x: (ovalView.frame.size.width / 2) - 12, y: ovalView.frame.size.height - 66, width: 24, height: 24))
            let nodeView3 = UIView(frame: CGRect(x: (ovalView.frame.size.width / 2) - 90, y: ovalView.frame.size.height - 105, width: 24, height: 24))
            
            nodeView.backgroundColor = UIColor.green
            nodeView2.backgroundColor = UIColor.blue
            nodeView3.backgroundColor = UIColor.red
            
            animation.path = elipsePath.cgPath
            animation.repeatCount = Float.infinity
            animation.duration = 5.0
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            animation.calculationMode = kCAAnimationPaced
            
            animation2.path = elipsePath.cgPath
            animation2.repeatCount = Float.infinity
            animation2.duration = 5.0
            animation2.timeOffset = 1.0
            animation2.fillMode = kCAFillModeForwards
            animation2.isRemovedOnCompletion = false
            animation2.calculationMode = kCAAnimationPaced
            
//            nodeView.layer.add(animation, forKey: "animate position along path")
//            nodeView2.layer.add(animation2, forKey: "animate position along path")
            
            ovalView.addSubview(nodeView)
            ovalView.addSubview(nodeView2)
            ovalView.addSubview(nodeView3)
            
            ovalView.backgroundColor = UIColor.clear
            ovalView.clipsToBounds = false
            ovalView.transform = CGAffineTransform(rotationAngle: angle)
            
            ovalLayer.lineJoin = kCALineJoinRound
            ovalLayer.lineDashPattern = [4, 4]
            ovalLayer?.path = elipsePath.cgPath
            ovalLayer.didChangeValue(forKey: "path")
            ovalLayer?.strokeColor = UIColor.black.cgColor
            ovalLayer?.fillColor = UIColor.clear.cgColor
            ovalLayer?.lineWidth = 1
            ovalView.layer.addSublayer(ovalLayer!)
            self.addSubview(ovalView)
        }

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
