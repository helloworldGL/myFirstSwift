//
//  UIView+IFExtension.m
//  yytxst
//
//  Created by 讯飞888 on 2020/8/13.
//  Copyright © 2020 讯飞888. All rights reserved.
//

#import "UIView+IFExtension.h"
#import <objc/runtime.h>
@implementation UIView (IFExtension)

+ (void)load {
    Method originalMethod = class_getInstanceMethod(self, @selector(layoutSubviews));
    Method newMethod = class_getInstanceMethod(self, @selector(mq_layoutSubviews));
    method_exchangeImplementations(originalMethod, newMethod);
    
    Method ori = class_getInstanceMethod([self class], @selector(pointInside:withEvent:));
    Method qx_relpaced = class_getInstanceMethod([self class], @selector(qx_pointInside:withEvent:));
    method_exchangeImplementations(ori, qx_relpaced);
}

- (void)mq_layoutSubviews {
    [self mq_layoutSubviews];
    !self.layoutSubviewsCallback ?: self.layoutSubviewsCallback(self);
}

- (void)setLayoutSubviewsCallback:(Callback)layoutSubviewsCallback {
    objc_setAssociatedObject(self, "layoutSubviewsCallback", layoutSubviewsCallback, OBJC_ASSOCIATION_RETAIN);
}

- (Callback)layoutSubviewsCallback {
    return objc_getAssociatedObject(self, "layoutSubviewsCallback");
}



- (void)setExpandEdge:(UIEdgeInsets)expandEdge {
    objc_setAssociatedObject(self, @selector(expandEdge), [NSValue valueWithUIEdgeInsets:expandEdge], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)expandEdge {
    NSValue *value =  objc_getAssociatedObject(self, @selector(expandEdge));
    return [value UIEdgeInsetsValue];
}

- (BOOL)qx_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    UIEdgeInsets insets = self.expandEdge;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - insets.left, bounds.origin.y - insets.top, bounds.size.width + insets.left + insets.right, bounds.size.height + insets.top + insets.bottom);
    return CGRectContainsPoint(bounds, point);
}

- (void)mq_RoundCornerbyRoundingCorners:(UIRectCorner)rectCorner radius:(CGFloat)radius {
    if (self.layer.mask) {
        return;
    }
    if (self.bounds.size.width == 0 || self.bounds.size.height == 0) {
        return;
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
