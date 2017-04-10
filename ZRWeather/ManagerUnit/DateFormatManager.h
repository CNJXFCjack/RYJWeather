//
//  DateFormatManager.h
//  ZRWeather
//
//  Created by yijie on 2017/4/10.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFormatManager : NSDateFormatter

+ (instancetype)shareManager;

- (NSString *)transformDateToWeek:(NSString *)date
                       withFormat:(NSString *)format;

@end
