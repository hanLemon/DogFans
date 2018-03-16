//
//  HomeNextModel.h
//  DogFans
//
//  Created by qianfeng on 16/3/17.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "JSONModel.h"

@interface HomeNextModel : JSONModel

@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *adddate;
@property(nonatomic,copy)NSString *id_once;
@property(nonatomic,copy)NSString *qiandao_count;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *mp3;//(long)
@property(nonatomic,copy)NSString *timestamp;
@property(nonatomic,copy)NSString *des;
@property(nonatomic,copy)NSString *icon;




@end
