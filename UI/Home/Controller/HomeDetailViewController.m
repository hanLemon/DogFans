//
//  HomeDetailViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/17.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()<UIWebViewDelegate>

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorRGB(255, 231, 200);
   
    [self creatWebView];
    [self showLoadView];
}

- (void)creatWebView
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds ];
    
    // 设置上代理
    webView.delegate = self;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:FirstDetail,[self.url_id intValue]]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    [webView setScalesPageToFit:YES];
    
}

// 网页加载开始  消失小菊花
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self hideLoadView];
}














@end
