//
//  FactoryUI.m
//  LoveLife
//
//  Created by qianfeng on 16/2/29.
//  Copyright (c) 2016年 zz. All rights reserved.
//

#import "FactoryUI.h"

@implementation FactoryUI
//UIView
+ (UIView *)creatViewWithFrame:(CGRect)frame
{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    return view;
}
//UILabel
+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font
{
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.font = font;
    return label;
}
//UIButton
+ (UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor imageName:(NSString *)imageName backgroundImageName:(NSString *)backgroundImageName target:(id)target selector:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    //设置标题
    [btn setTitle:title forState:UIControlStateNormal];
    //设置标题颜色
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    //设置图片
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    //设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:backgroundImageName] forState:UIControlStateNormal];
    //添加响应方法
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
                     
}
//UIImageView
+ (UIImageView * )creatImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
}
//UITextField
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame text:(NSString *)text placeHolder:(NSString *)placeHolder
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.text = text;
    textField.placeholder = placeHolder;
    return textField;
}
@end
