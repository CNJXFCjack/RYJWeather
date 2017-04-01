//
//  CoreDataManager.m
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "CoreDataManager.h"
#import "Location+CoreDataClass.h"
#import "DailyWeather+CoreDataClass.h"
#import "DailyWeatherModel.h"
@implementation CoreDataManager

#pragma mark --- init

+ (instancetype)shareManager{
    static CoreDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CoreDataManager alloc]init];
    });
    return manager;
}

#pragma mark --- Location
- (void)insertLocation:(NSManagedObjectContext *)context LocationModel:(LocationModel *)locationModel{
    if ([self exsitLocation:locationModel.locationId context:context]) return;
    
    Location *location = [Location insertNewObjectInManagedObjectContext:context];
    location.location_id = locationModel.locationId;
    location.name = locationModel.name;
    location.country = locationModel.country;
    location.path = locationModel.path;
    location.timezone = locationModel.timezone;
    location.timezone_offset = locationModel.timezone_offset;
    [kAppDelegate saveContext];
}

- (BOOL)exsitLocation:(NSString *)locationId context:(NSManagedObjectContext *)context{
    NSFetchRequest *request = [Location fetchRequest];
    NSPredicate *predicatie = [NSPredicate predicateWithFormat:@"location_id == [c]%@",locationId];
    [request setPredicate:predicatie];
    NSArray *arr = [context executeFetchRequest:request error:nil];
    return arr.count > 0 ? YES : NO;
}

#pragma mark --- DailyWeather
- (void)insertDailyWeather:(NSManagedObjectContext *)context
                WithResult:(NSArray *)result
                     locId:(NSString *)locId
                   locName:(NSString *)locName{
    for (DailyWeatherModel *dailyWeatherModel in result) {
        if ([self exsitDailyWeather:dailyWeatherModel.date context:context]) return;
        DailyWeather *daillWeather = [DailyWeather insertNewObjectInManagedObjectContext:context];
        daillWeather.date = dailyWeatherModel.date;
        daillWeather.code_day = dailyWeatherModel.code_day;
        daillWeather.code_night = dailyWeatherModel.code_night;
        daillWeather.high = dailyWeatherModel.high;
        daillWeather.low = dailyWeatherModel.low;
        daillWeather.precip = dailyWeatherModel.precip;
        daillWeather.text_day = dailyWeatherModel.text_day;
        daillWeather.text_night = dailyWeatherModel.text_night;
        daillWeather.wind_direction = dailyWeatherModel.wind_direction;
        daillWeather.wind_direction_degree = dailyWeatherModel.wind_direction_degree;
        daillWeather.wind_scale = dailyWeatherModel.wind_scale;
        daillWeather.wind_speed = dailyWeatherModel.wind_speed;
        daillWeather.location_id = locId;
        daillWeather.location_name = locName;
        [kAppDelegate saveContext];
    }
}

- (BOOL)exsitDailyWeather:(NSString *)date context:(NSManagedObjectContext *)context{
    NSFetchRequest *request = [DailyWeather fetchRequest];
    NSPredicate *predicatie = [NSPredicate predicateWithFormat:@"date == %@",date];
    [request setPredicate:predicatie];
    NSArray *arr = [context executeFetchRequest:request error:nil];
    return arr.count > 0 ? YES : NO;
}

@end
