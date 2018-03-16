//
//  HomeNextTableViewCell.m
//  DogFans
//
//  Created by qianfeng on 16/3/17.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HomeNextTableViewCell.h"
#import "HomeNextModel.h"
// 间隔
#define Interval 10
#define Height_title 25
#define Height_des   60


@interface HomeNextTableViewCell ()

@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *desLabel;


@end

@implementation HomeNextTableViewCell

- (void)setModel:(HomeNextModel *)model
{
    _model = model ;
    NSString *path = [NSString stringWithFormat:@"http://cwsjgm.cms.palmtrends.com//%@",model.icon];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"011.jpg"]];
    self.titleLabel.text = model.title;
    self.desLabel.text = [NSString stringWithFormat:@"      %@",model.des];
}

#pragma mark ----- 懒加载 -----
- (UIImageView *)iconImageView
{
    if (_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KSCR_W, KSCR_W * 0.5)];
        _iconImageView.clipsToBounds = YES;
        _iconImageView.layer.cornerRadius = 5;
        [self.contentView addSubview:_iconImageView];
    }
    return _iconImageView;
}


- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(Interval, _iconImageView.maxY, KSCR_W - 2 * Interval, Height_title)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}


- (UILabel *)desLabel
{
    if (_desLabel == nil) {
        _desLabel = [[UILabel alloc] initWithFrame:CGRectMake(Interval, _titleLabel.maxY + Interval / 2, KSCR_W - 2 * Interval, Height_des)];
        _desLabel.font = [UIFont systemFontOfSize:15];
        _desLabel.numberOfLines = 3;
        [self.contentView addSubview:_desLabel];
    }
    return _desLabel;
}





















- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
