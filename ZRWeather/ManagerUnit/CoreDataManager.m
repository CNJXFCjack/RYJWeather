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
    
    [locationModel modelToNSManagedObject];
    
    [kAppDelegate saveContext];
}

- (BOOL)exsitLocation:(NSString *)locationId context:(NSManagedObjectContext *)context{
    NSFetchRequest *request = [Location fetchRequest];
    NSPredicate *predicatie = [NSPredicate predicateWithFormat:@"location_id == [c]%@",locationId];
    request.predicate = predicatie;
    return [context countForFetchRequest:request error:nil] > 0 ? YES : NO;
}

#pragma mark --- DailyWeather
- (void)insertDailyWeather:(NSManagedObjectContext *)context
                WithResult:(NSArray *)result
                     locId:(NSString *)locId
                   locName:(NSString *)locName{
    
    [[[result.rac_sequence filter:^BOOL(DailyWeatherModel *dailyWeatherModel) {
        
        return ![self exsitDailyWeather:dailyWeatherModel.date context:context];
        
    }] map:^id(DailyWeatherModel *dailyWeatherModel) {
        
        DailyWeather *daillWeather = [dailyWeatherModel modelToNSManagedObjectWithLocId:locId LocName:locName];
        return daillWeather;
        
    }] array];
    
    [kAppDelegate saveContext];
}

- (BOOL)exsitDailyWeather:(NSString *)date context:(NSManagedObjectContext *)context{
    NSFetchRequest *request = [DailyWeather fetchRequest];
    NSPredicate *predicatie = [NSPredicate predicateWithFormat:@"date == %@",date];
    request.predicate = predicatie;
    return [context countForFetchRequest:request error:nil] > 0 ? YES : NO;
}

- (void)fetchDailyWeather:(NSManagedObjectContext *)context
                         block:(RequestResultHandle)block{
    NSFetchRequest *request = [DailyWeather fetchRequest];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
    NSError *error;
    NSArray *list = [context executeFetchRequest:request error:&error];
    if (!error) {
        if (block) block(YES,list,nil);
    }else {
        if (block) block(NO,nil,error);
    }
}

- (void)deleteDailyWeather:(DailyWeather *)dailyWeather
                   context:(NSManagedObjectContext *)context
                     block:(RequestResultHandle)block {
    NSError *error;
    [context deleteObject:dailyWeather];
    [context save:&error];
    if (!error) {
        if (block) block(YES,nil,nil);
    }else {
        if (block) block(NO,nil,error);
    }
}

@end
