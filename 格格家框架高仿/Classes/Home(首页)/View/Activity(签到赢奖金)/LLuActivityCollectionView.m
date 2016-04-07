//
//  LLuActivityCollectionView.m
//  高仿格格家
//
//  Created by ma c on 3/25/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "LLuActivityCollectionView.h"
#import "ActivityContent.h"
#import "LLuActivityCell.h"

static NSString *menuCellID = @"menuCellID";

@interface LLuActivityCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataList;

@property (nonatomic, strong) NSMutableArray *imageList;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation LLuActivityCollectionView

+ (instancetype)activityCollectionViewWithFrame:(CGRect)frame superView:(UIView *)superView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 4.0, 82);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    LLuActivityCollectionView *collectionView = [[LLuActivityCollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [superView addSubview:collectionView];
    return collectionView;
}

#pragma mark - getter and setter

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor grayColor];
        self.pagingEnabled = YES;
        
        [self registerClass:[LLuActivityCell class] forCellWithReuseIdentifier:menuCellID];
        
        [self getActivityListData];
    }
    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LLuActivityCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:menuCellID forIndexPath:indexPath];
    
    ActivityContent *activity = self.dataList[indexPath.row];
    item.activity = activity;
    
//    item.iconView.image = [UIImage imageNamed:@"btnAddtoCart"];

    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

#pragma mark - 签到赢奖金
- (void)getActivityListData {
    
    NSDictionary *parameters = @{@"params": @"{\"type\":\"123546789abc\",\"province\":\"110000\"}",
                                 @"os":@"2",
                                 @"sign":@"F4DDF6F67E383199",
                                 @"version":@"2.4"};
    
    NSString *urlString = @"http://app.gegejia.com/yangege/appNative/resource/homeList";
    [[HttpClient defaultClient] requestWithPath:urlString method:HttpRequestPost parameters:parameters prepareExecute:^{
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"successs");
        Params *par = [Params mj_objectWithKeyValues:responseObject[@"params"]];
        //        NSLog(@"%@", par.activityList);
        //        NSLog(@"%@", par.activityList[0]);
        ActivityList *activity = [ActivityList mj_objectWithKeyValues:par.activityList[0]];
        
        for (NSDictionary *activityDict in activity.content) {
            
            ActivityContent *activity = [ActivityContent mj_objectWithKeyValues:activityDict];
            
            [self.dataList addObject:activity];
            
//            NSLog(@"==========================================");
//            NSLog(@"%@", activity.image);
//            NSLog(@"%@", activity.umname);
//            NSLog(@"==========================================");

        }
        
        [self reloadData];
        
        NSLog(@"LLuActivityCollectionView:%@", self.dataList);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        NSLog(@"请求失败");
        NSLog(@"error--->%@", error);
    }];
}

@end
