//
//  HomeTableViewCell.m
//  DogFans
//
//  Created by qianfeng on 16/3/18.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HomeTableViewCell.h"



@interface HomeTableViewCell ()


@end

@implementation HomeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KSCR_W, 0.4 * KSCR_W)]
        ;
//        self.iconImage.clipsToBounds = YES;
//        self.iconImage.layer.cornerRadius = 10 ;
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.iconImage.height * 4/5, KSCR_W * 0.3, self.iconImage.height * 1/5)];
        self.label.font = [UIFont systemFontOfSize:18];
        self.label.backgroundColor = [UIColor brownColor];
        self.label.clipsToBounds = YES;
        self.label.layer.cornerRadius = 10 ;
        self.label.alpha = 0.5;
        self.label.textColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        
        [self.contentView addSubview:self.iconImage];
        [self.contentView addSubview:self.label];
    }
    return self;
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
