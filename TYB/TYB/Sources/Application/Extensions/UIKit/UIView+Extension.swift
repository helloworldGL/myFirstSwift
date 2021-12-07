//
//  UIView+Extension.swift
//  yytxst
//
//  Created by 讯飞888 on 2020/8/13.
//  Copyright © 2020 讯飞888. All rights reserved.
//

import UIKit

extension UIView {
    
    func viewController()->UIViewController?{
        var next:UIView? = self
        repeat{
            if let nextResponder = next?.next{
                if(nextResponder.isKind(of: UIViewController.self)){
                    return (nextResponder as! UIViewController)
                }
            }
            next = next?.superview
        }while next != nil
        return nil
    }
    
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }
        
        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }
        
        return nil
    }
    
    var x : CGFloat {
        get {
            return frame.origin.x
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    var y : CGFloat {
        get {
            return frame.origin.y
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    var width : CGFloat {
        get {
            return frame.size.width
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    var height : CGFloat {
        get {
            return frame.size.height
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    var centerX : CGFloat {
        get {
            return center.x
        }
        set {
            var tempCenter : CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    var centerY : CGFloat {
        get {
            return center.y
        }
        set {
            var tempCenter : CGPoint = center
            tempCenter.y = newValue
            center = tempCenter
        }
    }
    var size : CGSize {
        get {
            return frame.size
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    var right : CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.origin.x = newValue - frame.size.width
            frame = tempFrame
        }
    }
    
    var bottom : CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set {
            var tempFrame : CGRect = frame
            tempFrame.origin.y = newValue - frame.size.height
            frame = tempFrame
        }
    }
    
//    - (void)setBackgroundShadow:(UIColor *)shadowColor CGSize:(CGSize)CGSize shadowOpacity:(float)shadowOpacity shadowRadius:(float)shadowRadius {

    func setBackgroundShadow(_ shadowColor:UIColor,size :CGSize, shadowOpacity:CGFloat,shadowRadius : CGFloat){
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = size
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = shadowRadius
        self.clipsToBounds = false
    }
    
    func createGenericShadowLayer(radius: CGFloat) -> CALayer {
        return self.createShadowLayer(shadowColor: UIColor.black, size: CGSize.init(width: 0, height: 2), opacity: 0.14, shadowRadius: 3, cornerRadius: radius)
    }
    
    func createShadowLayer(shadowColor: UIColor, size: CGSize, opacity: CGFloat, shadowRadius: CGFloat, cornerRadius: CGFloat) -> CALayer {
        let subLayer = CALayer.init()
        subLayer.frame = self.bounds
        subLayer.cornerRadius = cornerRadius
        subLayer.backgroundColor = UIColor.white.cgColor
        subLayer.masksToBounds = false
        subLayer.shadowColor = shadowColor.cgColor
        subLayer.shadowOffset = size
        subLayer.shadowOpacity = Float(opacity)
        subLayer.shadowRadius = shadowRadius
        return subLayer
    }
    
    func createCorner(bounds: CGRect, rectCorner: UIRectCorner, cornerRadius: CGFloat){
        if self.layer.mask != nil {
            return
        }
        if bounds.width == 0 || bounds.height == 0 {
            return
        }
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize.init(width: cornerRadius, height: cornerRadius))
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.path = maskPath.cgPath
        shapeLayer.frame = bounds
        self.layer.mask = shapeLayer
    }
    func createCorner(bounds: CGRect, rectCorner: UIRectCorner, cornerRadius: CGFloat,borderColor:CGColor,borderWidth:CGFloat,fillColor:CGColor){
        
        if self.layer.mask != nil {
            return
        }
        if bounds.width == 0 || bounds.height == 0 {
            return
        }
        let maskPath = UIBezierPath.init(roundedRect: bounds.insetBy(dx: borderWidth, dy: borderWidth), byRoundingCorners: rectCorner, cornerRadii: CGSize.init(width: cornerRadius, height: cornerRadius))
        let shapeLayer = CAShapeLayer.init()
        shapeLayer.path = maskPath.cgPath
        shapeLayer.frame = bounds
        shapeLayer.lineWidth = borderWidth
        shapeLayer.strokeColor = borderColor
        shapeLayer.fillColor = fillColor
        self.layer.addSublayer(shapeLayer)
    }

    //设置部分圆角
    func setRoundCorners(corners:UIRectCorner, with radii:CGFloat = 8){
        let bezierpath:UIBezierPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let shape:CAShapeLayer = CAShapeLayer.init()
        shape.path = bezierpath.cgPath
        shape.frame = self.bounds
        self.layer.mask = shape
    }
}
