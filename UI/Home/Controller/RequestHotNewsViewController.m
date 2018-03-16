//
//  RequestHotNewsViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/21.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "RequestHotNewsViewController.h"

#import "RecommandViewController.h"
#import "FunViewController.h"
#import "KnowLedgeViewController.h"
#import "HelpViewController.h"
#import "SocietyViewController.h"
#import "HotNewsModel.h"
#import "HotNewsTableViewCell.h"
#import "HotNewsTwoTableViewCell.h"
#import "HotNewDetail.h"

#define CELL @"CELLFIVE"
#define CELLTWO @"CELLFIVE_TWO"

@interface RequestHotNewsViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, assign)NSInteger nextStr;

@property (nonatomic, strong)NSMutableDictionary *dic;

@property (nonatomic, copy)NSString *sort;

@end


@implementation RequestHotNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _dic = [NSMutableDictionary dictionary];
    
    _nextStr = 42000;
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.f green:arc4random()%256/255.f blue:arc4random()%256/255.f alpha:1.0];
    // 每次创建界面的时候 加载小菊花
    [self creatIndicator];
    
    [self.view addSubview:self.tableView];
    
    [self requestData];
}

// 进入界面之前  刷表
- (void)viewWillAppear:(BOOL)animated
{
    if (self.tableView) {
        [self.tableView reloadData];
    }
}

- (void)creatIndicator
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:@"Five"];
    [userDefaults synchronize];// 同步数据
}


#pragma mark ----- 上拉加载 下拉刷新 -----
- (void)refreshData
{
    [self requestData];
}

- (void)loadMoreData
{
    _nextStr -= 300;
    [_dic setObject: [NSNumber numberWithInteger:_nextStr] forKey:@"nextStr"];
    
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
    NSString *str = [userDefaults objectForKey:@"Five"];
    if (str == nil) {
        // 加载小菊花
        [self showLoadView];
        [userDefaults setObject:@"String" forKey:@"Five"];
    }
    
    //     请求数据
    self.path = [NSString stringWithFormat:WangXun];
    
    // 专题
    if ([self isKindOfClass:[RecommandViewController class]]) {
        [_dic setObject:@"R" forKey:@"contentType"];
        [_dic setObject:@"AQ1817484608" forKey:@"memberId"];
        _sort = @"recommand";
    }else if ([self isKindOfClass:[FunViewController class]])
    {
        [_dic setObject:@"F" forKey:@"contentType"];
        [_dic setObject:@"AQ1817484608" forKey:@"memberId"];
        _sort = @"funny";
    }else if ([self isKindOfClass:[SocietyViewController class]])
    {
        [_dic setObject:@"E" forKey:@"contentType"];
        [_dic setObject:@"AQ1817484608" forKey:@"memberId"];
        _sort = @"society";
    }else if ([self isKindOfClass:[KnowLedgeViewController class]])
    {
        [_dic setObject:@"K" forKey:@"contentType"];
        [_dic setObject:@"AQ1817484608" forKey:@"memberId"];
        _sort = @"knowledge";
    }else if ([self isKindOfClass:[HelpViewController class]])
    {
        [_dic setObject:@"H" forKey:@"contentType"];
        [_dic setObject:@"AQ1817484608" forKey:@"memberId"];
        _sort = @"help";
    }
    
    
    [self request:@"POST" url:self.path parameters:_dic];
    
}




- (void)parserData:(id)data
{
    NSArray *listArray = data[_sort][@"list"];
    
    if (_nextStr == 42000) {
        [self.dataSource removeAllObjects];
    }
    
     HotNewsModel *modeltext = [[HotNewsModel alloc] initWithDictionary:listArray[0] error:nil];
    _nextStr = [modeltext.newsId integerValue];
    
//    [self.dataSource addObjectsFromArray :[HotNewsModel arrayOfModelsFromDictionaries:listArray]];
//    for (HotNewsModel *model in self.dataSource) {
//        if (model.picList.count == 0) {
//            [self.dataSource removeObject:model];
//        }
//    }
    for (NSDictionary *dic in listArray) {
        HotNewsModel *model = [[HotNewsModel alloc] initWithDictionary:dic error:nil];
        if (model.picList.count == 1||model.picList.count == 3) {
            [self.dataSource addObject:model];
        }
    }
    
   
    [self.tableView reloadData];
    if (!_dic[@"nextStr"]) {
        [self.tableView.header endRefreshing];
    }if (_dic[@"nextStr"]) {
        [self.tableView.footer endRefreshing];
    }
    // 隐藏小菊花
    [self hideLoadView];
    
}

#pragma mark ----- tableView 数据源方法 和  代理方法 -----
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 220;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HotNewDetail *detailVC = [HotNewDetail new] ;
    HotNewsModel *model = self.dataSource[indexPath.row];
    detailVC.newsId = [model.newsId integerValue];
    // 添加水滴效果
    __autoreleasing CATransition *transition = [CATransition animation];
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
    HotNewsModel *model = self.dataSource[indexPath.row];
        if (model.picList.count == 1)
    {
        HotNewsTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLTWO];
        cell.model = model;
        tableView.rowHeight = cell.cellH ;
        return cell ;
    }else
    {
        HotNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
        cell.model = model;
//        cell.backgroundColor = UIColorRGB(254, 250, 247);
        tableView.rowHeight = cell.cellH ;
        return cell ;
    }
}

#pragma mark ----- tableView 懒加载 -----
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 113, 0);
        // 设置分割线 方式
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 注册cell
        [_tableView  registerClass:[HotNewsTableViewCell class] forCellReuseIdentifier:CELL];
        [_tableView  registerClass:[HotNewsTwoTableViewCell class] forCellReuseIdentifier:CELLTWO];

        [self setRefreshView];
        
        
    }
    return _tableView;
}




@end









