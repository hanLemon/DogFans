//
//  FactoryUI.h
//  LoveLife
//
//  Created by qianfeng on 16/2/29.
//  Copyright (c) 2016年 zz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FactoryUI : NSObject

//工厂指的是大批量声场零件的地方，映射到项目中就是利用静态方法将常用控件的常用属性做一总结归纳，方便同意修改
//UIView
+ (UIView *)creatViewWithFrame:(CGRect)frame;
//UILabel
+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font;
//UIButton
+ (UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName backgroundImageName:(NSString *)backgroundImageName target:(id)target selector:(SEL)selector;
//UIImageView
+ (UIImageView * )creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName;
//UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame text:(NSString *)text placeHolder:(NSString *)placeHolder;

@end
