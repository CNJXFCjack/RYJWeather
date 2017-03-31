//
//  HomeViewModel.h
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeViewModel : BaseViewModel

@property (nonatomic,strong) RACSubject *nowWeatherSub;
@property (nonatomic,strong) RACSubject *dailyWeatherSub;

- (void)getNowWeatherWithLocation:(NSString *)location;
- (void)getDailyWeatherWithLocation:(NSString *)location;

@end
