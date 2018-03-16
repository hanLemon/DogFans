
//
//  VedioPlayViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/24.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "VedioPlayViewController.h"

@interface VedioPlayViewController ()<UIWebViewDelegate>

@end

@implementation VedioPlayViewController


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
    
    NSURL *url = [NSURL URLWithString:self.vedio_url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    [webView setScalesPageToFit:YES];
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self hideLoadView];
}

@end
