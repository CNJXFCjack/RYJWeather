//
//  DailyWeatherModel.m
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "DailyWeatherModel.h"
#import "DailyWeather+CoreDataClass.h"

@implementation DailyWeatherModel

- (DailyWeather *)modelToNSManagedObjectWithLocId:(NSString *)locId LocName:(NSString *)locName{
    DailyWeather *daillWeather = [DailyWeather insertNewObjectInManagedObjectContext:kAppDelegate.persistentContainer.viewContext];
    daillWeather.date = self.date;
    daillWeather.code_day = self.code_day;
    daillWeather.code_night = self.code_night;
    daillWeather.high = self.high;
    daillWeather.low = self.low;
    daillWeather.precip = self.precip;
    daillWeather.text_day = self.text_day;
    daillWeather.text_night = self.text_night;
    daillWeather.wind_direction = self.wind_direction;
    daillWeather.wind_direction_degree = self.wind_direction_degree;
    daillWeather.wind_scale = self.wind_scale;
    daillWeather.wind_speed = self.wind_speed;
    daillWeather.location_id = locId;
    daillWeather.location_name = locName;
    return daillWeather;
}

@end
