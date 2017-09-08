//
//  DateFormatManager.m
//  ZRWeather
//
//  Created by yijie on 2017/4/10.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "DateFormatManager.h"

@implementation DateFormatManager

+ (instancetype)shareManager {
    static DateFormatManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DateFormatManager alloc] init];
        [manager setLocale:[NSLocale currentLocale]];
    });
    return manager;
}

- (NSString *)transformDateToWeek:(NSString *)date
                       withFormat:(NSString *)format {
    [self setDateFormat:format];
    NSDate *time = [self dateFromString:date];
    [self setDateFormat:@"MMM d"];
    return [self stringFromDate:time];
}

@end
