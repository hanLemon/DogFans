//
//  MyLoveViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/25.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "MyLoveViewController.h"
#import "DBMHotNewsOne.h"
#import "RequestHotNewsViewController.h"

#import "HotNewsTwoTableViewCell.h"
#import "HotNewsTableViewCell.h"

#import "HotNewsModel.h"
#import "HotNewDetail.h"
#import "HotNewsViewController.h"

//#import "CollectionATableViewCell.h"
//#import "CollectionBTableViewCell.h"

#define CELL @"CELLFIVE"
#define CELLTWO @"CELLFIVE_TWO"

@interface MyLoveViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MyLoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的收藏";
    
    [self.view addSubview:self.tableView];
    
    [self requestData];
    
 }

- (void)requestData
{

    [self.dataSource addObjectsFromArray:[[DBMHotNewsOne sharedManager] findAll]];
    
    if (self.dataSource.count == 0) {
        [Auxiliary alertWithTitle:@"提示" message:@"目前没有收藏哦" button:@[@"去收藏",@"取消"] done:^{
            [self.navigationController pushViewController:[HotNewsViewController new] animated:YES];
            self.tabBarController.selectedIndex = 1;
            [self.navigationController popToRootViewControllerAnimated:NO];

        } cancel:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    
      [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HotNewDetail *detailVC = [HotNewDetail new] ;
    HotNewsModel *model = self.dataSource[indexPath.row];
    detailVC.newsId = [[model valueForKey:@"newsId"] integerValue];
    // 添加水滴效果
    __autoreleasing CATransition *transition = [CATransition animation];
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFade;
    transition.duration = 0.5;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    detailVC.hidesBottomBarWhenPushed = YES;
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
        tableView.rowHeight = cell.cellH ;
        return cell ;
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    HotNewsModel *model = self.dataSource[indexPath.row];
    
    [[DBMHotNewsOne sharedManager] deleteRecord:model];
    
    [self.dataSource removeObjectAtIndex:indexPath.row];
    
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // 刷新收藏按钮的状态
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
        
    }
    return _tableView;
}












@end
