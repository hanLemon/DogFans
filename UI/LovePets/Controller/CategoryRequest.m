//
//  CategoryRequest.m
//  DogFans
//
//  Created by qianfeng on 16/3/23.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "CategoryRequest.h"
#import "CategoryModel.h"


#import "RecomViewController.h"
#import "CompreViewController.h"
#import "LittleViewController.h"
#import "MiddleViewController.h"
#import "BigViewController.h"

#define CELL @"CELL_B"

@interface CategoryRequest ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end




@implementation CategoryRequest

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
    [userDefaults setObject:nil forKey:@"Seven"];
    [userDefaults synchronize];// 同步数据
}





#pragma mark ----- 数据请求和解析 -----
- (void)requestData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [userDefaults objectForKey:@"Seven"];
    if (str == nil) {
        // 加载小菊花
        [self showLoadView];
        [userDefaults setObject:@"String" forKey:@"Seven"];
    }
    
    //     请求数据
    
    // 专题
    if ([self isKindOfClass:[RecomViewController class]]) {
        self.path = [NSString stringWithFormat:Dog_recommand];

        
    }else if ([self isKindOfClass:[CompreViewController class]])
    {
      
        self.path = [NSString stringWithFormat:Dog_comprehensive];

    }else if ([self isKindOfClass:[LittleViewController class]])
    {
       
        self.path = [NSString stringWithFormat:Dog_little];

    }else if ([self isKindOfClass:[MiddleViewController class]])
    {
        self.path = [NSString stringWithFormat:Dog_middle];

    }else if ([self isKindOfClass:[BigViewController class]])
    {
        self.path = [NSString stringWithFormat:Dog_Big];
    }
    
    
    [self request:@"GET" url:self.path parameters:nil];
    
}




- (void)parserData:(id)data
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *listArray = dict[@"data"];
 
    [self.dataSource addObjectsFromArray :[CategoryModel arrayOfModelsFromDictionaries:listArray]];
    
    [self.tableView reloadData];
   
    // 隐藏小菊花
    [self hideLoadView];
    
}

#pragma mark ----- tableView 数据源方法 和  代理方法 -----

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    HotNewDetail *detailVC = [HotNewDetail new] ;
//    HotNewsModel *model = self.dataSource[indexPath.row];
//    detailVC.newsId = [model.newsId integerValue];
//    // 添加水滴效果
//    __autoreleasing CATransition *transition = [CATransition animation];
//    transition.type = @"rippleEffect";
//    transition.subtype = kCATransitionFade;
//    transition.duration = 0.5;
//    [self.navigationController.view.layer addAnimation:transition forKey:nil];
//    
//    [self.navigationController pushViewController:detailVC animated:YES];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL];
    }
    
    CategoryModel *model = self.dataSource[indexPath.row];
    if (model) {
       
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.quan_logo] placeholderImage:[UIImage imageNamed:@"place.jpg"]];
        cell.imageView.clipsToBounds = YES;
        cell.imageView.layer.cornerRadius = 5;
        cell.textLabel.text = model.quan_name;
        cell.detailTextLabel.text = model.quan_slogan;
    }
    
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
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 162, 0);
        
        _tableView.rowHeight = 80;
        // 设置分割线 方式
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
     }
    return _tableView;
}



@end









