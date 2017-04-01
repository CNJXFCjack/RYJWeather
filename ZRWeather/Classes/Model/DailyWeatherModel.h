//
//  DailyWeatherModel.h
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "ModelClass.h"

@interface DailyWeatherModel : ModelClass

@property (nonatomic,copy) NSString *date;
@property (nonatomic,copy) NSString *code_day;
@property (nonatomic,copy) NSString *code_night;
@property (nonatomic,copy) NSString *high;
@property (nonatomic,copy) NSString *low;
@property (nonatomic,copy) NSString *precip;
@property (nonatomic,copy) NSString *text_day;
@property (nonatomic,copy) NSString *text_night;
@property (nonatomic,copy) NSString *wind_direction;
@property (nonatomic,copy) NSString *wind_direction_degree;
@property (nonatomic,copy) NSString *wind_scale;
@property (nonatomic,copy) NSString *wind_speed;

@end
