//
//  LovePetsModel.h
//  DogFans
//
//  Created by qianfeng on 16/3/20.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BaseJSONModel.h"

@interface LovePetsModel : BaseJSONModel

/*
 "module_id": "34",
 "type": "today_hot",
 "title": "汪星资讯",
 "is_more": 1,
 "index_more": "2",
 "data": [
 {
 "index_type": "say",
 "id": "579934",
 "text": "寻找APP运营方",
 "need_score": "2",
 "img": "http://img.sdxapp.com/project/source/fa/b8/fab87087342f19b23595e3e5df388251.png!m290x170.jpg",
 "jump": {
 "jump_type": "say",
 "jump_value": "579934"
 }
 */
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *id_next;












@end
