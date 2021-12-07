//
//  UIImage+Extension.h
//  MiniK
//
//  Created by 杜奎 on 2017/8/8.
//  Copyright © 2017年 UI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

- (UIImage *)normalizedImage;
- (instancetype)thumbnailWithSize:(CGSize)size;
- (UIImage *)circleImageWithSize:(CGSize)size CornerRadius:(CGFloat)radius;
- (UIImage *)clippedImageAtBounds:(CGRect)bounds;
- (UIImage *)clippedImageWithShowScale:(CGFloat)showScale needScale:(CGFloat)needScale;

+ (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data intermediate:(BOOL)intermediate;
+ (UIImage *)imageFromView:(UIView *)theView atFrame:(CGRect)r;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
- (UIImage *)changeImageWithColor:(UIColor *)color;
+ (UIImage *) convertImageToGreyScale:(UIImage*) image;
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha image:(UIImage*)image;
+ (UIImage *)imageWithArgbData:(const uint8_t*)argb imageWidth:(int32_t)width imageHeight:(int32_t)height;

- (UIImage *)croppedImage:(CGRect)bounds;
- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize
          transparentBorder:(NSUInteger)borderSize
               cornerRadius:(NSUInteger)cornerRadius
       interpolationQuality:(CGInterpolationQuality)quality;

+ (UIImage *)sd_tz_animatedGIFWithData:(NSData *)data;
+ (float)sd_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source;

- (UIImage *)resizedImage:(CGSize)newSize
     interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;

- (BOOL)hasAlpha;
- (UIImage *)imageWithAlpha;
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

+ (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;


@end
