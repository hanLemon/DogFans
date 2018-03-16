//
//  RequestListViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/18.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "RequestListViewController.h"
#import "HomeNextModel.h"
#import "HomeNextTableViewCell.h"
#import "HomeDetailViewController.h"

#import "FashionOneViewController.h"
#import "FashionTwoViewController.h"
#import "CuringOneViewController.h"
#import "CuringTwoViewController.h"
#import "CuringThreeViewController.h"
#import "VoiceOneViewController.h"
#import "VoiceTwoViewController.h"

#import "DeliciousViewController.h"
#import "SplendidPhotoViewController.h"


#define CELL @"CELLTWO"

@interface RequestListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, assign)NSInteger offset;

@end

@implementation RequestListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 每次创建界面的时候 加载小菊花
    [self creatIndicator];
    
    [self.view addSubview:self.tableView];
    
    [self requestData];
    
}



- (void)creatIndicator
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:@"Second"];
    [userDefaults synchronize];// 同步数据
}


#pragma mark ----- 上拉加载 下拉刷新 -----
- (void)refreshData
{
    _offset = 0;
    [self requestData];
}

- (void)loadMoreData
{
    _offset += 15;
    [self requestData];
}


- (void)setRefreshView
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self refreshData];
    }];
    [header setTitle:@"点击或下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    [header setTitle:@"数据更新完成" forState:MJRefreshStatePulling];
    self.tableView.header = header;
    //    [self.tableView.header beginRefreshing];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self loadMoreData];
    }];
    self.tableView.footer = footer ;
    [self.tableView.footer beginRefreshing];
    
}




#pragma mark ----- 数据请求和解析 -----
- (void)requestData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [userDefaults objectForKey:@"Second"];
    if (str == nil) {
        // 加载小菊花
        [self showLoadView];
        [userDefaults setObject:@"String" forKey:@"Second"];
    }
    
    // 请求数据
    
    // 专题
    if ([self isKindOfClass:[FashionOneViewController class]]) {
        self.path =  [NSString stringWithFormat:First_A,(long)self.offset];

    }else if ([self isKindOfClass:[FashionTwoViewController class]])
    {
        self.path = [NSString stringWithFormat:First_B,(long)self.offset];
    }else if ([self isKindOfClass:[CuringOneViewController class]])
    {
        self.path = [NSString stringWithFormat:First_C,(long)self.offset];
    }else if ([self isKindOfClass:[CuringTwoViewController class]])
    {
        self.path = [NSString stringWithFormat:First_D,(long)self.offset];
    }else if ([self isKindOfClass:[CuringThreeViewController class]])
    {
        self.path = [NSString stringWithFormat:First_E,(long)self.offset];
    }else if ([self isKindOfClass:[VoiceOneViewController class]])
    {
        self.path = [NSString stringWithFormat:First_F,(long)self.offset];
    }else if ([self isKindOfClass:[VoiceTwoViewController class]])
    {
        self.path = [NSString stringWithFormat:First_G,(long)self.offset];
    }
//    
//    // 按钮
//    else if ([self isKindOfClass:[SplendidPhotoViewController class]])
//    {
//        self.path = [NSString stringWithFormat:SplendidPhoto,self.offset];
//    }
//    else if ([self isKindOfClass:[DeliciousViewController class]])
//    {
//        self.path = [NSString stringWithFormat:MeiWei,self.offset];
//    }
//    

    
    
    [self request:@"GET" url:self.path parameters:nil];

    
//    [self request:@"GET" url:[NSString stringWithFormat:@"%@%ld",self.path,self.offset] parameters:nil];

}
/**
 *  重载父类的方法,解析请求回来的数据
 *
 *  @param data 返回的数据
 */
- (void) parserData:(id)data
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *listArray = dict[@"list"];
    
    if (_offset == 0) {
        [self.dataSource removeAllObjects];
    }
    
    [self.dataSource addObjectsFromArray :[HomeNextModel arrayOfModelsFromDictionaries:listArray]];
    [self.tableView reloadData];
    if (_offset == 0) {
        [self.tableView.header endRefreshing];
    }if (_offset > 0) {
        [self.tableView.footer endRefreshing];
    }
    // 隐藏小菊花
    [self hideLoadView];
    
}

#pragma mark ----- tableView 数据源方法 和  代理方法 -----
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HomeNextModel *model = self.dataSource[indexPath.row];
    HomeDetailViewController  *detailVC = [[HomeDetailViewController alloc] init];
    detailVC.url_id = model.id_once;
    detailVC.hidesBottomBarWhenPushed = YES;
    // 添加动画效果
    __autoreleasing CATransition *transition = [CATransition animation];
    // 动画类型
    //              pageCurl            向上翻页效果
    //              pageUnCurl          向下翻一页
    //              rippleEffect        波浪效果
    //              cube                立体效果
    //              rippleEffect        滴水效果
    //              suckEffect          收缩效果，如一块布被抽走
    //              oglFlip             上下翻转效果
    
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFade;
    transition.duration = 0.5;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeNextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    HomeNextModel *model = self.dataSource[indexPath.row];
    
    cell.model = model;
    
    cell.backgroundColor = UIColorRGB(254, 250, 247);
    
    return cell;
}

#pragma mark ----- tableView 懒加载 -----
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
        // 设置分割线 方式
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 注册cell
        [_tableView registerClass:[HomeNextTableViewCell class] forCellReuseIdentifier:CELL];

        [self setRefreshView];
        
        
    }
    return _tableView;
}






















@end










