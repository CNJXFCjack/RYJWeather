//
//  HomeWeatherTableViewCell.h
//  ZRWeather
//
//  Created by yijie on 2017/4/2.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DailyWeatherModel;

@interface HomeWeatherTableViewCell : UITableViewCell

- (void)configUIWithModel:(DailyWeatherModel *)dailyWeatherModel;

@end
