//
//  CategoryButton.m
//  DogFans
//
//  Created by qianfeng on 16/3/23.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "CategoryButton.h"

@implementation CategoryButton

#pragma mark - 设置我们Button内部图片的位置

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = contentRect.size.width * 0.2;
    CGFloat imageY = contentRect.size.height * 0.1;
    CGFloat imageW = contentRect.size.width * 0.6 ;
    CGFloat imageH = contentRect.size.height * 0.6;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

#pragma mark 设置我们Button内部文字的位置

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
//    CGFloat titleX = contentRect.size.width * 0.25;
    CGFloat titleY = contentRect.size.height * 0.7;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height * 0.4;
    return CGRectMake(0, titleY, titleW, titleH);
}


@end
