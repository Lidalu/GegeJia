//
//  HttpClient.m
//  封装AFN&SDWeb
//
//  Created by ma c on 3/22/16.
//  Copyright © 2016 lu. All rights reserved.
//

#import "HttpClient.h"

@interface HttpClient ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, assign) BOOL isConnect;

@end

@implementation HttpClient

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.manager = [AFHTTPSessionManager manager];
        /**
         *  设置请求类型
         */
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        /**
         *  设置响应类型
         */
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", nil];
        
        /**
         *  开启网络监听
         */
        [self openNetMonitoring];
    }
    return self;
}

- (void)openNetMonitoring {
    
    /**
     *  AFN监测网络状态
     *
     *  @param status 网络状态
     */
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                self.isConnect = NO;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                self.isConnect = NO;
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.isConnect = YES;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                self.isConnect = YES;
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    self.isConnect = YES;
}

+ (HttpClient *)defaultClient {
    
    
    static HttpClient *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)requestWithPath:(NSString *)url
                 method:(NSInteger)method
             parameters:(id)parameters
         prepareExecute:(PrepareExecuteBlock)prepareExecute
                success:(SuccessBlock)success
                failure:(FailureBlock)failure {
    
    /**
     *  请求的URL
     */
    NSLog(@"请求网络地址为：%@", url);
    
    /**
     *判断网络状况（有链接：执行请求；无链接：弹出提示）
     */
    
    if ([self isConnectionAvailable]) {
        //预处理
        if (prepareExecute) {
            
            prepareExecute();
        }
        
        switch (method) {
            case HttpRequestGet:
                [self.manager GET:url parameters:parameters progress:nil success:success failure:failure];
                
                break;
            case HttpRequestPost:
                
                [self.manager POST:url parameters:parameters progress:nil success:success failure:failure];
                break;
            case HttpRequestDelete:
                
                [self.manager DELETE:url parameters:parameters success:success failure:failure];
                break;
                
            case HttpRequestPut:
                
                [self.manager PUT:url parameters:parameters success:success failure:failure];
                break;
            default:
                break;
        }
        
    } else {
        
        /**
         *  网络错误
         */
        [self showExceptionDialog];
        /**
         *  发出网络异常通知广播
         */
        [[NSNotificationCenter defaultCenter] postNotificationName:@"k_NOTI_NETWORK_ERROR" object:nil];
    }

}

- (BOOL)isConnectionAvailable {
    
    return self.isConnect;
}

/**
 *  弹出网络错误提示框
 */
- (void)showExceptionDialog {
    
    [UIAlertController alertControllerWithTitle:@"提示" message:@"网络异常，请检查网络连接" preferredStyle:UIAlertControllerStyleAlert];
}


@end
