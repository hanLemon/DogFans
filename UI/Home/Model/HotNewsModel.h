//
//  HotNewsModel.h
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "BaseJSONModel.h"

#import "FMResultSet.h"

@interface HotNewsModel : BaseJSONModel
/*
 {
 recommand: {
 "list": [
 {
 "abstr": "亲人的海豹总被人们拍到许多可爱的画面，不过这个充满好奇心的海中尤物，可不是能够拿来当宠物的。话说别什么都想抓来当宠物啊！如果怀着想要饲养海豹的朋友，这里不妨提供大家一个过过干瘾的办法。首先：你要先养一只狗。然后：准备一件长袖棉T。接着，把狗...",
 "commentNum": 0,
 "contentType": "N",
 "isHot": null,
 "newsId": "38660",
 "picList": [
 "1458378666892033172.jpg",
 "1458378667002076726.jpg",
 "1458378667087021123.jpg"
 ],
 "pubDateStr": "03-19 17:11",
 "readNum": 48,
 "src": "宠物地带",
 "title": "脑洞大开的网友：如果你很想养海豹，你得先准备一只狗和长袖棉T"
 },
 */

@property (nonatomic, copy) NSString * abstr;
@property (nonatomic, copy) NSString * commentNum;
@property (nonatomic, copy) NSString * contentType;
@property (nonatomic, copy) NSString * isHot;
@property (nonatomic, copy) NSString * newsId;
@property (nonatomic, copy) NSArray * picList;
@property (nonatomic, copy) NSString * pubDateStr;
@property (nonatomic, copy) NSString * readNum;
@property (nonatomic, copy) NSString * src;
@property (nonatomic, copy) NSString * title;


/** 通过查询的结果, 实例化模型 */
+ (instancetype)modelWithResultSet:(FMResultSet *)set;






@end
