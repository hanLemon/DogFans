//
//  BaseViewController.h
//  DogFans
//
//  Created by qianfeng on 16/3/16.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property(nonatomic,copy)NSString *path;


/**
 *  数据源
 */
@property (nonatomic, strong)NSMutableArray *dataSource;

/**
 *  数据请求
 *
 *  @param method    <#method description#>
 *  @param urlString <#urlString description#>
 *  @param dict      <#dict description#>
 */
- (void) request:(NSString *)method url:(NSString *)urlString parameters:(NSDictionary *)dict;

/**
 *  数据解析
 *
 *  @param data <#data description#>
 */
- (void) parserData:(id)data;




- (void)LoadIndicatorOneTime;

/**
 *  显示加载动画
 */
- (void)showLoadView;



- (void)hideLoadView;



































@end
