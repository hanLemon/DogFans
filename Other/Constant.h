//
//  Constant.h
//  Limit
//
//  Created by luds on 16/3/7.
//  Copyright © 2016年 luds. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

/** 版本判断 */
#define iOS_7_or_later [UIDevice currentDevice].systemVersion.floatValue >= 7.0


/** 屏幕 */
#define KSCR_W [UIScreen mainScreen].bounds.size.width
#define KSCR_H [UIScreen mainScreen].bounds.size.height

/** 颜色 */
#define UIColorRGBA(_r, _g, _b, _a) [UIColor colorWithRed:_r/255.f green:_g/255.f blue:_b/255.f alpha:_a]
#define UIColorRGB(_r, _g, _b) UIColorRGBA(_r, _g, _b, 1)



//**************第一个界面****************

//1. 潮流时尚
//（1）本月强档 （参数变化的是offset=7，每页+7）
#define First_A @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=list&sa=benyueqiangdang&offset=%ld&count=7&e=9dbea54ffe5e7a985c6873c71fab8866&uid=11003130&pid=10089&mobile=iPhone3,1&platform=i"

//点击cell进详情  webview显示：根据id
#define FirstDetail @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=article&uid=11003130&pid=10089&id=%d&mobile=iphone4&e=9dbea54ffe5e7a985c6873c71fab8866&platform=i&fontsize=m"
//获取评论列表    (根据id)
#define FirstComment @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=commentlist&sa=333&offset=0&count=20&id=2587&e=9dbea54ffe5e7a985c6873c71fab8866&uid=11003130&pid=10089&mobile=iPhone3,1&platform=i"


//（3）玩转地球 （offset 15）
#define First_B @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=list&sa=wanzhuandiqu&offset=%ld&count=15&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"


//3. 养护训练
//（1）主流狗（offset 15）
#define First_C @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=list&sa=zhuliugou&offset=%ld&count=15&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"

//（3）训犬宝典
#define First_D @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=list&sa=xunquanbaodian&offset=%ld&count=15&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"

//（4）健康手册
#define First_E @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=list&sa=jiankangshouce&offset=%ld&count=15&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"

//5.微声音

//（2）活动报告
#define  First_F  @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=list&sa=huodongbaodao&offset=%ld&count=15&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"

//（3）达人志
#define First_G @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=list&sa=zhuanlan&offset=%ld&count=15&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"





//4. 精彩自拍（offset 15）
#define SplendidPhoto @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=zipailist&sa=22&offset=%ld&count=15&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"


//（2）美味关系（offset 8）
#define MeiWei @"http://cwsjgm.cms.palmtrends.com//api_v2.php?action=piclist&sa=meiweiuanxi&offset=%ld&count=8&e=a9ba49a86547852b7dc2596842d9f343&uid=11007766&pid=10089&mobile=iPhone5,2&platform=i"


//******************************

// 求助问答
#define QuestionList @"http://www.fdog.cn/api/getQuestionList.htm?chatGroupId=0&memberId=AQ1817484608"

// 管家讲堂
#define Highlights @"http://www.fdog.cn/api/getHighlights.htm"


// 最新汪训 不一定对
#define WangXun @"http://www.fdog.cn/api/loadWangXun.htm"

#define WangXunDetail @"http://www.fdog.cn/api/getnewsdetail.htm?memberId=AQ1817484608&newsId=%ld"



// 狗狗测试
#define TestList @"http://www.fdog.cn/api/getTestList.htm"

// 动态 刷新
#define refresh @"http://www.fdog.cn/api/refreshDairy.htm?maxDairyId=38511&memberId=AQ1817484608"
// 动态 已展示 (上拉加载 使 -10)
#define LoadMore @"http://www.fdog.cn/api/loadmorenews.htm?minId=38490&contentType=D&memberId=AQ1817484608"

//*****************************爱宠物


// 标题
#define tie @"http://sdxapp.com/api/get.html?act=GetConf&mquan_id=774&F=android&V=1.0.0&key=1458375937693&sign=8f15965891d44fc16acf36d7&quan_id=774"

// 首页 所有       轮播  汪星资讯
#define  LovePets_Title @"http://sdxapp.com/api/geta.html?act=GetIndexData&mquan_id=774&F=android&V=1.0.0&key=1458375937915&sign=cbacba0a32f4c7a400185450&user_id="

// 轮播图 —— 暖男与狗
#define scrollView_One @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458636600743&sign=ea6f059ea679c5e70ef26928&user_id=&quan_id=&say_id=317254&type=top"
#define scrollView_Two @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458636684852&sign=5e06df534f7aa37c884ab47d&user_id=&quan_id=&say_id=316357&type=top"
#define scrollView_Three  @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458636713696&sign=6f934dc92b92848de30bb86a&user_id=&quan_id=&say_id=317291&type=top"
#define scrollView_Four @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458636737499&sign=2d0e04d0a560021dead3d8a7&user_id=&quan_id=&say_id=316605&type=top"
#define scrollView_Five @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458636754900&sign=3fdc9cded9e180c880595f01&user_id=&quan_id=&say_id=317287&type=top"




// 综合圈
#define Dog_comprehensive @"http://sdxapp.com/api/get.html?act=GetQuanList&mquan_id=774&F=android&V=1.0.0&key=1458375938064&sign=249fe9bb365fa2c61d633dc4&user_id=&tag_id=741&page=1"
//http://sdxapp.com/api/get.html?act=GetQuanList&mquan_id=774&F=android&V=1.0.0&key=1458376226713&sign=fc28b7647c6d16817ecf8744&user_id=&tag_id=0&page=2

// 推荐界面
#define Dog_recommand @"http://sdxapp.com/api/get.html?act=GetQuanList&mquan_id=774&F=android&V=1.0.0&key=1458375938016&sign=d40182db39836ea9e1ab6c57&user_id=&tag_id=0&page=1"

// 中型犬
#define Dog_middle @"http://sdxapp.com/api/get.html?act=GetQuanList&mquan_id=774&F=android&V=1.0.0&key=1458376230461&sign=082f57a70ab45fcbbffd4d6b&user_id=&tag_id=0&page=1"

// 小型犬
#define Dog_little @"http://sdxapp.com/api/get.html?act=GetQuanList&mquan_id=774&F=android&V=1.0.0&key=1458376235353&sign=c3b20c0a7e5b3beb952b902d&user_id=&tag_id=722&page=1"

// 大型犬
#define Dog_Big @"http://sdxapp.com/api/get.html?act=GetQuanList&mquan_id=774&F=android&V=1.0.0&key=1458376363692&sign=c1f42f51d93b6e18f5e02a38&user_id=&tag_id=724&page=1"


// 点进去犬
#define Dog_detail @"http://sdxapp.com/api/get.html?act=GetQuanMsg&mquan_id=774&F=android&V=1.0.0&key=1458729209646&sign=e6366e71a19a3946d48f83cb&user_id=&quan_id=810"
//http://sdxapp.com/api/get.html?act=GetQuanMsg&mquan_id=774&F=android&V=1.0.0&key=1458729900786&sign=2aaa5731fba080894b86b591&user_id=&quan_id=789
//http://sdxapp.com/api/get.html?act=GetSayList&mquan_id=774&F=android&V=1.0.0&key=1458729904041&sign=cde592893588d7d782ff3838&user_id=&quan_id=789&page=1&tag_id=0&search_key=


// 汪星资讯 点进去
#define A1  @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458806938128&sign=c5925a2e48d029aee99c579c&user_id=&quan_id=&say_id=329649&type=top"

#define A2 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458806972982&sign=0fe14dbe9c1c8738da7e95b6&user_id=&quan_id=&say_id=316821&type=top"


#define A3  @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807012143&sign=3d8b414cbc2a3ecf565c5e64&user_id=&quan_id=&say_id=330042&type=top"



// 萌宠爱搞怪

#define B1 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807045850&sign=02fa79fddf1ed4777e09327f&user_id=&quan_id=&say_id=316347&type=top"


#define B2 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807060124&sign=83f32f84bb96dfb61870bf1d&user_id=&quan_id=&say_id=330028&type=top"

#define B3 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807075809&sign=de21aa9300b0c3d01a3ced88&user_id=&quan_id=&say_id=367027&type=top"

#define B4 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807091595&sign=f4f0011f86bf7ff9e0143f60&user_id=&quan_id=&say_id=316863&type=top"


//狗狗视频

#define C1  @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807119614&sign=471907a00f954dc17513184a&user_id=&quan_id=&say_id=329672&type=top"


#define C2 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807134043&sign=e8f0a3ac28b5ddeb3b59248d&user_id=&quan_id=&say_id=329494&type=top"

#define C3 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807151626&sign=e15213638d1f4c33089d8051&user_id=&quan_id=&say_id=329797&type=top"

#define C4 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807169819&sign=6d6c77705109ffd382f9f90e&user_id=&quan_id=&say_id=318146&type=top"

// 养护百科

#define D1 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807187321&sign=6aefa301b345943d3b22ec35&user_id=&quan_id=&say_id=353023&type=top"

#define D2 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807217093&sign=ca1c9208c680c1c8368787d6&user_id=&quan_id=&say_id=317709&type=top"

#define D3  @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807242387&sign=5e4013fc279e3ccb6a6e3c8f&user_id=&quan_id=&say_id=317937&type=top"

#define D4 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458809540156&sign=9b5f24cc1cab6764f7fc6112&user_id=&quan_id=&say_id=316521&type=top"

// 狗狗训练营

#define E1 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807278324&sign=9fca0ed29ffef3f809e92423&user_id=&quan_id=&say_id=316625&type=top"

#define E2 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807309742&sign=b16f2e067e5255979e8c1dd6&user_id=&quan_id=&say_id=329598&type=top"

#define E3 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807336082&sign=08bbdb1fe0ed616e4c253a20&user_id=&quan_id=&say_id=316489&type=top"

#define E4 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807352916&sign=7bc8a38dd1f208afb2ba2370&user_id=&quan_id=&say_id=316517&type=top"


// 狗狗健康馆


#define F1 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807379065&sign=9e021d37bf7af2030ba1b974&user_id=&quan_id=&say_id=316505&type=top"

#define F2 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807394822&sign=a61fbf7b55dd9af53578fd41&user_id=&quan_id=&say_id=329439&type=top"

#define F3 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807406472&sign=8b7261d92bab1baec7f9c66f&user_id=&quan_id=&say_id=316953&type=top"


#define F4 @"http://sdxapp.com/api/get.html?act=GetSay&mquan_id=774&F=android&V=1.0.0&key=1458807430866&sign=1a4ba9ce82e1be9ac6a916f2&user_id=&quan_id=&say_id=316526&type=top"













#endif /* Constant_h */
