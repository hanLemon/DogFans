//
//  QFDataBaseManager.h
//  Limit
//
//  Created by luds on 16/3/8.
//  Copyright © 2016年 luds. All rights reserved.
//

#import "FMDatabase.h"

@class HotNewsModel;

@interface DBMHotNewsOne : FMDatabase

/** 数据库单例 */
+ (instancetype)sharedManager;
// 增
- (void)addRecord:(HotNewsModel *)model;
// 删
- (void)deleteRecord:(HotNewsModel *)model;

// 查询所有
- (NSArray *)findAll;

// 传入一个数据, 判断这条数据是否存在
- (BOOL)modelIsExists:(HotNewsModel *)model;



@end
