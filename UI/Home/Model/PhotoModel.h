//
//  PhotoModel.h
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BaseJSONModel.h"

@interface PhotoModel : BaseJSONModel
/*
 "def": "1",
 "list": [
 {
 "id": "2942",
 "topcount": "72",
 "zipaicount": "8",
 "title": " ",
 "des": "萌",
 "icon": "/upload/day_150829/201508291448036.jpg",
 "width": 490,
 "height": 490,
 "face": "",
 "timestamp": "1440830883",
 "adddate": "2015-08-29 14:48"
 },
 */

@property (nonatomic, copy) NSString * id_twice;
@property (nonatomic, copy) NSString * topcount;
@property (nonatomic, copy) NSString * zipaicount;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * des;
@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * width;
@property (nonatomic, copy) NSString * height;
@property (nonatomic, copy) NSString * face;
@property (nonatomic, copy) NSString * timestamp;
@property (nonatomic, copy) NSString * adddate;




@end
