//
//  AFHTTPSessionManager+Singleton.h
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (Singleton)

+ (instancetype)RYJ_shareManager;

@end
