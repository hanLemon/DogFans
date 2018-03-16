//
//  BaseViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BaseViewController.h"
#import "HHFNetRequest.h"
#import "MBProgressHUD.h"
@interface BaseViewController ()

@property (nonatomic, strong)MBProgressHUD *hud;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"69.jpg"]]];
    self.navigationController.navigationBar.barTintColor = UIColorRGB(247, 135, 17);
  self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor brownColor] forKey:NSForegroundColorAttributeName];
   
    self.view.backgroundColor = UIColorRGB(238, 238, 238);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.dataSource = nil;//当这个界面不用的时候 销毁数据源
}


- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}



// 数据请求
- (void) request:(NSString *)method url:(NSString *)urlString parameters:(NSDictionary *)dict
{
    if ([method isEqualToString:@"GET"]) {
        [HHFNetRequest get:urlString complete:^(id data) {
            [self parserData:data];
        } fail:^(NSError *error) {
            // 打印出错误的详细信息
            NSLog(@"%@",error.description);
        }];
    }else
    {
        [HHFNetRequest post:urlString parameters:dict complete:^(id data) {
            [self parserData:data];
        } fail:^(NSError *error) {
            NSLog(@"%@",error.description);
        }];
    }
}


- (MBProgressHUD *)hud
{
    if (_hud == nil) {
        _hud = [[MBProgressHUD alloc] initWithView:self.view];
         _hud.activityIndicatorColor = [UIColor grayColor];
        [self.view addSubview:_hud];

    }
    return _hud;
}

- (void)showLoadView
{
    
    [self.hud show:YES];
}


- (void)hideLoadView
{
//     _hud.labelText = @"亲,已加载完成";
    [self.hud hide:YES];
}
    
    
- (void)LoadIndicatorOneTime
{

}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


@end
