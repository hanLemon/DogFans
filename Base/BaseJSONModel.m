//
//  BaseJSONModel.m
//  DogFans
//
//  Created by qianfeng on 16/3/17.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BaseJSONModel.h"

@implementation BaseJSONModel


/**
 *  属性是否是可选实现的
 *
 *  @param propertyName <#propertyName description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
//
//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    
//}
//
//- (id)valueForKey:(NSString *)key
//{
//    return nil;
//}

@end
