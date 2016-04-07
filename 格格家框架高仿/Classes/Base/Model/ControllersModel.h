//
//  ControllersModel.h
//  高仿格格家
//
//  Created by ma c on 3/23/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControllersModel : NSObject

@property (nonatomic, copy) NSString *tabBartitle;

@property (nonatomic, copy) NSString *controllerName;

@property (nonatomic, copy) NSString *ControllerTabbarIcon_Normal;

@property (nonatomic, copy) NSString *ControllerTabbarIcon_Selected;

@property (nonatomic, copy) NSString *leftBarItemIconName;

@property (nonatomic, copy) NSString *rightBarItemIconName;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)controllerWithDict:(NSDictionary *)dict;

+ (NSArray *)controllersList;


@end
