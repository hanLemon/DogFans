//
//  MineViewController.m
//  DogFans
//
//  Created by qianfeng on 16/3/25.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "MineViewController.h"
#import "FactoryUI.h"
#import "AppDelegate.h"

#import "CSLClearCache.h"
#import "MyLoveViewController.h"
#import "MyDownLoadViewController.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIView *_drakView;
    UITableView *_tableView;
    UIImageView *_headerImageView;
}
@property (nonatomic, strong)NSArray *logoArray;
@property (nonatomic, strong)NSArray *titleArray;

@end
@implementation MineViewController

static float ImageOriginHeight = 200;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTableView];
    
    // 添加头视图
    [self addTableViewHeaderView];
}


- (void)addTableViewHeaderView
{
    _headerImageView = [FactoryUI creatImageViewWithFrame:CGRectMake(0, -ImageOriginHeight, KSCR_W, ImageOriginHeight) imageName:@"dog.jpg"];
    [_tableView addSubview:_headerImageView];
    // 设置tableView 的内容从 ImageOriginHeight处 开始显示
    _tableView.contentInset = UIEdgeInsetsMake(ImageOriginHeight, 0, 49, 0);
    
    _drakView = [FactoryUI creatViewWithFrame:[UIScreen mainScreen].bounds];
}

- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 60 ;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
        //加尾巴
        if (indexPath.row == 0||indexPath.row == 1||indexPath.row == 2|| indexPath.row == 4|| indexPath.row == 5) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        //加switch
        if (indexPath.row == 3) {
            UISwitch * swit = [[UISwitch alloc]initWithFrame:CGRectMake(KSCR_W - 70, 10, 40, 30)];
            //设置开启之后的颜色
            swit.onTintColor = [UIColor greenColor];
            swit.tag = indexPath.row;
            //添加响应方法
            [swit addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
            [cell.contentView addSubview:swit];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //赋值
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.logoArray[indexPath.row]];
    return cell;
}

- (void)changeValue:(UISwitch *)swit
{
    if (swit.tag == 3) {
        //夜间模式
        if (swit.on) {
            //添加半透明View到Window上
            UIApplication * app = [UIApplication sharedApplication];
            AppDelegate * delegate = app.delegate;
            //设置View的背景色
            _drakView.backgroundColor = [UIColor blackColor];
            _drakView.alpha = 0.3;
            //关闭View的用户交互(响应者链）
            _drakView.userInteractionEnabled = NO;
            [delegate.window addSubview:_drakView];
        }else{
            [_drakView removeFromSuperview];
        }
    }
}

#pragma mark ----- 实现ScrollView代理方法 -----
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{//头视图放大的思想 : 通过改变ScrollView的偏移量来改变图片的frame
    if (scrollView == _tableView) {
        float yOffSet = scrollView.contentOffset.y ;
        float xOffSet = (yOffSet + ImageOriginHeight)/2;
        if (yOffSet < -ImageOriginHeight) {
            // 改变ImageView 的frame
            CGRect rect = _headerImageView.frame;
            rect.origin.y = yOffSet;
            rect.size.height = -yOffSet;
            rect.origin.x = xOffSet;
            rect.size.width = KSCR_W + fabsf(xOffSet) * 2;
            _headerImageView.frame = rect;
        }
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {

        case 0:{
          MyLoveViewController *loveVC = [MyLoveViewController new];
            loveVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:loveVC animated:YES];
        }
            break;
        case 1:{
            MyDownLoadViewController *downLoad = [MyDownLoadViewController new];
            downLoad.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:downLoad animated:YES];
        }
            break;
        case 2:{
            // 清除缓存
            CSLClearCache *clearCache = [[CSLClearCache alloc] init];
    
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"清除缓存" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
                [UIView animateWithDuration:1.0 animations:^{
                     UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"清理缓存成功" message:[NSString stringWithFormat:@"已清理%.2f M 缓存",[clearCache clearCache]] preferredStyle:UIAlertControllerStyleAlert];
                    [self.navigationController presentViewController:alertController animated:YES completion:nil];
                } completion:^(BOOL finished) {
                    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                }];
            }];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:sure];
            [alertController addAction:cancel];
            [self.navigationController presentViewController:alertController animated:YES completion:nil];

            
        }
            break;
        case 4:{
            [Auxiliary alertWithTitle:@"免责声明" message:@"本APP旨在技术分享，不涉及任何商业利益" button:1 done:nil];
        }
            break;
        case 5:{
            [Auxiliary alertWithTitle:@"关于" message:@"爱狗狗APP -欢迎您反馈意见\n 邮箱：1121137905@qq.com" button:1 done:nil];
        }
            break;

        default:
            break;
    }
}



- (NSArray *)logoArray
{
    if (_logoArray == nil) {
        _logoArray = @[@"iconfont-iconfontaixinyizhan",@"iconfont-xiazai",@"iconfont-lajitong",@"iconfont-yejianmoshi",@"iconfont-shengming",@"iconfont-guanyu"];

    }
    return _logoArray ;
}
- (NSArray *)titleArray
{
    if (_logoArray == nil) {
        _titleArray = @[@"我的收藏",@"我的下载",@"清除缓存",@"夜间模式",@"免责声明",@"关于"];
        
    }
    return _titleArray ;
}
























@end
