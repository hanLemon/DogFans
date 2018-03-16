//
//  introduceView.m
//  引导页的封装
//
//  Created by qianfeng on 16/1/16.
//  Copyright (c) 2016年 hanHeFeng. All rights reserved.
//

#import "IntroduceView.h"

#define kview_W self.frame.size.width
#define kview_H self.frame.size.height

@interface IntroduceView ()<UIScrollViewDelegate>

{
    NSArray *_arrayOfImageView;
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    
}

@end

@implementation IntroduceView

- (instancetype)initWithImageNameOfArray:(NSArray *)array frame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 0. 设置大小
        self.frame = frame;
    
        // 1.获取图片信息
        _arrayOfImageView = array;
        
        // 2.添加显示图片的ScrollView
        [self addScrollView];
        
        // 3. 添加分页控制器
        [self addPageControl];
        
        // 4. 添加进入app按钮
        [self addEnterButten];
    }
    
    return self;
}

- (void)addEnterButten
{
    CGFloat btnX = (_arrayOfImageView.count - 1) * _scrollView.frame.size.width;
    CGFloat btnW = _scrollView.frame.size.width;
    CGFloat btnH = 60;
    CGFloat btnY = _scrollView.frame.size.height - 120;
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [btn  setTitle:@"WelCome To 爱宠" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickButten) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [_scrollView addSubview:btn];
}

- (void)clickButten
{
    [UIView animateWithDuration:2.0 animations:^{
        self.alpha = 0;
        self.transform = CGAffineTransformScale(self.transform, 0.2, 0.2);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


- (void)addPageControl
{
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kview_H - 60, kview_W, 60)];
    _pageControl.numberOfPages  = _arrayOfImageView.count;
    _pageControl.userInteractionEnabled = NO;
    
    [self addSubview:_pageControl];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger pageNum = offSetX / _scrollView.frame.size.width;
    _pageControl.currentPage = pageNum;
}




- (void)addScrollView
{
    // 1. 获取滚动图
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    _scrollView.contentSize = CGSizeMake(self.frame.size.width * _arrayOfImageView.count, 0);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    
    // 2. 添加展示图片
    for (int i = 0; i < _arrayOfImageView.count; i ++) {
        UIImage *image = [UIImage imageNamed:_arrayOfImageView[i]];
        CGFloat imageViewX = kview_W * i;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(imageViewX, 0, kview_W, kview_H)];
        imageView.image = image;
        [_scrollView addSubview:imageView];
    }
    
    // 3. 把滚动视图添加到View
    [self addSubview:_scrollView];
}











@end
