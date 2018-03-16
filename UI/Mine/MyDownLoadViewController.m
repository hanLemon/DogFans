
//
//  MyDownLoadViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/26.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "MyDownLoadViewController.h"
#import "LovePets.h"
@interface MyDownLoadViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *_dataSource;
    NSMutableArray *_imageArray;
    UIScrollView *_scrollView;
    CGRect _originalFrame;
}
@end

@implementation MyDownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的下载";
    
//    self.navigationController.navigationBar.translucent                                       = NO;
    
    self.view.backgroundColor =  UIColorRGB(254, 250, 247);

    
    _dataSource = [NSMutableArray array];
    _imageArray = [NSMutableArray array];
    
    [self addScrollView];
    
    [self readData];
}
- (void)addScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self ;
    [self.view addSubview:_scrollView];
   
}
- (void)readData
{
    NSString *sqlString2 = @"select * from DownLoad ";
    BOOL ret = [[CSLDBManager defaultDBManager] isTableOK:@"DownLoad"];
    if (ret) {
        [_dataSource addObjectsFromArray:[[CSLDBManager defaultDBManager] select:sqlString2 where:nil]];
    }
    // 去重
    NSSet *set = [NSSet setWithArray:_dataSource];
    [_dataSource removeAllObjects];
    for (NSObject *obj in set) {
        [_dataSource addObject:obj];
    }
    
    for (NSDictionary *dic in _dataSource) {
        NSData *data = dic[@"data"];
        UIImage *image = [UIImage imageWithData:data];
        [_imageArray addObject:image];
    }
    [_imageArray removeObject:@""];

    // 如果下载内容为空
    if (_imageArray.count == 0) {
        [Auxiliary alertWithTitle:@"我的下载" message:@"亲，您当前没有下载的内容哦" button:@[@"去下载",@"取消"] done:^{
            [self.navigationController pushViewController:[LovePets new] animated:YES];
            self.tabBarController.selectedIndex = 0;
            [self.navigationController popToRootViewControllerAnimated:NO];
        } cancel:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    
    
    UIImageView *imageView;
    CGFloat maxY = KSCR_H;
    for (int i = 0; i < _dataSource.count; i ++) {
        CGFloat imageW = KSCR_W / 3;
        CGFloat imageH = KSCR_H / 3;
        if (i < 3) {
             imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * imageW, 0, imageW, imageH)];
        }else{
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake((i % 3)*imageW, (i / 3)*imageH, imageW, imageH)];
        }
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:tapGes];
        imageView.image = _imageArray[i];
        [_scrollView addSubview:imageView];
        maxY = imageView.maxY;
    }
    
    _scrollView.contentSize = CGSizeMake(0, maxY);
}


- (void)tapImage:(UITapGestureRecognizer *)sender
{
    // 放大或者缩小图片
    float width = [UIScreen mainScreen].bounds.size.width/2;
    if (sender.view.frame.size.width <= width) {
        // 是小状态，需要放大
        [self big:sender.view];
    }
    else {
        // 是大状态，需要缩小
        [self small:sender.view];
    }
    
}

- (void)big:(UIView *)view {
    
    // 提到最上层
    [_scrollView bringSubviewToFront:view];
    
    // 记录原位置
    _originalFrame = view.frame;
    
    // 动画放大
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.navigationController.navigationBar.hidden = YES;
        view.frame = CGRectMake(0, _scrollView.contentOffset.y - 64, KSCR_W, KSCR_H + 64);
    }];
    
}

- (void)small:(UIView *)view {
    // 动画还原到原位置即可
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = _originalFrame;
        self.navigationController.navigationBar.hidden = NO;

    }];
    
}


@end
