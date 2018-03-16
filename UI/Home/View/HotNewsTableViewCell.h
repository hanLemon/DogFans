//
//  HotNewsTableViewCell.h
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotNewsModel.h"

@interface HotNewsTableViewCell : UITableViewCell

@property (nonatomic, strong)HotNewsModel *model;

@property (nonatomic, assign)CGFloat cellH;

@end
