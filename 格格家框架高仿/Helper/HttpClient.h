//
//  HttpClient.h
//  封装AFN&SDWeb
//
//  Created by ma c on 3/22/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//HTTP请求类别
typedef NS_ENUM(NSInteger, HttpRequestType) {
    
    HttpRequestGet,
    HttpRequestPost,
    HttpRequestDelete,
    HttpRequestPut
};

/**
 *  请求前预处理block
 */
typedef void(^PrepareExecuteBlock)(void);

typedef void(^SuccessBlock)(NSURLSessionDataTask *task, id responseObject);

typedef void(^FailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface HttpClient : NSObject

+ (HttpClient *)defaultClient;


/**
 *  HTTP请求（GET，POST，PUT，DELETE）
 *
 *  @param url            请求地址
 *  @param method         请求类型
 *  @param parameters     请求参数
 *  @param prepareExecute 请求前预处理
 *  @param success        请求成功处理
 *  @param failure        请求失败处理
 */
- (void)requestWithPath:(NSString *)url
                 method:(NSInteger)method
             parameters:(id)parameters
         prepareExecute:(PrepareExecuteBlock)prepareExecute
                success:(SuccessBlock)success
                failure:(FailureBlock)failure;


@end
