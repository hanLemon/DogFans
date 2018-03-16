//
//  HotNewsViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HotNewsViewController.h"

#import "RecommandViewController.h"
#import "FunViewController.h"
#import "KnowLedgeViewController.h"
#import "HelpViewController.h"
#import "SocietyViewController.h"

@interface HotNewsViewController ()


@end

@implementation HotNewsViewController


- (instancetype)init
{
    if (self == [super initWithTagViewHeight:49]) {
        ;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"最新汪讯";
    
    self.tagItemSize = CGSizeMake(KSCR_W / 5, 49);
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titleArray = @[@"推荐",@"搞笑",@"社会",@"小知识",@"求助"];
    NSArray *classNames = @[[RecommandViewController class],
                            [FunViewController class],
                            [SocietyViewController class],
                            [KnowLedgeViewController class],
                            [HelpViewController class]
                            ];
    [self reloadDataWith:titleArray andSubViewdisplayClasses:classNames withParams:nil];
    
}


//- (void) viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    //    [self setTagSelectedIndex:_page];
//    [self selectTagByIndex:_page animated:YES];
//}



@end









