//
//  AnimationBallScaleRipple.swift
//  Chatting-Sharing
//
//  Created by Viet on 8/6/17.
//  Copyright © 2017 Viet. All rights reserved.
//

import Foundation
import UIKit

class BallScaleRippleAnimation: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let duration: CFTimeInterval = 1.25
        let beginTime = CACurrentMediaTime()
        let layer: CALayer = CALayer()
        let beginTimes = [0, 0.2, 0.4]
        let lineWidth: CGFloat = 2
        let wh = 200.0
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.21, 0.53, 0.56, 0.8)
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        
        scaleAnimation.keyTimes = [0, 0.7]
        scaleAnimation.timingFunction = timingFunction
        scaleAnimation.values = [0, 1]
        scaleAnimation.duration = duration
        
        // Opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.keyTimes = [0, 0.7, 1]
        opacityAnimation.timingFunctions = [timingFunction, timingFunction]
        opacityAnimation.values = [1, 0.7, 0]
        opacityAnimation.duration = duration
        
        // Animation
        let animation = CAAnimationGroup()
        
        animation.animations = [scaleAnimation, opacityAnimation]
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.isRemovedOnCompletion = false
        
        // Draw circles
        for i in 0 ..< 3 {
            let circle: CAShapeLayer = CAShapeLayer()
            let path: UIBezierPath = UIBezierPath()
            let color = UIColor.white
            path.addArc(withCenter: CGPoint(x: wh / 2, y: wh / 2),
                        radius: self.frame.width / 2,
                        startAngle: 0,
                        endAngle: CGFloat(2 * Double.pi),
                        clockwise: false)
            circle.fillColor = Common.colorWithHexString(hex: "f6e7d0").cgColor
            circle.strokeColor = color.cgColor
            circle.lineWidth = lineWidth
            circle.backgroundColor = nil
            circle.path = path.cgPath
            circle.frame = CGRect(x: 0, y: 0, width: wh, height: wh)
            let frame = CGRect(x: (circle.bounds.size.width - 200) / 2,
                               y: (circle.bounds.size.height - 200) / 2,
                               width: 200.0,
                               height: 200.0)
            
            animation.beginTime = beginTime + beginTimes[i]
            circle.frame = frame
            circle.add(animation, forKey: "animation")
            layer.addSublayer(circle)
        }
        self.layer.addSublayer(layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
