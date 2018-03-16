//
//  HHFAPIClient.h
//  Limit_MyLove
//
//  Created by qianfeng on 16/3/7.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@interface HHFAPIClient : AFHTTPRequestOperationManager


// 做一个manager单例

+ (instancetype)sharedClient;


// 封装一个 GET 请求; 封装一个 POST 请求

- (void)GETRequest:(NSString *)path
        parameters:(NSDictionary *)parameters
           success:(void (^)(AFHTTPRequestOperation *operation,id responseObject))success
            failer:(void (^)(AFHTTPRequestOperation *operation,NSError *error))failer;



@end
