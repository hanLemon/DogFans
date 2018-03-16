//
//  LovePetsModel.m
//  DogFans
//
//  Created by qianfeng on 16/3/20.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "LovePetsModel.h"

@implementation LovePetsModel
+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"id_next"}];
}
@end
