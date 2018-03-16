//
//  LovePets.m
//  DogFans
//
//  Created by qianfeng on 16/3/20.
//  Copyright © 2016年 hanHeFeng. All rights reserved.
//

#import "LovePets.h"
#import "LovePetsModel.h"
#import "LovePetsCollectionViewCell.h"
#import "LovePetsScrollView.h"
#import "LoopScrollView.h"
#import "CategoryViewController.h"

#import "CategoryButton.h"


#define margin 8
#define rID @"CELL_A"


@interface LovePets ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,LoopScrollViewDelegate>

@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) NSArray *localImageArray;
@property (nonatomic, strong) NSArray *localTitleArray;
@property (nonatomic, strong) NSArray *pathArray;

@property (nonatomic, strong) UIView *headerView;


@end

@implementation LovePets

- (void)viewDidLoad {
    [super viewDidLoad];

    [self requestData];
    
    [self creatCollectionView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (UIView *)headerView
{
    if (_headerView == nil) {
        self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, KSCR_W, 0.65 *KSCR_W)];
        _headerView.backgroundColor = UIColorRGB(254, 250, 247);
        [self creatScrollView];
        [self addButton];
        
        [self.view addSubview:_headerView];
    }
    return _headerView;
}


- (void)creatScrollView
{
    //设置本地scrollView的Frame及所需图片
    LoopScrollView *localScrollView = [[LoopScrollView alloc]initWithFrame:CGRectMake(0, 0, KSCR_W, 0.4 *KSCR_W) WithLocalImages:self.localImageArray WithLocalLabels:self.localTitleArray];
        //设置滚动延时
    localScrollView.AutoScrollDelay = 2;
    //获取本地图片的index
    localScrollView.delagate = self;
    
    [_headerView addSubview:localScrollView];
    
}

- (void)addButton
{
    NSArray *nameArray = @[@"综合圈",@"小型犬",@"中型犬",@"大型犬"];
    NSArray *imageArray = @[@"comprehensive",@"littleDog",@"middleDog",@"bigDog"];
    CGFloat btnW = KSCR_W / 4 ;
    for (int i = 0; i < 4; i ++) {
        CategoryButton *button = [[CategoryButton alloc] initWithFrame:CGRectMake(btnW * i, 0.4*KSCR_W, btnW, btnW)];
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        button.imageView.contentMode = UIViewContentModeScaleAspectFit ;
        button.tag = 200 + i ;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_headerView addSubview:button];
    }
}

- (void)clickButton:(UIButton *)sender
{
    CategoryViewController *categoryVC = [CategoryViewController new];

    switch (sender.tag - 200) {
        case 0:
            categoryVC.page = 1;
            break;
        case 1:
            categoryVC.page = 2;
            break;
        case 2:
            categoryVC.page = 3;
            break;
        case 3:
            categoryVC.page = 4;
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:categoryVC animated:YES];

}




- (void)creatCollectionView
{
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = (KSCR_W - 3 * margin) / 2;
    
    _layout.itemSize = CGSizeMake(width, width / 2 + 20);
    _layout.minimumInteritemSpacing = margin ;
    _layout.minimumLineSpacing = 0;
    _layout.sectionInset = UIEdgeInsetsMake(5, margin, 15, margin);
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical ;
    
    self.collection = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
    _collection.delegate = self;
    _collection.dataSource = self;
    _collection.backgroundColor = [UIColor whiteColor];
    _collection.contentInset = UIEdgeInsetsMake(0, 0, 40, 0);
    _collection.showsVerticalScrollIndicator = NO;
     _collection.backgroundColor = UIColorRGB(254, 250, 247);
    [_collection registerClass:[LovePetsCollectionViewCell class] forCellWithReuseIdentifier:rID];
    [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];

    [self.view addSubview:self.collection];
    
}


- (void)requestData
{
    [self request:@"GET" url:LovePets_Title parameters:nil];
}


- (void)parserData:(id)data
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *array = dict[@"data"];
    for (int i = 2; i < array.count; i ++) {

        NSArray *arr = array[i][@"data"];
        if (arr.count > 0) {
            [self.dataSource addObject:[LovePetsModel arrayOfModelsFromDictionaries:arr]];
        }
        
    }
    [self.collection reloadData];
}





#pragma mark ----- collectionView 代理——数据源方法 -----

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataSource.count + 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 0 ;
    }
    else{
    
    NSArray *array = self.dataSource[section - 1];
    
    return array.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LovePetsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rID forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
      
    }
    else{
    NSArray *array = self.dataSource[indexPath.section - 1] ;
    LovePetsModel *model = array[indexPath.item];
    cell.model = model;
    cell.backgroundColor = UIColorRGB(254, 250, 247);

    }
    return cell ;
}

// 组头视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(self.headerView.width, self.headerView.height + 64);
    }
    
    return CGSizeMake(KSCR_W, 20);
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
//    view.backgroundColor = UIColorRGB(254, 250, 247);
    // 在添加视图之前,先移除原来上面的视图
    for (UIView *subView in view.subviews) {
        [subView removeFromSuperview];
    }
    if (indexPath.section == 0) {
        [view addSubview:self.headerView];
        return view;
    }
    
     UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, KSCR_W, 20)];
    label.textColor = [UIColor brownColor];
    label.font = [UIFont systemFontOfSize:20];
    switch (indexPath.section) {
          
        case 1:
        label.text  =  @"汪星资讯";
            break;
        case 2:
            label.text  =  @"萌宠爱搞怪";
            break;
        case 3:
            label.text  =  @"狗狗视频";
            break;
        case 4:
            label.text  =  @"养护大百科";
            break;
        case 5:
            label.text  =  @"狗狗训练营";
            break;
        case 6:
            label.text  =  @"狗狗健康馆";
            break;
            
        default:
            break;
    }
    [view addSubview:label];
    return view;
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    LovePetsScrollView *scrollVC = [LovePetsScrollView new];
    if (indexPath.section == 0) {
        return;
    }
   else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            NSString *description = @"爱狗狗是以狗狗为根本，承载多元化的版块，聚合全网的宠物资料，为喜欢狗、想养狗、想了解狗、爱狗的狗民们量身打造的宠物圈。\n主要功能:\n\t\t- 首页每日精选最新最火的狗狗资讯\n\t\t- 萌宠趣图、狗狗电影及视频，\n\t\t一键分享- 狗狗养护、训练、健康，让你轻松变身养狗达人\n\t\t更有搞笑动态图等你来看 \n\t\t- 狗狗大全（一狗一圈）现有：泰迪、贵宾、金毛、拉布拉多、哈士奇、萨摩耶、松狮、雪纳瑞、边境牧羊犬、苏牧、喜乐蒂、阿拉斯加、博美、比熊、烈性犬、吉娃娃、京巴、柯基、西施犬、可卡、德国牧羊犬、英国古牧、斗牛犬、蝴蝶犬、小鹿犬、藏獒、中华田园犬、约克夏、大白熊、史宾格、腊肠犬、秋田犬、马尔济斯、大麦町、阿富汗、比格、斗牛梗、杜宾、杰克罗素梗（汪星人持续入驻中）\n\t您还在等什么？加入我们，晋升宠物达人不再是梦！拉近心距离，让您更懂狗！";
            [Auxiliary alertWithTitle:@"爱狗狗" message:description button:1 done:nil];

        }else{
            scrollVC.path = self.pathArray[indexPath.section - 1][indexPath.row - 1];
            scrollVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:scrollVC animated:YES];

        }
    }
   else{
       
       scrollVC.path = self.pathArray[indexPath.section - 1][indexPath.row];
       scrollVC.hidesBottomBarWhenPushed = YES;
       [self.navigationController pushViewController:scrollVC animated:YES];
   }
}




#pragma mark ----- localImageArray懒加载 -----

- (NSArray *)localImageArray
{
    if (_localImageArray == nil) {
        _localImageArray = @[@"scrollow01.jpg",@"scrollow02.jpg",@"scrollow03.jpg",@"scrollow04.jpg",@"scrollow05.jpg"];
    }
    return _localImageArray ;
}


- (NSArray *)localTitleArray
{
    if (_localTitleArray == nil) {
        _localTitleArray = @[@"暖男与狗",@"都是“后妈”养的，却是亲妈的味道！",@"腿短怎么了！照样把你萌的醉生梦死！",@"狗狗的寂寞谁会懂",@"世界这么大这么孤独 幸好有你陪伴"];
    }
    return _localTitleArray;
}


#pragma mark ----- 轮播图点击事件 -----

- (void)didSelectedLocalImageAtIndex:(NSInteger)index
{
    LovePetsScrollView *scrollVC = [[LovePetsScrollView alloc] init];

    switch (index) {
        case 0:
            scrollVC.path = scrollView_One;
            break;
        case 1:
           scrollVC.path = scrollView_Two;
            break;
        case 2:
           scrollVC.path = scrollView_Three;
            break;
        case 3:
            scrollVC.path = scrollView_Four;
            break;
        case 4:
           scrollVC.path = scrollView_Five;
            break;
            
        default:
            break;
    }
    
     // 添加水滴效果
    __autoreleasing CATransition *transition = [CATransition animation];
    transition.type = @"rippleEffect";
    transition.subtype = kCATransitionFade;
    transition.duration = 0.5;
    
    scrollVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    
    [self.navigationController pushViewController:scrollVC animated:YES];

}


- (NSArray *)pathArray
{
    if (_pathArray == nil) {
        _pathArray  =  @[
                         @[A1,A2,A3],
                         @[B1,B2,B3,B4],
                         @[C1,C2,C3,C4],
                         @[D1,D2,D3,D4],
                         @[E1,E2,E3,E4],
                         @[F1,F2,F3,F4],
                         ];
    }
    return _pathArray;
}





@end
