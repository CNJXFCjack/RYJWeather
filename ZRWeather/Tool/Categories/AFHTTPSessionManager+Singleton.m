//
//  AFHTTPSessionManager+Singleton.m
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "AFHTTPSessionManager+Singleton.h"

@implementation AFHTTPSessionManager (Singleton)

+ (instancetype)RYJ_shareManager{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:kWEATHER_BASE_URL]];
    });
    manager.requestSerializer.timeoutInterval = 30.0f;
    return manager;
}

@end
