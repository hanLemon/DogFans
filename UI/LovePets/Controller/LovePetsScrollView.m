//
//  LovePetsScrollView.m
//  DogFans
//
//  Created by qianfeng on 16/3/22.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "LovePetsScrollView.h"
#import "BigPictureViewController.h"
#import "VedioPlayViewController.h"

#define margin 10


@interface LovePetsScrollView ()<UIScrollViewDelegate,NSURLConnectionDataDelegate>
{
    UIScrollView *_scrollView ;
    NSString *_title;
    NSArray *_arrayOfImage;
    NSDictionary *_dict;
    NSMutableData *_dataM;
    NSString *_imageName;
}

@end

@implementation LovePetsScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
        self.view.backgroundColor = [UIColor whiteColor];
    // 每次创建界面的时候 加载小菊花
    [self creatIndicator];
    
    // 添加工具栏
//    [self addToolBar];
    
    // 请求数据
    [self requestData];


}

- (void)creatIndicator
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:nil forKey:@"Six"];
    [userDefaults synchronize];// 同步数据
}


- (void)requestData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [userDefaults objectForKey:@"Six"];
    if (str == nil) {
        // 加载小菊花
        [self showLoadView];
        [userDefaults setObject:@"String" forKey:@"Six"];
    }
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:self.path parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self useData:responseObject];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
 
}

- (void)useData:(id)data
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    _title = dict[@"data"][@"title"];
    NSArray *array = dict[@"data"][@"text"];
    [self.dataSource addObjectsFromArray: array];
    
    // 添加滚动视图
    [self addScrollView];
    
    [self hideLoadView];
}



- (void)addScrollView
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self ;
    [self.view addSubview:_scrollView];
    
    UILabel *titelLabel = [[UILabel alloc]init];
    titelLabel.text = _title;
    titelLabel.numberOfLines = 0;
    titelLabel.font = [UIFont systemFontOfSize:22];
    CGRect  rect = [titelLabel.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22]} context:nil];
    titelLabel.frame = CGRectMake(margin, margin, KSCR_W - 2*margin, rect.size.height);

    [_scrollView addSubview:titelLabel];
    /**
     *  文字数组
     */
    NSMutableArray *textArray = [NSMutableArray array];
    /**
     *  图片数组
     */
    NSMutableArray *imageArray = [NSMutableArray array];
    /**
     *  视频 字典
     */
    NSDictionary *videoDictionary ;
    for (NSDictionary *dic in self.dataSource) {
        if (dic[@"text"]) {
            NSMutableString *strM = [NSMutableString stringWithFormat:@"%@", dic[@"text"]];
            NSRange range = [strM rangeOfString:@"&gt;&gt;"];
            if (range.length>0) {
                [strM replaceCharactersInRange:range withString:@"   "];
            }
            NSRange rangeTwo = [strM rangeOfString:@"&nbsp;"];
            if (rangeTwo.length>0) {
                [strM replaceCharactersInRange:rangeTwo withString:@"/n"];
            }
                //把指定范围的字符串替换
            if (strM.length > 10) {
                [textArray addObject:strM];
            }
        }
        if (dic[@"img"]) {
            [imageArray addObject:dic[@"img"]];
        }
        if (dic[@"video"]) {
            videoDictionary = [NSDictionary dictionaryWithDictionary:dic[@"video"]];
            // 给 _dict 初始化
            _dict = [NSDictionary dictionaryWithDictionary:dic[@"video"]];
        }
    }
    
   // 定义 最大Y
    CGFloat maxY = titelLabel.maxY;
    UIFont *font = [UIFont systemFontOfSize:18];
    if (textArray.count>0) {
        UILabel *OneLabel = [UILabel new];
        OneLabel.text =  [NSString stringWithFormat:@"   %@",textArray[0]] ;
        OneLabel.textColor = [UIColor lightGrayColor];
        OneLabel.numberOfLines = 0;
        OneLabel.font = font;
        rect = [OneLabel.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
        OneLabel.frame = CGRectMake(margin, maxY + margin, KSCR_W - 2*margin, rect.size.height);
        [_scrollView addSubview:OneLabel];
        [textArray removeObjectAtIndex:0];
        
         maxY = OneLabel.maxY;
    }
    
    
    
    if (textArray.count > 0) {
        UILabel *TwoLable = [UILabel new];
        TwoLable.text =  [NSString stringWithFormat:@"   %@",textArray[0]];
        TwoLable.font = font;
        TwoLable.textColor = [UIColor lightGrayColor];
        TwoLable.numberOfLines = 0;
        rect = [TwoLable.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
        TwoLable.frame = CGRectMake(margin, maxY + margin, KSCR_W - 2*margin, rect.size.height);
        [_scrollView addSubview:TwoLable];
        [textArray removeObjectAtIndex:0];
        maxY = TwoLable.maxY;
    }
    
    
// 去除不想要的图片
    if ([self.path isEqualToString: scrollView_Four]) {
        [imageArray removeObjectAtIndex:0];
    }else if ([self.path isEqualToString:B2])
    {
        [imageArray removeObjectAtIndex:0];
        [imageArray removeObjectAtIndex:6];
        [imageArray removeObjectAtIndex:8];
    }else if ([self.path isEqualToString:C2])
    {
        [imageArray removeObjectAtIndex:1];
    }else if ([self.path isEqualToString:C3])
    {
        [imageArray removeObjectAtIndex:0];
    }else if ([self.path isEqualToString:E1])
    {
        [imageArray removeObjectAtIndex:0];
    }else if ([self.path isEqualToString:E2])
    {
        [imageArray removeObjectAtIndex:2];
    }
   
    _arrayOfImage = imageArray;
    if (imageArray.count > 0) {

    for (int i = 0; i < imageArray.count; i ++) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
        UILongPressGestureRecognizer *longPressGes = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressImage:)];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*margin, maxY, KSCR_W - 4*margin, KSCR_W )];
        
        imageView.tag = 100 + i;
        imageView.userInteractionEnabled = YES;
        // imageView 添加 点击/长按手势
        [imageView addGestureRecognizer:tapGes];
        [imageView addGestureRecognizer:longPressGes];
        
        NSString *sourceImage = imageArray[i][@"source"];
        [imageView sd_setImageWithURL:[NSURL URLWithString:sourceImage] placeholderImage:[UIImage imageNamed:@"067.jpg"]];
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 5;
        
        
        [_scrollView addSubview:imageView];
        maxY = imageView.maxY + margin;
    
        if (videoDictionary) {
            
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapVedioImage:)];
            
            UIImageView *videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*margin, maxY, KSCR_W - 4*margin, KSCR_W )];
            
            videoImageView.userInteractionEnabled = YES;
            // imageView 添加 点击/长按手势
            [videoImageView addGestureRecognizer:tapGes];
            
            [videoImageView sd_setImageWithURL:[NSURL URLWithString:videoDictionary[@"img"]] placeholderImage:[UIImage imageNamed:@"067.jpg"]];
            [_scrollView addSubview:videoImageView];
            // 把这个字典置为空
            videoDictionary = nil;
             maxY = videoImageView.maxY + margin;
        }

        
        if (textArray.count > 0) {
            UILabel *label = [[UILabel alloc] init];
            label.text =  [NSString stringWithFormat:@"    %@",textArray[0]];
            label.textColor = [UIColor lightGrayColor];
            label.numberOfLines = 0;
            rect = [label.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
            label.frame = CGRectMake(margin, maxY, KSCR_W - 2*margin, rect.size.height);
            [_scrollView addSubview:label];
            [textArray removeObjectAtIndex:0];
            maxY = label.maxY;
        }

    }
    }
    // 如果图片数组不存在  直接添加 video 图片
    if (videoDictionary) {
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapVedioImage:)];
        
        UIImageView *videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2*margin, maxY, KSCR_W - 4*margin, KSCR_W )];
        
        videoImageView.userInteractionEnabled = YES;
        // imageView 添加 点击/长按手势
        [videoImageView addGestureRecognizer:tapGes];
        
        [videoImageView sd_setImageWithURL:[NSURL URLWithString:videoDictionary[@"img"]] placeholderImage:[UIImage imageNamed:@"067.jpg"]];
        [_scrollView addSubview:videoImageView];
        // 把这个字典置为空
        videoDictionary = nil;
        maxY = videoImageView.maxY + margin;
    }
    
    if (textArray) {
        for (int i = 0; i < textArray.count; i ++) {
        
        UILabel *label = [[UILabel alloc] init];
        label.textColor = [UIColor lightGrayColor];
        label.numberOfLines = 0;
        label.text =  [NSString stringWithFormat:@"      %@",textArray[i]];
        rect = [label.text boundingRectWithSize:CGSizeMake(KSCR_W - 2*margin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
        label.frame = CGRectMake(margin, maxY, KSCR_W - 2*margin, rect.size.height);
        [_scrollView addSubview:label];
        maxY = label.maxY;

    }
    
    }
    
    _scrollView.contentSize = CGSizeMake(KSCR_W, maxY);
}



#pragma mark ----- 点击进入视频播放界面 -----
- (void)tapVedioImage:(UITapGestureRecognizer *)sender
{
    VedioPlayViewController *vedioPlayVC = [VedioPlayViewController new];
    vedioPlayVC.vedio_url = _dict[@"v_url"];
    [self.navigationController pushViewController:vedioPlayVC animated:YES];
}
    
    
    
#pragma mark ----- 点击图片 进入下一轮播图 -----
- (void)tapImage:(UITapGestureRecognizer *)sender
{
    BigPictureViewController *bigVC = [[BigPictureViewController alloc]init];
    bigVC.imageArray = _arrayOfImage;
    bigVC.number = sender.view.tag - 100;
    [self.navigationController pushViewController:bigVC animated:YES];
}

#pragma mark ----- 长按图片 保存 -----
- (void)longPressImage:(UILongPressGestureRecognizer *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"保存图片" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *save = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // 下载图片
        NSString *imageUrl = _arrayOfImage[sender.view.tag - 100][@"source"];
        _imageName = imageUrl;
        NSURL *url = [NSURL URLWithString:imageUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
     }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:save];
    [alertController addAction:cancel];
    [self.navigationController presentViewController:alertController animated:YES completion:nil];
    
}
#pragma mark ----- Connection 代理方法 -----
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 开始请求数据
    _dataM = [NSMutableData data];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 获取数据
    [_dataM appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 获取数据结束
    NSString *sql = @"create table if not exists DownLoad(Id primary key,data)";
    BOOL ret = [[CSLDBManager defaultDBManager] createTable:sql];
    if (ret) {
        NSMutableDictionary *dictM2 = [NSMutableDictionary dictionary];
        [dictM2 setObject:_imageName forKey:@"Id"];
        [dictM2 setObject:_dataM forKey:@"data"];
        [[CSLDBManager defaultDBManager] insertTable:@"DownLoad" record:dictM2];
    }
    
    [UIView animateWithDuration:1.0 animations:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"图片保存成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.backgroundColor = [UIColor blackColor];
        alertController.view.alpha = 1;
        [self.navigationController presentViewController:alertController animated:YES completion:nil];
    }completion:^(BOOL finished) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
 
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // 请求失败
    [UIView animateWithDuration:1.0 animations:^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"图片保存失败" preferredStyle:UIAlertControllerStyleAlert];
        [self.navigationController presentViewController:alertController animated:YES completion:nil];

    }completion:^(BOOL finished) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
    
}


- (void)addToolBar
{
    self.navigationController.toolbarHidden = NO;

    UIBarButtonItem * itemOne = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(clickShareButton)];
    UIBarButtonItem * itemTwo = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"dislike"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(changeLike:)];
    UIBarButtonItem * itemThree = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"changeA"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(changeAttribute)];
    UIBarButtonItem * itemFour = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"color0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(changeBackgroundColor:)];

    //(2)空间均分占位符
    //UIBarButtonSystemItemFlexibleSpace
    UIBarButtonItem * spaceitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    self.toolbarItems = @[spaceitem,itemOne,spaceitem,itemTwo,spaceitem,itemThree,spaceitem,itemFour,spaceitem];
}

- (void)clickShareButton
{
    
}


- (void)changeLike:(UIBarButtonItem *)sender
{
    sender.image = [UIImage imageNamed:@"like"];
}



- (void)changeAttribute
{
    
}


- (void)changeBackgroundColor:(UIBarButtonItem *)sender
{
    
}

















@end
