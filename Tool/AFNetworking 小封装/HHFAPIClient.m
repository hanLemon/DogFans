//
//  HHFAPIClient.m
//  Limit_MyLove
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HHFAPIClient.h"

@implementation HHFAPIClient


+ (instancetype)sharedClient{
    
    static HHFAPIClient *_client ;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 这里的代码只会执行一次,有多线程保护
        // 根据一个BaseUrl 做实例化
//        _client = [[HHFAPIClient alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        
         _client = [[HHFAPIClient alloc] init];
        
    });
    return _client;
}

// GET 请求
- (void)GETRequest:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(AFHTTPRequestOperation *, id))success failer:(void (^)(AFHTTPRequestOperation *, NSError *))failer
{
    [self GET:path parameters:[self getNewParameters:parameters] success:success failure:failer];
}

// 获取新的参数列表
// 穿插入一个字典,返回一个新的字典,新的字典包含我们需要在么个接口里传的内容
- (NSDictionary *)getNewParameters:(NSDictionary *)parameters
{
    // 1. 获取一个可变字典
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    // 2. 添加新的键值对
    [dic setValue:@"rmb" forKey:@"currency"];
    
    [dic setValue:@"iOS" forKey:@"type"];
    
    // 3. 返回字典
    return dic;
}









@end
