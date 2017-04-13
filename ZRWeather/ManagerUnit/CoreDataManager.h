//
//  CoreDataManager.h
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//
//回调
typedef void(^RequestResultHandle)(BOOL success,id data,NSError *error);

#import <Foundation/Foundation.h>
#import "LocationModel.h"

@class DailyWeather;

@interface CoreDataManager : NSObject

+ (instancetype)shareManager;

#pragma mark --- Location

- (void)insertLocation:(NSManagedObjectContext *)context
         LocationModel:(LocationModel *)locationModel;

#pragma mark --- DailyWeather

- (void)insertDailyWeather:(NSManagedObjectContext *)context
                WithResult:(NSArray *)result
                locId:(NSString *)locId
              locName:(NSString *)locName;
//拉取历史列表
- (void)fetchDailyWeather:(NSManagedObjectContext *)context
                    block:(RequestResultHandle)block;

//删除
- (void)deleteDailyWeather:(DailyWeather *)dailyWeather
                   context:(NSManagedObjectContext *)context
                     block:(RequestResultHandle)block;

@end
