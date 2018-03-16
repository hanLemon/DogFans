
#import "HotNewsTwoTableViewCell.h"

#define margin 5
#define height_little 20



@interface HotNewsTwoTableViewCell ()

/*
 {
 recommand: {
 "list": [
 {
 "abstr": "亲人的海豹总被人们拍到许多可爱的画面，不过这个充满好奇心的海中尤物，可不是能够拿来当宠物的。话说别什么都想抓来当宠物啊！如果怀着想要饲养海豹的朋友，这里不妨提供大家一个过过干瘾的办法。首先：你要先养一只狗。然后：准备一件长袖棉T。接着，把狗...",
 "commentNum": 0,
 "contentType": "N",
 "isHot": null,
 "newsId": "38660",
 "picList": [
 "1458378666892033172.jpg",
 "1458378667002076726.jpg",
 "1458378667087021123.jpg"
 ],
 "pubDateStr": "03-19 17:11",
 "readNum": 48,
 "src": "宠物地带",
 "title": "脑洞大开的网友：如果你很想养海豹，你得先准备一只狗和长袖棉T"
 },
 */


@property (nonatomic, strong)UIImageView *firstIcon;

//@property (nonatomic, strong)UIButton *love;

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *srcLabel;
@property (nonatomic, strong)UILabel *pubDateStrLabel;
@property (nonatomic, strong)UILabel *commentNumLabel;
@property (nonatomic, strong)UILabel *readNumLabel;
@property (nonatomic, strong)UILabel *hotLabel;
@property (nonatomic, strong)UILabel *abstr;
 



@end

@implementation HotNewsTwoTableViewCell

- (void)setModel:(HotNewsModel *)model
{
    _model = model ;
    
    [self.firstIcon removeFromSuperview];
    [self.titleLabel removeFromSuperview];
    [self.srcLabel removeFromSuperview];
    [self.abstr removeFromSuperview];
    [self.pubDateStrLabel removeFromSuperview];
    [self.commentNumLabel removeFromSuperview];
    [self.readNumLabel removeFromSuperview];
//    [self.love removeFromSuperview];
    
    
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
        
    }    // 给 titleLabel.text 赋值
    
    _titleLabel = [[UILabel alloc] init ];
    _titleLabel.text = model.title;
    _titleLabel.numberOfLines = 0 ;
    _titleLabel.font = [UIFont systemFontOfSize:20];
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
    _firstIcon = [[UIImageView alloc] initWithFrame:CGRectMake(KSCR_W - imageW - margin, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
    NSString *firstImageUrl = [NSString stringWithFormat:@"%@%@",@"http://fdogpic.b0.upaiyun.com/comm/",model.picList[0]];
    [self.firstIcon sd_setImageWithURL:[NSURL URLWithString:firstImageUrl] placeholderImage:[UIImage imageNamed:@"009.jpg"]];
    
    [self.contentView addSubview:_firstIcon];
    
    
    _abstr = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.pubDateStrLabel.maxY, KSCR_W - self.firstIcon.width - 3 *margin, self.firstIcon.height)];
    _abstr.text = [NSString stringWithFormat:@"     %@",model.abstr] ;
    _abstr.textColor = [UIColor lightGrayColor];
    _abstr.lineBreakMode = NSLineBreakByWordWrapping ;
    _abstr.numberOfLines = 5 ;
    _abstr.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_abstr];

    
    
    _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
    self.commentNumLabel.text = [NSString stringWithFormat:@"评论：%@",model.commentNum];
    _commentNumLabel.textColor = [UIColor orangeColor];
    _commentNumLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_commentNumLabel];
    
    
    _readNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 3 * 2, self.firstIcon.maxY, KSCR_W / 3 - margin, height_little)];
    _readNumLabel.textAlignment = NSTextAlignmentRight;
    _readNumLabel.textColor = [UIColor orangeColor];
    _readNumLabel.font = [UIFont systemFontOfSize:14];
    self.readNumLabel.text = [NSString stringWithFormat:@"阅读：%@",model.readNum];
    [self.contentView addSubview:_readNumLabel];
    
//    self.love = [[UIButton alloc] initWithFrame:CGRectMake(KSCR_W /3 * 2 - 20, self.firstIcon.maxY, 20, height_little)];
//    [_love setImage:[UIImage imageNamed:@"dislike"] forState:UIControlStateNormal];
//    [_love setImage:[UIImage imageNamed:@"like"] forState:UIControlStateSelected];
//    [_love addTarget:self action:@selector(clickLike:) forControlEvents:UIControlEventTouchUpInside];
//    [self.contentView addSubview:_love];
    
    
    _cellH = self.readNumLabel.maxY + 5 ;
}

//- (void)clickLike:(UIButton *)sender
//{
//    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
//    [dictM setObject:_model.newsId forKey:@"newsId"];
//    [dictM setObject:_model.commentNum forKey:@"commentNum"];
//    [dictM setObject:_model.contentType forKey:@"contentType"];
//    if ([_model valueForKey:@"isHot"]) {
//        [dictM setObject:_model.isHot forKey:@"isHot"];
//    }
//    [dictM setObject:_model.abstr forKey:@"abstr"];
//    [dictM setObject:_model.pubDateStr forKey:@"pubDateStr"];
//    [dictM setObject:_model.readNum forKey:@"readNum"];
//    [dictM setObject:_model.src forKey:@"src"];
//    [dictM setObject:_model.title forKey:@"title"];
//
//    NSString *tableName = @"C";
//      NSString *sql = @"create table if not exists C(newsId primary key, commentNum,contentType,isHot,abstr,pubDateStr,readNum,src,title)";
//    CSLDBManager *manager = [CSLDBManager defaultDBManager];
//  BOOL ret  =  [manager createTable:sql];
//    if (ret) {
//      BOOL retTwo  = [manager insertTable:tableName record:dictM];
//        if (retTwo) {
//            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(150, self.firstIcon.maxY, 150, height_little)];
//            label.textColor = [UIColor redColor];
//            label.text = @"喜欢  +1";
//            [self.contentView addSubview:label];
//            [UIView animateWithDuration:1.0 animations:^{
//                CGRect frame = label.frame;
//                frame.origin.y -= 70;
//                label.frame = frame;
//                label.alpha = 0;
//            } completion:^(BOOL finished) {
//                
//                [label removeFromSuperview];
//            }];
//            
//        }else{
//            NSLog(@"收藏失败");
//        }
//    }
//    
//    NSMutableDictionary *dictM2 = [NSMutableDictionary dictionary];
//    [dictM2 setObject:_model.newsId forKey:@"newsId"];
//    [dictM2 setObject:_model.picList[0] forKey:@"image1"];
//    NSString *sql2 = @"create table if not exists LikeTwo2(newsId primary key,image1)";
//    [manager createTable:sql2];
//    [manager insertTable:@"LikeTwo2" record:dictM2];
//
//    sender.userInteractionEnabled = NO;
//    sender.selected = YES;
//
//    
//}


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
//#pragma mark ----- abstr -----
//
//- (UILabel *)abstr
//{
//    if (_abstr == nil) {
//        _abstr = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.pubDateStrLabel.maxY, KSCR_W - self.firstIcon.width - 3 *margin, self.firstIcon.height)];
//        _abstr.textColor = [UIColor lightGrayColor];
//        _abstr.lineBreakMode = NSLineBreakByWordWrapping ;
//        _abstr.numberOfLines = 5 ;
//        _abstr.font = [UIFont systemFontOfSize:12];
//        
//        [self.contentView addSubview:_abstr];
//    }
//    return _abstr ;
//}
//
//
//
//- (UIImageView *)firstIcon
//{
//    if (_firstIcon == nil) {
//        
//        CGFloat imageW = (KSCR_W - 4 * margin) / 3 ;
//        
////        if ([_ret isEqualToString:@"B"]) {
////            _firstIcon = [[UIImageView alloc] initWithFrame:CGRectMake(margin, self.pubDateStrLabel.maxY, imageW ,imageW * 0.618 )];
////        }else if ([_ret isEqualToString:@"A"])
////        {
//            _firstIcon = [[UIImageView alloc] initWithFrame:CGRectMake(KSCR_W - imageW - margin, self.pubDateStrLabel.maxY, imageW, imageW * 0.618)];
////        }
//        [self.contentView addSubview:_firstIcon];
//    }
//    return _firstIcon;
//}

//
//- (UILabel *)commentNumLabel
//{
//    if (_commentNumLabel == nil) {
//        if (!self.firstIcon) {
//            _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.abstr.maxY, KSCR_W / 2 - margin, height_little)];
//        }else
//        {
//            _commentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
//            
//        }
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
//        if (!self.firstIcon) {
//            _readNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 2, self.abstr.maxY, KSCR_W / 2 - margin, height_little)];
//        }else{
//            _readNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(KSCR_W / 2, self.firstIcon.maxY, KSCR_W / 2 - margin, height_little)];
//        }
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
