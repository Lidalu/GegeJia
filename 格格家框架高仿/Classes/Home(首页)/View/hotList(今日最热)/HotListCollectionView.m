//
//  HotListCollectionView.m
//  高仿格格家
//
//  Created by ma c on 3/26/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "HotListCollectionView.h"
#import "HotCollectionViewCell.h"

static NSString *hotListCellID = @"hotListCellIdentifier";
@interface HotListCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *hotList;

@end

@implementation HotListCollectionView

#pragma mark - getter and setter

- (NSMutableArray *)hotList {
    
    if (!_hotList) {
        
        _hotList = [NSMutableArray array];
    }
    return _hotList;
}

+ (instancetype)hotListCollectionViewWithFrame:(CGRect)frame superView:(UIView *)superView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);

    flowLayout.itemSize = CGSizeMake((CGRectGetWidth(superView.frame) - 50) / 4.0, CGRectGetHeight(superView.frame) - 1);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    HotListCollectionView *collectionView = [[HotListCollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [superView addSubview:collectionView];
    return collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.hotList.count;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor whiteColor];
    
        [self registerNib:[UINib nibWithNibName:@"HotCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:hotListCellID];
        
        [self getHotGoodsListData];
    }
    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HotCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:hotListCellID forIndexPath:indexPath];
    
    Hot *hotGoodsItem = self.hotList[indexPath.row];
    item.hotGoods = hotGoodsItem;
    
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


- (void)getHotGoodsListData {
    
    NSDictionary *parameters = @{@"params": @"{\"type\":\"123546789abc\",\"province\":\"110000\"}",
                                 @"os":@"2",
                                 @"sign":@"F4DDF6F67E383199",
                                 @"version":@"2.4"};
    
    NSString *urlString = @"http://app.gegejia.com/yangege/appNative/resource/homeList";
    [[HttpClient defaultClient] requestWithPath:urlString method:HttpRequestPost parameters:parameters prepareExecute:^{
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"successs");
        Params *par = [Params mj_objectWithKeyValues:responseObject[@"params"]];
        for (NSDictionary *dict in par.hotList) {
            
            Hot *hotGoods = [Hot mj_objectWithKeyValues:dict];
            
            [self.hotList addObject:hotGoods];
            
            
        }
        [self reloadData];
        
        NSLog(@"HotList--->>>%@", self.hotList);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        NSLog(@"请求失败");
        NSLog(@"error--->%@", error);
    }];
}

@end
