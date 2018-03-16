//
//  HotNewDetail.m
//  DogFans
//
//  Created by qianfeng on 16/3/21.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HotNewDetail.h"
#import "CategoryButton.h"
#import "UMSocial.h"
#import "UMSocialScreenShoter.h"
#import "UMSocialShakeService.h"
@interface HotNewDetail ()<UIWebViewDelegate>
{
    NSURL *_shareUrl;
}
@end

@implementation HotNewDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColorRGB(255, 231, 200);
    
    [self creatWebView];
    [self showLoadView];
    
    [self addButton];
}

- (void)creatWebView
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds ];
    
    // 设置上代理
    webView.delegate = self;
    
    _shareUrl = [NSURL URLWithString:[NSString stringWithFormat:WangXunDetail,(long)self.newsId]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:_shareUrl];
    
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    [webView setScalesPageToFit:YES];
    
}

// 网页加载完成之后消失  小菊花
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    [self hideLoadView];
    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('96wxDiy').style = 'none'"];

}


- (void) addButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
//    [button setTitle:@"分享" forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    button.imageView.contentMode = UIViewContentModeScaleAspectFit ;
    [button addTarget:self action:@selector(shareUrl) forControlEvents:UIControlEventTouchUpInside];
 
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightBtn;
}


- (void)shareUrl
{
    NSString *shareText = [NSString stringWithFormat:@"我的世界有狗狗参与,温馨每一天 %@",_shareUrl];
    [UMSocialSnsService presentSnsIconSheetView:self appKey:UMENGAPPKEY shareText:shareText shareImage:[UIImage imageNamed:@"cat.jpg"] shareToSnsNames:@[UMShareToSina,UMShareToWechatSession,UMShareToQQ] delegate:nil];
}















@end
