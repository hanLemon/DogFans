//
//  PhotoTableViewCell.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "PhotoTableViewCell.h"

#import "DeliciousModel.h"

@interface PhotoTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;


@end


@implementation PhotoTableViewCell


- (void)setModel:(PhotoModel *)model
{
    _model = model ;
    [self sendSubviewToBack:self.backImage];
    NSString *path = [NSString stringWithFormat:@"http://cwsjgm.cms.palmtrends.com//%@",model.icon];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"011.jpg"]];
    self.iconImageView.clipsToBounds = YES;
    self.iconImageView.layer.cornerRadius = 10 ;
  
    self.desLabel.text = [NSString stringWithFormat:@"      %@",model.des];

}













- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
