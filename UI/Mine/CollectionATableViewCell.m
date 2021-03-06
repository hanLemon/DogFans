//
//  CollectionATableViewCell.m
//  DogFans
//
//  Created by qianfeng on 16/3/28.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "CollectionATableViewCell.h"


#define margin 5
#define height_little 20

@interface CollectionATableViewCell ()

@property (nonatomic, strong)UIImageView *firstIcon;
@property (nonatomic, strong)UIImageView *secondIcon;
@property (nonatomic, strong)UIImageView *thirdIcon;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *srcLabel;
@property (nonatomic, strong)UILabel *pubDateStrLabel;
@property (nonatomic, strong)UILabel *commentNumLabel;
@property (nonatomic, strong)UILabel *readNumLabel;
@property (nonatomic, strong)UILabel *hotLabel;
@property (nonatomic, copy)  NSString *text;


@end

@implementation CollectionATableViewCell

- (void)setModel:(HotNewsModel *)model
{
    _model = model ;
    
    //    for (UIView *view in self.subviews) {
    //        [view removeFromSuperview];
    //    }
    
    [self.firstIcon removeFromSuperview];
    [self.secondIcon removeFromSuperview];
    [self.thirdIcon removeFromSuperview];
    [self.titleLabel removeFromSuperview];
    [self.srcLabel removeFromSuperview];
    [self.pubDateStrLabel removeFromSuperview];
    [self.commentNumLabel removeFromSuperview];
    [self.readNumLabel removeFromSuperview];
    
    //    if ([model.isHot isEqualToString:@"Y"]) {
    //        _hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 0, height_little, height_little )];
    //        self.hotLabel.text = @"热";
    //        _hotLabel.textColor = [UIColor whiteColor];
    //        _hotLabel.font = [UIFont systemFontOfSize:15];
    //        _hotLabel.backgroundColor = [UIColor redColor];
    //        [self.contentView addSubview:self.hotLabel];
    //    }
    
    // 给 titleLabel.text 赋值
    
    _titleLabel = [[UILabel alloc] init ];
    _titleLabel.text = [model valueForKey:@"title"];
    _titleLabel.numberOfLines = 0 ;
    _titleLabel.font = [UIFont systemFontOfSize:20];
     CGRect rect = [_titleLabel.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}  context:nil];
    
    _titleLabel.frame = CGRectMake(margin, height_little, KSCR_W - 2*margin, rect.size.height);
    [self.contentView addSubview:_titleLabel];
    
    
    CGFloat titleY = self.titleLabel.maxY ;
    _srcLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin,titleY , KSCR_W / 2 - margin, height_little)];
    self.srcLabel.text = [model valueForKey:@"src"];
    _srcLabel.textColor = [UIColor grayColor];
    _srcLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_srcLabel];
    
    _pubDateStrLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 2, titleY, KSCR_W / 2 - margin, height_little)];
    self.pubDateStrLabel.text = [model valueForKey:@"pubDateStr"] ;
    _pubDateStrLabel.textAlignment = NSTextAlignmentRight;
    _pubDateStrLabel.textColor = [UIColor lightGrayColor];
    _pubDateStrLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_pubDateStrLabel];
    
    CGFloat imageW = (KSCR_W - 4 * margin) / 3 ;
    _firstIcon = [[UIImageView alloc] initWithFrame:CGRectMake(margin, self.pubDateStrLabel.maxY, imageW ,imageW * 0.618 )];
    NSString *firstImageUrl = [NSString stringWithFormat:@"%@%@",@"http://fdogpic.b0.upaiyun.com/comm/",[model valueForKey:@"picList"][@"image1"]];
    [self.firstIcon sd_setImageWithURL:[NSURL URLWithString:firstImageUrl] placeholderImage:[UIImage imageNamed:@"009.jpg"]];
    
    [self.contentView addSubview:_firstIcon];
    
    _secondIcon = [[UIImageView alloc] initWithFrame:CGRectMake( 2*margin + imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
    
    NSString *secondImageUrl = [NSString stringWithFormat:@"%@%@",@"http://fdogpic.b0.upaiyun.com/comm/",[model valueForKey:@"picList"][@"image2"]];
    [self.secondIcon sd_setImageWithURL:[NSURL URLWithString:secondImageUrl] placeholderImage:[UIImage imageNamed:@"009.jpg"]];
    [self.contentView addSubview:_secondIcon];
    
    _thirdIcon = [[UIImageView alloc] initWithFrame:CGRectMake(3*margin + 2*imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
    NSString *thirdImageUrl = [NSString stringWithFormat:@"%@%@",@"http://fdogpic.b0.upaiyun.com/comm/",[model valueForKey:@"picList"][@"image3"]];
    [self.thirdIcon sd_setImageWithURL:[NSURL URLWithString:thirdImageUrl] placeholderImage:[UIImage imageNamed:@"009.jpg"]];
    [self.contentView addSubview:_thirdIcon];
    
    
    _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
    self.commentNumLabel.text = [NSString stringWithFormat:@"评论：%@",[model valueForKey:@"commentNum"]];
    _commentNumLabel.textColor = [UIColor orangeColor];
    _commentNumLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_commentNumLabel];
    
    _readNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 3 * 2, self.firstIcon.maxY, KSCR_W / 3 - margin, height_little)];
    _readNumLabel.textAlignment = NSTextAlignmentRight;
    _readNumLabel.textColor = [UIColor orangeColor];
    _readNumLabel.font = [UIFont systemFontOfSize:14];
    self.readNumLabel.text = [NSString stringWithFormat:@"阅读：%@",[model valueForKey:@"readNum"]];
    [self.contentView addSubview:_readNumLabel];

    _cellH = self.readNumLabel.maxY + 5 ;
    
}


@end
