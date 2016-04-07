//
//  ControllersModel.m
//  高仿格格家
//
//  Created by ma c on 3/23/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "ControllersModel.h"

@implementation ControllersModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)controllerWithDict:(NSDictionary *)dict {
    
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)controllersList {
    
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ControllersModel" ofType:@"plist"];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        
        ControllersModel *controller = [ControllersModel controllerWithDict:dict];
        [tmpArray addObject:controller];
    }
    return tmpArray;
}

@end
