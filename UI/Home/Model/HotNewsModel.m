//
//  HotNewsModel.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HotNewsModel.h"

@implementation HotNewsModel


+ (instancetype)modelWithResultSet:(FMResultSet *)set {
    
    HotNewsModel *model = [[HotNewsModel alloc] init];
    
    model.newsId = [set objectForColumnName:@"newsId"];
    model.commentNum = [set objectForColumnName:@"commentNum"];
    model.contentType = [set objectForColumnName:@"contentType"];
    model.pubDateStr = [set objectForColumnName:@"pubDateStr"];
    NSString *str = [set objectForColumnName:@"picList"] ;
    NSArray *array = [str componentsSeparatedByString:@"*"];
    model.picList = array;
    model.readNum = [set objectForColumnName:@"readNum"];
    model.src = [set objectForColumnName:@"src"];
    model.title = [set objectForColumnName:@"title"];
    model.isHot = [set objectForColumnName:@"isHot"];

    return model;
}



@end
