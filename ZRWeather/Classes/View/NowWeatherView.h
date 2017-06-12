//
//  NowWeatherView.h
//  ZRWeather
//
//  Created by yijie on 2017/6/12.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NowWeather;

@interface NowWeatherView : UIView

- (void)configureData:(NowWeather *)nowWeather location:(NSString *)location;

@end
