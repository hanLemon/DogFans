//
//  UIImage+HHFOriginalImage.m
//  Limit_MyLove
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "UIImage+HHFOriginalImage.h"

@implementation UIImage (HHFOriginalImage)

- (UIImage *)originalImage
{
    float version = [UIDevice currentDevice].systemVersion.floatValue;
    // iOS 7 之后需要对图片做原色处理
    if (version >= 7.0) {
    
    return [self imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    return self;
}


@end
