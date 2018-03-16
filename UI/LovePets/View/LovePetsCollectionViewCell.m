//
//  LovePetsCollectionViewCell.m
//  DogFans
//
//  Created by qianfeng on 16/3/20.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "LovePetsCollectionViewCell.h"

@interface LovePetsCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LovePetsCollectionViewCell


- (void)setModel:(LovePetsModel *)model
{
    _model = model;
    NSString *imageUrl = [NSString stringWithFormat:@"%@",model.img];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"011.jpg"]];
    self.titleLabel.text = model.text;
}


- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake( 0, 0, self.width, self.width * 0.5)];
        [self.contentView addSubview:_iconImageView];
    }
    return _iconImageView;
}


- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.width * 0.5, self.width, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}







@end
