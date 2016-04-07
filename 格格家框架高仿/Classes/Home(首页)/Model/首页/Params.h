//
//  Params.h
//  格格家POST请求测试
//
//  Created by ma c on 3/24/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GegeRecommend.h"
#import "brandRecommend.h"
#import "Banner.h"
#import "Hot.h"
#import "HttpClient.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "ActivityList.h"
#import "ActivityContent.h"
#import "GeGeRecommendContent.h"
#import "BrandRecommendComment.h"

@interface Params : NSObject

//广告Banner
@property (nonatomic, strong) NSArray *bannerList;
//四按钮
@property (nonatomic, strong) NSArray *activityList;
//格格推荐
@property (nonatomic, strong) NSDictionary *nowGegeRecommend;
//品牌推荐
@property (nonatomic, strong) NSDictionary *brandRecommend;
//今日最热
@property (nonatomic, strong) NSArray *hotList;

@end


