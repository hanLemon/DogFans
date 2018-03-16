//
//  CategoryViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/23.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "CategoryViewController.h"


#import "RecomViewController.h"
#import "CompreViewController.h"
#import "LittleViewController.h"
#import "MiddleViewController.h"
#import "BigViewController.h"

@interface CategoryViewController ()

@end

@implementation CategoryViewController
- (instancetype)init
{
    if (self == [super initWithTagViewHeight:49]) {
        ;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tagItemSize = CGSizeMake(KSCR_W / 5, 49);    self.normalTitleColor = [UIColor blackColor];
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titleArray = @[@"推荐",@"综合圈",@"小型犬",@"中型犬",@"大型犬"];
    NSArray *classNames = @[[RecomViewController class],
                            [CompreViewController class],
                            [LittleViewController class],
                            [MiddleViewController class],
                            [BigViewController class]
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
