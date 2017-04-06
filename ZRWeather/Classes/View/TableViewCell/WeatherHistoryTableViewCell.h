//
//  WeatherHistoryTableViewCell.h
//  ZRWeather
//
//  Created by yijie on 2017/4/6.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DailyWeatherModel;
@interface WeatherHistoryTableViewCell : UITableViewCell

- (void)configUIWithModel:(DailyWeatherModel *)dailyWeather;

@end
