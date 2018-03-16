//
//  DeliciousModel.h
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BaseJSONModel.h"

@interface DeliciousModel : BaseJSONModel

/*"def": "1",
 "list": [
 {
 "icon": "/upload/day_140212/201402121602593_listthumb_iphone4.jpg",
 "gid": "2589",
 "title": "肉酿面筋",
 "timestamp": "1392192120"
 },*/

@property (nonatomic, copy) NSString * icon;
@property (nonatomic, copy) NSString * gid;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * timestamp;


@end
