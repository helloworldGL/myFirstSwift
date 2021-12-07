//
//  UIView+IFExtension.h
//  yytxst
//
//  Created by 讯飞888 on 2020/8/13.
//  Copyright © 2020 讯飞888. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^Callback)(UIView*);


@interface UIView (IFExtension)
@property (assign,nonatomic) UIEdgeInsets expandEdge;

- (void)setLayoutSubviewsCallback:(Callback)layoutSubviewsCallback;
- (void)mq_RoundCornerbyRoundingCorners:(UIRectCorner)rectCorner radius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
