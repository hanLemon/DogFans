//
//  CuringViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "CuringViewController.h"
#import "CuringOneViewController.h"
#import "CuringTwoViewController.h"
#import "CuringThreeViewController.h"
@interface CuringViewController ()

@end

@implementation CuringViewController

- (instancetype)init
{
    if (self == [super initWithTagViewHeight:49]) {
        ;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"养护训练";
    
    self.tagItemSize = CGSizeMake(KSCR_W / 3, 49);
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titleArray = @[@"主流狗",@"训犬宝典",@"健康手册"];
    NSArray *classNames = @[[CuringOneViewController class],
                            [CuringTwoViewController class],
                            [CuringThreeViewController class]
                            ];
    [self reloadDataWith:titleArray andSubViewdisplayClasses:classNames withParams:nil];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //    [self setTagSelectedIndex:_page];
    [self selectTagByIndex:_page animated:YES];
}


@end
