//
//  DeliciousViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "DeliciousViewController.h"

#import "DeliciousModel.h"
#import "DeliciousTableViewCell.h"

#define CELL @"CELLTHREE"


@interface DeliciousViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, assign)NSInteger offset;



@end

@implementation DeliciousViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1.0];
    // 每次创建界面的时候 加载小菊花
    [self creatIndicator];
    
    [self.view addSubview:self.tableView];
    
    [self requestData];
}




- (void)creatIndicator
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:@"Third"];
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
    NSString *str = [userDefaults objectForKey:@"Third"];
    if (str == nil) {
        // 加载小菊花
        [self showLoadView];
        [userDefaults setObject:@"String" forKey:@"Third"];
    }
    
    // 请求数据
    self.path = [NSString stringWithFormat:MeiWei,self.offset];
    
    [self request:@"GET" url:self.path parameters:nil];
    
  
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
    
    [self.dataSource addObjectsFromArray :[DeliciousModel arrayOfModelsFromDictionaries:listArray]];
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
    return 220;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DeliciousTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    DeliciousModel *model = self.dataSource[indexPath.row];
    
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
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        // 设置分割线 方式
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 注册cell
        [_tableView registerNib:[UINib nibWithNibName:@"DeliciousTableViewCell" bundle:nil] forCellReuseIdentifier:CELL];
        
        [self setRefreshView];
        
        
    }
    return _tableView;
}



@end









