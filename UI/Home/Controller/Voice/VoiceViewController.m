//
//  VoiceViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "VoiceViewController.h"
#import "VoiceOneViewController.h"
#import "VoiceTwoViewController.h"
@interface VoiceViewController ()

@end

@implementation VoiceViewController

- (instancetype)init
{
    if (self == [super initWithTagViewHeight:49]) {
        ;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"微声音";
    
    self.tagItemSize = CGSizeMake(KSCR_W / 2, 49);
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray *titleArray = @[@"活动报告",@"达人志"];
    NSArray *classNames = @[[VoiceOneViewController class],
                            [VoiceTwoViewController class]
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
