//
//  PhotoModel.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"id_twice"}];
}

@end
