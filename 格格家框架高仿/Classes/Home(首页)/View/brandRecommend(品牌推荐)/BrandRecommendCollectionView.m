//
//  BrandRecommendCollectionView.m
//  高仿格格家
//
//  Created by ma c on 3/26/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "BrandRecommendCollectionView.h"
#import "BrandRecommendComment.h"
#import "BrandRecommendCell.h"

static NSString *brandRecommendCellIdentifier = @"brandRecommendCell";
@interface BrandRecommendCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *brandRecommendList;

@end

@implementation BrandRecommendCollectionView

#pragma mark - getter and setter

- (NSMutableArray *)brandRecommendList {
    
    if (!_brandRecommendList) {
        
        _brandRecommendList = [NSMutableArray array];
    }
    return _brandRecommendList;
}

+ (instancetype)brandRecommendCollectionViewWithFrame:(CGRect)frame superView:(UIView *)superView {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 4.0, 80);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    BrandRecommendCollectionView *collectionView = [[BrandRecommendCollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    collectionView.bounces = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.showsVerticalScrollIndicator = NO;
    
    [superView addSubview:collectionView];
    return collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.brandRecommendList.count;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor grayColor];
        self.pagingEnabled = YES;
        
//        [self registerClass:[ class] forCellWithReuseIdentifier:menuCellID];
        [self registerNib:[UINib nibWithNibName:@"BrandRecommendCell" bundle:nil] forCellWithReuseIdentifier:brandRecommendCellIdentifier];
        
        [self getBrandRecommendListData];
    }
    
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BrandRecommendCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:brandRecommendCellIdentifier forIndexPath:indexPath];
    
    BrandRecommendComment *brandItem = self.brandRecommendList[indexPath.row];
    item.brandRecommend = brandItem;
    
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


- (void)getBrandRecommendListData {
    
    NSDictionary *parameters = @{@"params": @"{\"type\":\"123546789abc\",\"province\":\"110000\"}",
                                 @"os":@"2",
                                 @"sign":@"F4DDF6F67E383199",
                                 @"version":@"2.4"};
    
    NSString *urlString = @"http://app.gegejia.com/yangege/appNative/resource/homeList";
    [[HttpClient defaultClient] requestWithPath:urlString method:HttpRequestPost parameters:parameters prepareExecute:^{
        
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        
        NSLog(@"successs");
        Params *par = [Params mj_objectWithKeyValues:responseObject[@"params"]];
        
        brandRecommend *brand = [brandRecommend mj_objectWithKeyValues:par.brandRecommend];
        
        for (NSDictionary *brandDict in brand.content) {
            
            BrandRecommendComment *brandItem = [BrandRecommendComment mj_objectWithKeyValues:brandDict];
            
            [self.brandRecommendList addObject:brandItem];

//            NSLog(@"==========================================");
//            NSLog(@"%@", brandItem.image);
//            NSLog(@"%@", brandItem.umname);
//            NSLog(@"==========================================");
            
        }
//        NSLog(@"brandRecommendList->>>%@", self.brandRecommendList);
        
        [self reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        
        NSLog(@"请求失败");
        NSLog(@"error--->%@", error);
    }];
}


@end
