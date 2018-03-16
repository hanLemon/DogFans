//
//  HomeViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/18.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HomeViewController.h"
#import "LoopScrollView.h"
#import "HomeTableViewCell.h"
#import "HomeButton.h"
#import "FactoryUI.h"

// 跳转界面
#import "HotNewsViewController.h"
#import "DeliciousViewController.h"
#import "SplendidPhotoViewController.h"
#import "FashionViewController.h"
#import "CuringViewController.h"
#import "VoiceViewController.h"


#define rID @"HOME"

@interface HomeViewController ()<LoopScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

// 本地图片数组
@property (nonatomic, strong) NSArray *localImageArray;

// 数据数组
@property (nonatomic, strong) NSArray *sourceArray ;

@property (nonatomic, strong) UITableView *tableView ;

@property (nonatomic, strong) UIImageView *headerImageView;


@end

@implementation HomeViewController




- (void)viewDidLoad {
    [super viewDidLoad];


    [self addFooterView];
 
}




- (void)addFooterView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KSCR_W, 30)];
    label.text = @"—————  爱狗狗  —————";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor lightGrayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.tableView setTableFooterView:label];
}




#pragma mark ----- 数据数组懒加载 -----
- (NSArray *)sourceArray
{
    if (_sourceArray == nil) {
        _sourceArray = @[
                         @[
                            @{
                               @"image":@"01.jpg",
                               @"name":@"精彩自拍"
                             }],
                         @[
                             @{
                               @"image":@"00.jpg",
                               @"name":@"本月强档"
                               },
                           @{
                               @"image":@"12.jpg",
                               @"name":@"玩转地球"
                               }],
                         @[
                           @{
                               @"image":@"03.jpg",
                               @"name":@"主流狗"
                               },
                           @{
                               @"image":@"04.jpg",
                               @"name":@"训犬宝典"
                               },
                           @{
                               @"image":@"05.jpg",
                               @"name":@"健康手册"
                               }],
                         @[
                           @{
                               @"image":@"08.jpg",
                               @"name":@"活动报道"
                               },
                           @{
                               @"image":@"07.jpg",
                               @"name":@"达人志"
                               }]
                         ];
        
        
    }
    return _sourceArray ;
}


#pragma mark ----- tableView 懒加载 -----
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 设置分割线 方式
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];

    }
    return _tableView;
}

#pragma mark ----- tableView 代理方法  数据源方法 -----


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KSCR_W, 20)];
    label.font = [UIFont systemFontOfSize:20];
    label.textColor = [UIColor purpleColor];
    label.textAlignment = NSTextAlignmentCenter;
    switch (section) {
        case 0:
            label.text = @"留住精彩";
            break;
        case 1:
            label.text = @"潮流时尚";
            break;
        case 2:
            label.text = @"养护训练";
            break;
        case 3:
            label.text = @"微声音";
            break;
        default:
            break;
    }
    
    return label;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return KSCR_W * 0.4;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sourceArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.sourceArray[section];
    
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rID];
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rID];
    }
    NSArray *array = self.sourceArray[indexPath.section];
    NSDictionary *dic = array[indexPath.row];
    cell.iconImage.image = [UIImage imageNamed:dic[@"image"]];
    cell.label.text = dic[@"name"];
    
    return cell;
}

#pragma mark ----- CELL动画 -----
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect newFrame = cell.frame;
    cell.frame = CGRectMake(-cell.frame.size.width,cell.frame.size.height, 0, cell.frame.size.height);
    [UIView animateWithDuration:0.5 animations:^{
        cell.frame = newFrame;
    } completion:^(BOOL finished) {
        ;
    }];
}
#pragma mark ----- 点击tableView CELL 进入方法 -----

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
            case 0:
        {
            __autoreleasing CATransition *transition = [CATransition animation];
            transition.type = @"cube";
            transition.subtype = kCATransitionFade;
            transition.duration = 0.5;

            SplendidPhotoViewController *photoVC = [[SplendidPhotoViewController alloc] init] ;
            photoVC.hidesBottomBarWhenPushed = YES ;
            [self.navigationController.view.layer addAnimation:transition forKey:nil];
            [self.navigationController pushViewController:photoVC animated:YES];
            
        }
            break;
        case 1:
        {
             FashionViewController *fashionVC = [[FashionViewController alloc ]init];
            switch (indexPath.row) {
                case 0:
                {
                    fashionVC.page = 0;
                }
                    break;
                case 1:
                {
                    fashionVC.page = 1;
                }
                    break;
                default:
                    break;
            }
           
            fashionVC.hidesBottomBarWhenPushed = YES ;
            [self.navigationController pushViewController:fashionVC animated:YES];
        }
          
            break;
        case 2:{
            CuringViewController *curingVC = [[CuringViewController alloc ]init];
            curingVC.hidesBottomBarWhenPushed = YES ;

            switch (indexPath.row) {
                case 0:
                    curingVC.page = 0;
                    break;
                case 1:
                     curingVC.page = 1;
                    break;
                case 2:
                    curingVC.page = 2;
                    break;

                default:
                    break;
            }
            [self.navigationController pushViewController:curingVC animated:YES];
        }
            
            break;
        case 3:{
            VoiceViewController *voiceVC = [[VoiceViewController alloc ]init];
            voiceVC.hidesBottomBarWhenPushed = YES ;

            switch (indexPath.row) {
                case 0:
                    voiceVC.page = 0;
                    break;
                case 1:
                    voiceVC.page = 1;
                    break;
                default:
                    break;
            }
            [self.navigationController pushViewController:voiceVC animated:YES];
        }
           
            break;
        default:
            break;
    }

    
}






























@end
