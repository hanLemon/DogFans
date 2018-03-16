//
//  FashionViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "FashionViewController.h"
#import "FashionOneViewController.h"
#import "FashionTwoViewController.h"
@interface FashionViewController ()

@end

@implementation FashionViewController

- (instancetype)init
{
    if (self == [super initWithTagViewHeight:49]) {
        ;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"潮流时尚";
    self.tagItemSize = CGSizeMake(KSCR_W / 2, 49);
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titleArray = @[@"本月强档",@"玩转地球"];
    NSArray *classNames = @[[FashionOneViewController class],
                            [FashionTwoViewController class]
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
