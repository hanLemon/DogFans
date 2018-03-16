//
//  HHFNetRequest.m
//  DogFans
//
//  Created by qianfeng on 16/3/17.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HHFNetRequest.h"

@implementation HHFNetRequest


+ (void) get:(NSString *)urlString complete:(CompleteCallBack)complete fail:(FailureCallBack)failure
{
    // 得到AFHTTPRequestOperationManager 请求的单例
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置返回数据格式（二进制）
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 请求
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        // 调用block 将请求数据返回
        if (complete) {
                    complete(responseObject);
        }

    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        // 将错误信息返回
        if (failure) {
                    failure(error);
        }

    }];
}



+ (void) post:(NSString *)urlString parameters:(NSDictionary *)parameters complete:(CompleteCallBack)complete fail:(FailureCallBack)failure
{
    // 得到AFHTTPRequestOperationManager 请求的单例
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置返回数据格式（二进制）
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 请求
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if(complete)
        {
            complete(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
}




















@end
