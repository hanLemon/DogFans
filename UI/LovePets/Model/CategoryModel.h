//
//  CategoryModel.h
//  DogFans
//
//  Created by qianfeng on 16/3/23.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BaseJSONModel.h"

@interface CategoryModel : BaseJSONModel

/*
 "quan_id": "855",
 "quan_name": "每日一狗",
 "quan_logo": "http://img.sdxapp.com/project/source/80/53/80531f274884127ead405efbcb263448.jpg!m200x200.jpg",
 "quan_slogan": "每日一狗致力于分享狗狗带给我们的快乐",
 "new_say_count": 4,
 "quan_fans": [
 {
 "user_id": "486153",
 "user_face": "http://img.sdxapp.com/face/source/b2/fb/b2fbe29ceca3706b64d976d9896a106c.jpg!m60x60.jpg"
 },
 {
 */

@property (nonatomic, copy) NSString * quan_id;
@property (nonatomic, copy) NSString * quan_name;
@property (nonatomic, copy) NSString * quan_logo;
@property (nonatomic, copy) NSString * quan_slogan;
@property (nonatomic, copy) NSString * newsay_count;



@end
