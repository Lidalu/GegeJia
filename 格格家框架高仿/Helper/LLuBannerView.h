//
//  LLuBannerView.h
//  图片轮播
//
//  Created by ma c on 2/25/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LLuBannerView;

@protocol LLuBannerViewDelegate <NSObject>

@optional
/**
 *  点击图片后的回调
 *
 *  @param imageIndex 图片Index
 */
- (void)bannerView:(LLuBannerView *)bannerView imageDidClickWithIndex:(NSInteger)imageIndex;

@end

@interface LLuBannerView: UIView

/**
 *  图片Url数组
 */
@property (nonatomic, strong) NSArray * imageUrls;

/**
 *  图片名称数组
 */
@property (nonatomic, strong) NSArray * imageNames;

/**
 *  占位图名称
 */
@property (nonatomic, copy) NSString * placeholderImageName;

@property (nonatomic, weak) id<LLuBannerViewDelegate> delegate;

+ (instancetype)bannerView;

@end

