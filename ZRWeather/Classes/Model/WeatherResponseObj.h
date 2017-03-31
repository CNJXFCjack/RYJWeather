//
//  WeatherResponseObj.h
//  RYJWeather
//
//  Created by yijie on 2017/3/31.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResponseObj : NSObject

@property (nonatomic,assign)    BOOL        isSuccess; //是否成功
@property (nonatomic,strong)    NSArray     *results;  //成功数据
@property (nonatomic,copy)      NSString    *msg;       //失败message

- (instancetype)initWithResponse:(id)response;

@end
