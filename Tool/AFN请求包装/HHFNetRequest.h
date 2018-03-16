//
//  HHFNetRequest.h
//  DogFans
//
//  Created by qianfeng on 16/3/17.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求完成时的回调
 *
 *  @param data 回调的数据
 */
typedef void(^CompleteCallBack)(id data);
/**
 *  请求出错时的回调
 *
 *  @param error 回调的错误信息
 */
typedef void(^FailureCallBack)(NSError *error);

@interface HHFNetRequest : NSObject
/**
 *  GET请求数据
 *
 *  @param urlString 请求的网址
 *  @param complete  请求完成时的回调
 *  @param failure   请求失败时的回调
 */
+ (void) get:(NSString *)urlString complete:(CompleteCallBack)complete fail:(FailureCallBack)failure;

/**
 *  POST 方式请求数据
 *
 *  @param urlString  网址
 *  @param parameters 字典，请求的参数
 *  @param complete   完成时的回调
 *  @param failure    错误的回调
 */
+ (void) post:(NSString *)urlString parameters:(NSDictionary *)parameters complete:(CompleteCallBack)complete fail:(FailureCallBack)failure;









@end
