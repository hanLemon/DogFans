//
//  HotNewsTableViewCell.m
//  DogFans
//
//  Created by qianfeng on 16/3/19.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "HotNewsTableViewCell.h"
#import "DBMHotNewsOne.h"

#define margin 5
#define height_little 20



@interface HotNewsTableViewCell ()

@property (nonatomic, strong)UIImageView *firstIcon;
@property (nonatomic, strong)UIImageView *secondIcon;
@property (nonatomic, strong)UIImageView *thirdIcon;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *srcLabel;
@property (nonatomic, strong)UILabel *pubDateStrLabel;
@property (nonatomic, strong)UILabel *commentNumLabel;
@property (nonatomic, strong)UILabel *readNumLabel;
@property (nonatomic, strong)UILabel *hotLabel;
@property (nonatomic, copy)NSString *text;
@property (nonatomic, strong) UIButton *love;




@end

@implementation HotNewsTableViewCell

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
    [self.love removeFromSuperview];
    
    if ((NSNull *)model.isHot == [NSNull null]) {
        
    }else
    {
        if ([model.isHot isEqualToString:@"Y"]) {
            _hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 0, height_little, height_little )];
            self.hotLabel.text = @"热";
            _hotLabel.textColor = [UIColor whiteColor];
            _hotLabel.font = [UIFont systemFontOfSize:15];
            _hotLabel.backgroundColor = [UIColor redColor];
            [self.contentView addSubview:self.hotLabel];
        }

    }
  
    
    
    // 给 titleLabel.text 赋值
    
    _titleLabel = [[UILabel alloc] init ];
    _titleLabel.text = model.title;
    _titleLabel.numberOfLines = 0 ;
    _titleLabel.font = [UIFont systemFontOfSize:20];
    //        _titleLabel.textColor = [UIColor blackColor];
    CGRect rect = [_titleLabel.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}  context:nil];
    
    _titleLabel.frame = CGRectMake(margin, height_little, KSCR_W - 2*margin, rect.size.height);
    [self.contentView addSubview:_titleLabel];
    
    
    CGFloat titleY = self.titleLabel.maxY ;
    _srcLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin,titleY , KSCR_W / 2 - margin, height_little)];
    self.srcLabel.text = model.src;
    _srcLabel.textColor = [UIColor grayColor];
    _srcLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_srcLabel];

    _pubDateStrLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 2, titleY, KSCR_W / 2 - margin, height_little)];
    self.pubDateStrLabel.text = model.pubDateStr ;
    _pubDateStrLabel.textAlignment = NSTextAlignmentRight;
    _pubDateStrLabel.textColor = [UIColor lightGrayColor];
    _pubDateStrLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_pubDateStrLabel];

    CGFloat imageW = (KSCR_W - 4 * margin) / 3 ;
    _firstIcon = [[UIImageView alloc] initWithFrame:CGRectMake(margin, self.pubDateStrLabel.maxY, imageW ,imageW * 0.618 )];
    NSString *firstImageUrl = [NSString stringWithFormat:@"%@%@",@"http://fdogpic.b0.upaiyun.com/comm/",model.picList[0]];
    [self.firstIcon sd_setImageWithURL:[NSURL URLWithString:firstImageUrl] placeholderImage:[UIImage imageNamed:@"009.jpg"]];
    
    [self.contentView addSubview:_firstIcon];
    
    _secondIcon = [[UIImageView alloc] initWithFrame:CGRectMake( 2*margin + imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
    
    NSString *secondImageUrl = [NSString stringWithFormat:@"%@%@",@"http://fdogpic.b0.upaiyun.com/comm/",model.picList[1]];
    [self.secondIcon sd_setImageWithURL:[NSURL URLWithString:secondImageUrl] placeholderImage:[UIImage imageNamed:@"009.jpg"]];
    [self.contentView addSubview:_secondIcon];
    
    _thirdIcon = [[UIImageView alloc] initWithFrame:CGRectMake(3*margin + 2*imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
    NSString *thirdImageUrl = [NSString stringWithFormat:@"%@%@",@"http://fdogpic.b0.upaiyun.com/comm/",model.picList[2]];
    [self.thirdIcon sd_setImageWithURL:[NSURL URLWithString:thirdImageUrl] placeholderImage:[UIImage imageNamed:@"009.jpg"]];
    [self.contentView addSubview:_thirdIcon];
    
    
    _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
    self.commentNumLabel.text = [NSString stringWithFormat:@"评论：%@",model.commentNum];
    _commentNumLabel.textColor = [UIColor orangeColor];
    _commentNumLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_commentNumLabel];
    
    
   
    self.love = [[UIButton alloc] initWithFrame:CGRectMake(KSCR_W /3 * 2 - 20, self.firstIcon.maxY, 20, height_little)];
//    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
//    NSString *isSelected = [userDefault valueForKey:@"selected"];
//    if (isSelected) {
//        self.love.selected = YES;
//    }
    
    BOOL ret = [[DBMHotNewsOne sharedManager] modelIsExists:self.model];
    if (ret) {
        self.love.selected = YES;
    }
    
    [_love setImage:[UIImage imageNamed:@"dislike"] forState:UIControlStateNormal];
    [_love setImage:[UIImage imageNamed:@"like"] forState:UIControlStateSelected];
    
    if (self.love.selected) {
        [_love addTarget:self action:@selector(alertLike) forControlEvents:UIControlEventTouchUpInside];
    }else{
    [_love addTarget:self action:@selector(clickLike:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self.contentView addSubview:_love];

    _readNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 3 * 2, self.firstIcon.maxY, KSCR_W / 3 - margin, height_little)];
    _readNumLabel.textAlignment = NSTextAlignmentRight;
    _readNumLabel.textColor = [UIColor orangeColor];
    _readNumLabel.font = [UIFont systemFontOfSize:14];
    self.readNumLabel.text = [NSString stringWithFormat:@"阅读：%@",model.readNum];
    [self.contentView addSubview:_readNumLabel];
    
    _cellH = self.readNumLabel.maxY + 5 ;

}




- (void)clickLike:(UIButton *)sender
{
    [[DBMHotNewsOne sharedManager] addRecord:self.model];
 

            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W/3, self.firstIcon.maxY + 20, 150, height_little)];
            label.textColor = [UIColor redColor];
            label.text = @"喜欢  +1";
            [self.contentView addSubview:label];
            [UIView animateWithDuration:1.0 animations:^{
                CGRect frame = label.frame;
                frame.origin.y -= 100;
                label.frame = frame;
                label.alpha = 0;
            } completion:^(BOOL finished) {
                
                [label removeFromSuperview];
                
            }];
    
    sender.userInteractionEnabled = NO;
    sender.selected = YES;
}

- (void)alertLike
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W/4, self.firstIcon.maxY, 150, height_little)];
    label.textColor = [UIColor brownColor];
    label.text = @"您已经收藏过了";
    [self.contentView addSubview:label];
    [UIView animateWithDuration:1.0 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
    }];

}



//
//#pragma mark ----- 热门懒加载 -----
//
//- (UILabel *)hotLabel
//{
//    if (_hotLabel == nil) {
//        _hotLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 0, height_little, height_little )];
//        _hotLabel.textColor = [UIColor whiteColor];
//        _hotLabel.font = [UIFont systemFontOfSize:15];
//        _hotLabel.backgroundColor = [UIColor redColor];
//        [self.contentView addSubview:self.hotLabel];
//    }
//    return _hotLabel;
//}
//
//
//#pragma mark ----- 标题Title 懒加载 -----
//- (UILabel *)titleLabel
//{
//    if (_titleLabel == nil) {
//        
//        _titleLabel = [[UILabel alloc] init ];
//        _titleLabel.text = self.text;
//        _titleLabel.numberOfLines = 0 ;
//        _titleLabel.font = [UIFont systemFontOfSize:20];
////        _titleLabel.textColor = [UIColor blackColor];
//        CGRect rect = [_titleLabel.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}  context:nil];
//        
//        _titleLabel.frame = CGRectMake(margin, height_little, KSCR_W - 2*margin, rect.size.height);
//        [self.contentView addSubview:_titleLabel];
//    }
//    return _titleLabel;
//}
//
//
//- (UILabel *)srcLabel
//{
//    if (_srcLabel == nil) {
//        CGFloat titleY = self.titleLabel.maxY ;
//        _srcLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin,titleY , KSCR_W / 2 - margin, height_little)];
//        _srcLabel.textColor = [UIColor grayColor];
//        _srcLabel.font = [UIFont systemFontOfSize:15];
//        [self.contentView addSubview:_srcLabel];
//    }
//    return _srcLabel;
//}
//
//
//- (UILabel *)pubDateStrLabel
//{
//    if (_pubDateStrLabel == nil) {
//        CGFloat titleY = self.titleLabel.maxY ;
//        _pubDateStrLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 2, titleY, KSCR_W / 2 - margin, height_little)];
//        _pubDateStrLabel.textAlignment = NSTextAlignmentRight;
//        _pubDateStrLabel.textColor = [UIColor lightGrayColor];
//        _pubDateStrLabel.font = [UIFont systemFontOfSize:15];
//        [self.contentView addSubview:_pubDateStrLabel];
//        
//    }
//    return _pubDateStrLabel;
//}
//
//
//
//- (UIImageView *)firstIcon
//{
//    if (_firstIcon == nil) {
//        
//        CGFloat imageW = (KSCR_W - 4 * margin) / 3 ;
//         _firstIcon = [[UIImageView alloc] initWithFrame:CGRectMake(margin, self.pubDateStrLabel.maxY, imageW ,imageW * 0.618 )];
//
//        [self.contentView addSubview:_firstIcon];
//    }
//    return _firstIcon;
//}
//
//
//- (UIImageView *)secondIcon
//{
//    if (_secondIcon == nil) {
//        CGFloat imageW = (KSCR_W - 4 * margin) / 3 ;
//        _secondIcon = [[UIImageView alloc] initWithFrame:CGRectMake( 2*margin + imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
//        [self.contentView addSubview:_secondIcon];
//    }
//    return _secondIcon;
//}
//
//- (UIImageView *)thirdIcon
//{
//    if (_thirdIcon == nil) {
//        CGFloat imageW = (KSCR_W - 4 * margin) / 3;
//        _thirdIcon = [[UIImageView alloc] initWithFrame:CGRectMake(3*margin + 2*imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
//        [self.contentView addSubview:_thirdIcon];
//    }
//    return _thirdIcon;
//}
//
//- (UILabel *)commentNumLabel
//{
//    if (_commentNumLabel == nil) {
//       _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
//        _commentNumLabel.textColor = [UIColor orangeColor];
//        _commentNumLabel.font = [UIFont systemFontOfSize:14];
//        [self.contentView addSubview:_commentNumLabel];
//    }
//    return _commentNumLabel;
//}
//
//
//
//- (UILabel *)readNumLabel
//{
//    if (_readNumLabel == nil) {
//
//        _readNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 2, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
//        _readNumLabel.textAlignment = NSTextAlignmentRight;
//        _readNumLabel.textColor = [UIColor orangeColor];
//        _readNumLabel.font = [UIFont systemFontOfSize:14];
//        [self.contentView addSubview:_readNumLabel];
//    }
//    return _readNumLabel;
//}
//


//
//- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//
//        
//        self.titleLabel.font = [UIFont systemFontOfSize:20];
//        
//        CGRect rect = [_titleLabel.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}  context:nil];
//        
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, height_little, KSCR_W - 2*margin, rect.size.height)];
//        [self.contentView addSubview:_titleLabel];
//
//        
////self.srcLabel
//        
//        self.srcLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.titleLabel.maxY, KSCR_W / 2 - margin, height_little)];
//        self.srcLabel.textColor = [UIColor lightGrayColor];
//        self.srcLabel.font = [UIFont systemFontOfSize:15];
//        
////self.pubDateStrLabel
//        
//        self.pubDateStrLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 2, height_little, KSCR_W / 2 - margin, height_little)];
//        self.pubDateStrLabel.textAlignment = NSTextAlignmentRight;
//        self.pubDateStrLabel.textColor = [UIColor lightGrayColor];
//        self.pubDateStrLabel.font = [UIFont systemFontOfSize:15];
//        
//// 三张图片
//        
//        CGFloat imageW = KSCR_W - 4 * margin;
//        self.firstIcon = [[UIImageView alloc] initWithFrame:CGRectMake(margin, self.pubDateStrLabel.maxY, imageW ,imageW * 0.618 )];
//        self.secondIcon = [[UIImageView alloc] initWithFrame:CGRectMake( 2*margin + imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
//        self.thirdIcon = [[UIImageView alloc] initWithFrame:CGRectMake(3*margin + imageW, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
//        
////self.commentNumLabel
//        
//        self.commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
//        self.commentNumLabel.textColor = [UIColor orangeColor];
//        self.commentNumLabel.font = [UIFont systemFontOfSize:14];
//        
////self.readNumLabel
//        
//        self.readNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W, self.firstIcon.maxY, KSCR_W - margin, height_little)];
//        self.readNumLabel.textAlignment = NSTextAlignmentRight;
//        self.readNumLabel.textColor = [UIColor orangeColor];
//        self.readNumLabel.font = [UIFont systemFontOfSize:14];
//        
//        
//        
//        // cell 的高度
//        
//        self.cellH = self.readNumLabel.maxY + 5 ;
//        
//        [self addSubview:_srcLabel];
//        [self addSubview:_pubDateStrLabel];
//        [self addSubview:_firstIcon];
//        [self addSubview:_secondIcon];
//        [self addSubview:_thirdIcon];
//        [self addSubview:_commentNumLabel];
//        [self addSubview:_readNumLabel];
//    }
//    return self;
//}








@end
