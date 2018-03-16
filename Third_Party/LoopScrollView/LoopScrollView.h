//
//  WYScrollView.h
//  
//
//  Created by jacke－xu on 16/2/22.
//  Copyright © 2016年 jacke－xu. All rights reserved.
//

#import <UIKit/UIKit.h>

//遵循该代理就可以监控到网络滚动视图的index
@protocol LoopScrollViewDelegate <NSObject>
@optional

//点中网络滚动视图后触发
-(void)didSelectedNetImageAtIndex:(NSInteger)index;

//点中本地滚动视图后触发
-(void)didSelectedLocalImageAtIndex:(NSInteger)index;



@end

@interface LoopScrollView : UIView

//选中图片的索引
@property (nonatomic, strong) id <LoopScrollViewDelegate> delagate;

//占位图
@property (nonatomic, strong) UIImage *placeholderImage;

//滚动延时
@property (nonatomic, assign) NSTimeInterval AutoScrollDelay;

/**
 *  NO 中间 
    YES 自定义
 */


/**
 *  本地图片
 *
 *  @param frame      位置
 *  @param imageArray 加载本地图片
 *
 *  @return
 */
- (instancetype) initWithFrame:(CGRect)frame WithLocalImages:(NSArray *)imageArray WithLocalLabels:(NSArray *)LabelsArray;

/**
 *  加载网络图片
 *
 *  @param frame      位置大小
 *  @param imageArray 名字
 *
 *  @return
 */
- (instancetype) initWithFrame:(CGRect)frame WithNetImages:(NSArray *)imageArray;

@end
