//
//  HomeButton.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HomeButton.h"

@implementation HomeButton

#pragma mark - 设置我们Button内部图片的位置

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * 0.7;
    return CGRectMake(0, 0, imageW, imageH);
}

#pragma mark 设置我们Buttonneibu文字的位置

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
//    CGFloat titleX = contentRect.size.width * 0.2;
    CGFloat titleY = contentRect.size.height * 0.7;
    CGFloat titleW = contentRect.size.width ;
    CGFloat titleH = contentRect.size.height * 0.3;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
