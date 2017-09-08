//
//  WeatherResponseObj.m
//  RYJWeather
//
//  Created by yijie on 2017/3/31.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "WeatherResponseObj.h"

@implementation WeatherResponseObj

- (instancetype)initWithResponse:(id)response{
    if (self = [super init]) {
        if ([[response objectForKey:@"results"] notNull]) {
            self.isSuccess = YES;
            if ([[[response objectForKey:@"results"] class] isSubclassOfClass:[NSArray class]]) {
                NSArray *results = [response objectForKey:@"results"];
                if (results) {
                    self.results = results;
                }
            }
        }else if ([[response objectForKey:@"status_code"] notNull]) {
            self.isSuccess = NO;
            self.msg = [response objectForKey:@"status"];
            NSLog(@"Error! Status Code:%@",[response objectForKey:@"status_code"]);
        }
    }
    return self;
}

@end
