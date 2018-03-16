//
//  QFDataBaseManager.m
//  Limit
//
//  Created by luds on 16/3/8.
//  Copyright © 2016年 luds. All rights reserved.
//

#import "DBMHotNewsOne.h"
#import "HotNewsModel.h"

@implementation DBMHotNewsOne

+ (instancetype)sharedManager {
    
    static DBMHotNewsOne *_manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingString:@"/model.db"];
        // 实例化
        _manager = [[DBMHotNewsOne alloc] initWithPath:path];
        // 打开数据库
        [_manager open];
        // 建表
        [_manager createTable];
    });
    
    return _manager;
}
// 建表
- (void)createTable {
     NSString *sql = @"create table if not exists HotNewsOne (newsId primary key,commentNum ,contentType,isHot,picList,pubDateStr,readNum,src,title)";
    // 执行更新语句
    [self executeUpdate:sql];
}

// 增
- (void)addRecord:(HotNewsModel *)model {
    NSString *sql = @"insert into HotNewsOne(newsId, commentNum,contentType,isHot,picList,pubDateStr,readNum,src,title) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    NSString *str = [model.picList componentsJoinedByString:@"*"];
    
    [self executeUpdate:sql, model.newsId, model.commentNum, model.contentType, model.isHot, str, model.pubDateStr, model.readNum ,model.src, model.title];
}
// 删除
- (void)deleteRecord:(HotNewsModel *)model {
    NSString *sql = @"delete from HotNewsOne where newsId = ?";
    
    [self executeUpdate:sql, model.newsId];
}

// 查询所有数据
- (NSArray *)findAll {
    NSString *sql = @"select * from HotNewsOne";
    
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
    
    NSString *sql = @"select * from HotNewsOne where newsId = ?";
    
    FMResultSet *set = [self executeQuery:sql, model.newsId];
    
    return set.next;
}












@end
