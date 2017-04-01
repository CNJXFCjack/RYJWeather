//
//  LocationModel.m
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "LocationModel.h"
#import "Location+CoreDataClass.h"
@implementation LocationModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"locationId":@"id",
             @"name":@"name",
             @"country":@"country",
             @"path":@"path",
             @"timezone":@"timezone",
             @"timezone_offset":@"timezone_offset"};
}

@end
