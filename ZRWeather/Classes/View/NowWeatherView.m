//
//  NowWeatherView.m
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "NowWeatherView.h"

@implementation NowWeatherView

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)configDataWithNowWeather:(NowWeather *)nowWeather{
    self.nowImg.image = [UIImage imageNamed:[nowWeather.code transformImgName]];
    self.temperature.text = nowWeather.temperature;
    self.weather.text = nowWeather.text;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
