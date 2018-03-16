//
//  BigPictureViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/22.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BigPictureViewController.h"

@interface BigPictureViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
     NSString * _imageName;

}
@end

@implementation BigPictureViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
 
       [self creatScrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor = [ UIColor blackColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blueColor] forKey:NSForegroundColorAttributeName];
}

- (void)viewWillDisappear:(BOOL)animated
{
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.barTintColor = UIColorRGB(247, 135, 17);
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor brownColor] forKey:NSForegroundColorAttributeName];

}



- (void)creatScrollView
{
     NSString *title = [NSString stringWithFormat:@"%d/%ld",self.number + 1,(unsigned long)self.imageArray.count];
    self.title = title;
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, KSCR_H * 0.12, KSCR_W, KSCR_W * 1.25)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(self.imageArray.count *KSCR_W, 0);
    // 设置初始偏移量
    [_scrollView setContentOffset:CGPointMake(KSCR_W *self.number , 0)];
    [self.view addSubview:_scrollView];
    
    for (int i = 0; i < self.imageArray.count; i ++) {

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.width * i, 0, _scrollView.width, _scrollView.height)];
        _imageName = self.imageArray[i][@"S640X640"];
        [imageView sd_setImageWithURL:[NSURL URLWithString:_imageName] placeholderImage:[UIImage imageNamed:@"051.jpg"]];
        [_scrollView addSubview:imageView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / KSCR_W;
    NSString *title = [NSString stringWithFormat:@"%d/%ld", page + 1,(unsigned long)self.imageArray.count];
    self.title = title;
    
}







@end
