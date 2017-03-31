//
//  HomeViewModel.m
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "HomeViewModel.h"
#import "LocationModel.h"

@implementation HomeViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.nowWeatherSub = [RACSubject subject];
        self.dailyWeatherSub = [RACSubject subject];
    }
    return self;
}

- (void)getNowWeatherWithLocation:(NSString *)location{
    
    [HTTPManager GET:kNOW_WEATHER
           parameter:@{@"key":kWEATHER_API_KEY,@"location":@"suzhou",@"language":@"zh-Hans",@"unit":@"c"}
             success:^(NSURLSessionDataTask *task, id responseObject) {
                 WeatherResponseObj *obj = [[WeatherResponseObj alloc]initWithResponse:responseObject];
                 if (obj.isSuccess) {
                     [self.nowWeatherSub sendNext:obj.results];
                 }else{
                     [self.nowWeatherSub sendNext:obj.msg];
                 }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [self.nowWeatherSub sendError:error];
    }];
}

- (void)getDailyWeatherWithLocation:(NSString *)location{
    [HTTPManager GET:kDAILY_WEATHER
           parameter:@{@"key":kWEATHER_API_KEY,@"location":location,@"language":@"zh-Hans",@"unit":@"c",@"start":@"0",@"days":@"3"}
             success:^(NSURLSessionDataTask *task, id responseObject) {
                 WeatherResponseObj *obj = [[WeatherResponseObj alloc]initWithResponse:responseObject];
                 if (obj.isSuccess) {
                     [self.nowWeatherSub sendNext:obj.results];
                 }else{
                     [self.nowWeatherSub sendNext:obj.msg];
                 }
    } fail:^(NSURLSessionDataTask *task, NSError *error) {
        [self.dailyWeatherSub sendError:error];
    }];
}


@end
