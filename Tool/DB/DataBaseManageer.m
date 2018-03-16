//
//  QFDataBaseManager.m
//  Limit
//
//  Created by luds on 16/3/8.
//  Copyright © 2016年 luds. All rights reserved.
//

#import "DataBaseManageer.h"
#import "HotNewsModel.h"

@implementation DataBaseManageer

+ (instancetype)sharedManager {
    
    static DataBaseManageer *_manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/model.db"];
        // 实例化
        _manager = [[DataBaseManageer alloc] initWithPath:path];
        // 打开数据库
        [_manager open];
        // 建表
        [_manager createTable];
    });
    
    return _manager;
}
// 建表
- (void)createTable {
    NSString *sql = @"create table if not exists QFApp(app_id primary key, name, icon, price)";
    // 执行更新语句
    [self executeUpdate:sql];
}

// 增
- (void)addRecord:(HotNewsModel *)model {
    NSString *sql = @"insert into QFApp (app_id, name, icon, price) values (?, ?, ?, ?)";
    
    [self executeUpdate:sql, model.applicationId, model.name, model.iconUrl, model.lastPrice];
}
// 删除
- (void)deleteRecord:(HotNewsModel *)model {
    NSString *sql = @"delete from QFApp where app_id = ?";
    
    [self executeUpdate:sql, model.applicationId];
}

// 查询所有数据
- (NSArray *)findAll {
    NSString *sql = @"select * from QFApp";
    
    FMResultSet *set = [self executeQuery:sql];
    
    // 实例化一个可变数组, 接收数据
    NSMutableArray *allData = [[NSMutableArray alloc] init];
    
    while (set.next) {
        HotNewsModel *model = [HotNewsModel modelWithResultSet:set];
        // 添加数据
        [allData addObject:model];
    }
    // 把所有结果返回
    return allData;
}

// 查询某条数据是否存在
- (BOOL)modelIsExists:(HotNewsModel *)model {
    
    NSString *sql = @"select * from QFApp where app_id = ?";
    
    FMResultSet *set = [self executeQuery:sql, model.applicationId];
    
    return set.next;
}












@end
