//
//  UIButton+HHFAction.m
//  Limit_MyLove
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "UIButton+HHFAction.h"

#import <objc/runtime.h>

@interface UIButton ()

// 点击回调
@property (nonatomic, copy) void (^clickCallBack)(UIButton *);

@end


@implementation UIButton (HHFAction)

+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImage:(NSString *)image callBack:(void (^)(UIButton *))callBack
{
    UIButton *button = [[self alloc] initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:UIColorRGB(51, 51, 51) forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [button addTarget:button action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    button.clickCallBack = callBack ;
    return button;
}


- (void)buttonAction
{
    // 点击回调
    if (self.clickCallBack) {
        self.clickCallBack(self);
    }
}


#pragma mark ----- !runtime! -----

const void *clickCallBackKey = "clickCallBack";
- (void)setClickCallBack:(void (^)(UIButton *))clickCallBack
{
    objc_setAssociatedObject(self, clickCallBackKey, clickCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (void (^)(UIButton *))clickCallBack
{
    return objc_getAssociatedObject(self, clickCallBackKey);
}











@end
