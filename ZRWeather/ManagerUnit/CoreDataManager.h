//
//  CoreDataManager.h
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationModel.h"
@interface CoreDataManager : NSObject

+ (instancetype)shareManager;

#pragma mark --- Location

- (void)insertLocation:(NSManagedObjectContext *)context LocationModel:(LocationModel *)locationModel;

#pragma mark --- DailyWeather

- (void)insertDailyWeather:(NSManagedObjectContext *)context
                WithResult:(NSArray *)result
                locId:(NSString *)locId
              locName:(NSString *)locName;

@end
