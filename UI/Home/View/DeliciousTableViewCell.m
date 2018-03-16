//
//  DeliciousTableViewCell.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "DeliciousTableViewCell.h"


@interface DeliciousTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation DeliciousTableViewCell

- (void)setModel:(DeliciousModel *)model
{
    _model = model ;
    
    NSString *path = [NSString stringWithFormat:@"http://cwsjgm.cms.palmtrends.com//%@",model.icon];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"011.jpg"]];
    self.titleLabel.text = model.title;
   
}
















- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
