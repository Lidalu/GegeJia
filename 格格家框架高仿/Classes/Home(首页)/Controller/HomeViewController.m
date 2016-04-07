//
//  HomeViewController.m
//  高仿格格家
//
//  Created by ma c on 3/23/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "HomeViewController.h"
#import "LLuBannerView.h"
#import "LLuActivityCollectionView.h"
#import "GegeRecommendCell.h"
#import "BrandRecommendCollectionView.h"
#import "HotListCollectionView.h"


static NSString *GegeRecommendCellID = @"GegeRecommendCell";
static NSString *brandRecommendCellID = @"brandRecommendCell";
static NSString *hotListCellID = @"hotListCellIdentifier";

@interface HomeViewController () <LLuBannerViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIBarButtonItem *rightBarItem;

@property (nonatomic, strong) UITableView *tableView;

//头视图
@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) LLuBannerView *bannerView;

//广告Banner
@property (nonatomic, strong) NSMutableArray *bannerList;
//签到赢奖金
@property (nonatomic, strong) NSMutableArray *activityList;
//格格推荐
@property (nonatomic, strong) NSMutableArray *GegeRecommendList;
//品牌推荐
@property (nonatomic, strong) NSMutableArray *brandRecommendList;
//今日最热
@property (nonatomic, strong) NSMutableArray *hotList;

@end

@implementation HomeViewController

#pragma mark - getter and setter

//广告Banner
- (NSMutableArray *)bannerList {
    
    if (!_bannerList) {
        
        _bannerList = [NSMutableArray array];
    }
    return _bannerList;
}

//签到赢奖金
- (NSMutableArray *)activityList {
    
    if (!_activityList) {
        
        _activityList = [NSMutableArray array];
        
    }
    return _activityList;
}
//格格推荐
- (NSMutableArray *)GegeRecommendList {
    
    if (!_GegeRecommendList) {
        
        _GegeRecommendList = [NSMutableArray array];
    }
    return _GegeRecommendList;
}
//品牌推荐
- (NSMutableArray *)brandRecommendList {
    
    if (!_brandRecommendList) {
        
        _brandRecommendList = [NSMutableArray array];
    }
    return _brandRecommendList;
}
//今日最热
- (NSMutableArray *)hotList {
    
    if (!_hotList) {
        
        _hotList = [NSMutableArray array];
    }
    return _hotList;
}


- (UIBarButtonItem *)rightBarItem {
    
    if (!_rightBarItem) {
        
        UIImage *rightBarItemImage = [UIImage imageNamed:@"navItemSearch"];
        rightBarItemImage = [rightBarItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _rightBarItem = [[UIBarButtonItem alloc] initWithImage:rightBarItemImage style:UIBarButtonItemStylePlain target:self action:nil];
    }
    return _rightBarItem;
}

- (LLuBannerView *)bannerView {
    
    if (!_bannerView) {
        
        _bannerView = [LLuBannerView bannerView];
        _bannerView.delegate = self;

    }
    return _bannerView;
}

- (UIView *)headerView {
    
    if (!_headerView) {
        
//        _headerView = [[UIView alloc] init];
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 262)];
        _headerView.backgroundColor = [UIColor redColor];
        [LLuActivityCollectionView activityCollectionViewWithFrame:CGRectMake(0, 180, SCREEN_WIDTH, 82) superView:_headerView];
        
        [_headerView addSubview:self.bannerView];
//        NSLog(@"headerView的子视图->>>%@", _headerView);
    }
    return _headerView;
}

- (UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableHeaderView = self.headerView;
        [_tableView registerNib:[UINib nibWithNibName:@"GegeRecommendCell" bundle:nil] forCellReuseIdentifier:GegeRecommendCellID];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:brandRecommendCellID];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:hotListCellID];
//        _tableView.rowHeight = 240;
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource UITableViewDelegate Method

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        
        return self.GegeRecommendList.count;
    }
    else {
        
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        GegeRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:GegeRecommendCellID];
        GeGeRecommendContent *gege = self.GegeRecommendList[indexPath.row];
        cell.gegeRecommend = gege;
        return cell;
        
    }
    else if (indexPath.section == 1) {
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:brandRecommendCellID];
        [BrandRecommendCollectionView brandRecommendCollectionViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(cell.contentView.frame), CGRectGetHeight(cell.contentView.frame)) superView:cell.contentView];
        
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:hotListCellID];
    [HotListCollectionView hotListCollectionViewWithFrame:CGRectMake(0, 0, CGRectGetWidth(cell.contentView.frame), CGRectGetHeight(cell.contentView.frame)) superView:cell.contentView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        return 210;
    } else if (indexPath.section == 1) {
        
        return 240;
    }
    return 180;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    return nil;
}

#pragma mark - lefe ctyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadJSONData];
    self.navigationItem.title = @"格格家";
    self.navigationItem.rightBarButtonItem = self.rightBarItem;
    self.view.backgroundColor = [UIColor whiteColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    NSLog(@"self.headerView.subviews->>>%@", self.headerView.subviews);
    [self.view addSubview:self.tableView];
}

#pragma mark 数据
- (void)loadJSONData {

    //获取Banner对象数据
    [self getBannerImageListData];
    //获取格格推荐数据
    [self getGeGeRecommendListData];
    
}


- (void)bannerView:(LLuBannerView *)bannerView imageDidClickWithIndex:(NSInteger)imageIndex {
    
    NSLog(@"第%ld张图片被选中了！", imageIndex);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//
//    self.bannerView.frame = CGRectMake(0, 0, self.view.frame.size.width, 180);
////
//    UIView *superView = self.view;
//    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(superView.mas_top);
//        make.left.equalTo(superView.mas_left);
//        make.right.equalTo(superView.mas_right);
//        make.height.equalTo(@262);
//        
//    }];
//
    UIView *headerSuperView = self.headerView;
    
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        
        make.top.equalTo(headerSuperView.mas_top);
        make.left.equalTo(headerSuperView.mas_left);
        make.right.equalTo(headerSuperView.mas_right);
        make.height.equalTo(@180);
        
    }];
//    LLuActivityCollectionView *activityCollectionView = self.headerView.subviews[0];
//
//    [activityCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.equalTo(self.bannerView.mas_top);
//        make.left.equalTo(headerSuperView.mas_left);
//        make.right.equalTo(headerSuperView.mas_right);
//        make.height.equalTo(@180);
//        
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 首页数据获取

- (void)getBannerImageListData {
    
    NSDictionary *parameters = @{@"params": @"{\"type\":\"123546789abc\",\"province\":\"110000\"}",
                                 @"os":@"2",
                                 @"sign":@"F4DDF6F67E383199",
                                 @"version":@"2.4"};
    
    NSString *urlString = @"http://app.gegejia.com/yangege/appNative/resource/homeList";
    [[HttpClient defaultClient] requestWithPath:urlString method:HttpRequestPost parameters:parameters prepareExecute:^{
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"successs");
        Params *par = [Params mj_objectWithKeyValues:responseObject[@"params"]];
        for (NSDictionary *dict in par.bannerList) {
            
            Banner *banner = [Banner mj_objectWithKeyValues:dict];
            
            [self.bannerList addObject:banner.image];
            
            
        }
        [self.tableView reloadData];
        self.bannerView.imageUrls = self.bannerList;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        NSLog(@"请求失败");
        NSLog(@"error--->%@", error);
    }];
}

- (void)getGeGeRecommendListData {
    
    NSDictionary *parameters = @{@"params": @"{\"type\":\"123546789abc\",\"province\":\"110000\"}",
                                 @"os":@"2",
                                 @"sign":@"F4DDF6F67E383199",
                                 @"version":@"2.4"};
    
    NSString *urlString = @"http://app.gegejia.com/yangege/appNative/resource/homeList";
    [[HttpClient defaultClient] requestWithPath:urlString method:HttpRequestPost parameters:parameters prepareExecute:^{
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        
        NSLog(@"successs");
        Params *par = [Params mj_objectWithKeyValues:responseObject[@"params"]];
        
        GegeRecommend *gegeReconmmend = [GegeRecommend mj_objectWithKeyValues:par.nowGegeRecommend];
        
        for (NSDictionary *gegeDict in gegeReconmmend.content) {
            
            GeGeRecommendContent *gege = [GeGeRecommendContent mj_objectWithKeyValues:gegeDict];
            
            [self.GegeRecommendList addObject:gege];
            
//            NSLog(@"==========================================");
//            NSLog(@"%@", gege.image);
//            NSLog(@"%@", gege.umname);
//            NSLog(@"==========================================");
            
        }
//        NSLog(@"GegeRecommendList->>>%@", self.GegeRecommendList);
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        NSLog(@"请求失败");
        NSLog(@"error--->%@", error);
    }];
}


@end
