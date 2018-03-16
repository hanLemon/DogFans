//
//  CategoryModel.m
//  DogFans
//
//  Created by qianfeng on 16/3/23.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel


+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"new_say_count":@"newsay_count"}];
}

@end
