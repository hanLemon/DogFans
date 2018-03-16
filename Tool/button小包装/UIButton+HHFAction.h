//
//  UIButton+HHFAction.h
//  Limit_MyLove
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HHFAction)
+ (UIButton *)buttonWithFrame:(CGRect)frame
                        title:(NSString *)title
              backgroundImage:(NSString *)image
                     callBack:(void (^) (UIButton * button))callBack;

@end
