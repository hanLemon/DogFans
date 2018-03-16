//
//  HHFTabBarController.m
//  LoveLimitFree
//
//  Created by qianfeng on 16/2/22.
//  Copyright (c) 2016年 qianfeng. All rights reserved.
//

#import "HHFTabBarController.h"
#import "IntroduceView.h"
@interface HHFTabBarController ()


@end

@implementation HHFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    // 1. 添加引导页
    [self addIntroduceView];
    // 2. 添加模块视图
    [self addViewControllers];
}

- (void)addIntroduceView{
    // 1. 判断是否是第一次启动
    NSUserDefaults *useDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [useDefaults objectForKey:@"INTRODUCEVIEW"];
    if (!str) { // 第一次启动
        // 2. 添加引导页
        NSArray *array = @[@"0.jpg",@"1.jpg",@"2.jpg",@"3.jpg"];
        CGRect introduceFrame = self.view.frame;
        IntroduceView *introduceView = [[IntroduceView alloc] initWithImageNameOfArray:array frame:introduceFrame];
        [self.view addSubview:introduceView];
        
        [useDefaults setObject:@"Once" forKey:@"INTRODUCEVIEW"];
    }
    
    
}

- (void)addViewControllers{
    NSArray *arrayOfViewControllerName = @[@"LovePets",@"HotNewsViewController",@"HomeViewController",@"MineViewController"];
    NSArray *arrayTitleName = @[@"首页",@"最新汪讯",@"爱宠",@"我的"];
    NSArray *arrayItemName = @[@"00",@"02",@"01",@"03"];
    NSArray *arraySelectedName = @[@"00_sel",@"02_sel",@"01_sel",@"03_sel"];
    for (int i = 0; i < arrayItemName.count; i ++) {
        [self addViewControllerWith:arrayOfViewControllerName[i] title:arrayTitleName[i] itemImageName:arrayItemName[i] itemSelectedImageName:arraySelectedName[i]];
    }
    
}

- (void)addViewControllerWith:(NSString *)name title:(NSString *)title itemImageName:(NSString *)imageName itemSelectedImageName:(NSString *)selectedImageName{
    // 1. 获取控制器对象
    Class viewController = NSClassFromString(name);
    UIViewController *vc = [[viewController alloc] init];
    
    // 2. 设置属性
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 3. 包装UINav
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    
//    self.tabBar.barTintColor =
    self.tabBar.tintColor = [UIColor colorWithRed:226/255.f green:127/255.f blue:26/255.f alpha:1];
    // 4. 添加到TabBarC
    NSMutableArray *arrayM = [NSMutableArray arrayWithArray:self.viewControllers];
    [arrayM addObject:navC];
    self.viewControllers = arrayM;
    
    
    
}

@end
