//
//  NSString+Common.m
//  ZRWeather
//
//  Created by yijie on 2017/4/9.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

- (NSString *)transformImgName {
    NSString * imgName;
    switch ([self integerValue]) {
        case 0:
        case 2:
            imgName = @"sun";
            break;
        case 1:
        case 3:
            imgName = @"night-1";
            break;
        case 4:
            imgName = @"cloud";
            break;
        case 5:
            imgName = @"sun-4";
            break;
        case 6:
            imgName = @"night-2";
            break;
        case 7:
            imgName = @"cloud-1";
            break;
        case 8:
            imgName = @"night";
            break;
        case 9:
            imgName = @"cloudy";
            break;
        case 10:
            imgName = @"rain-6";
            break;
        case 11:
        case 12:
            imgName = @"storm-5";
            break;
        case 13:
            imgName = @"rain-5";
            break;
        case 14:
            imgName = @"rain-3";
            break;
        case 15:
            imgName = @"rain-12";
            break;
        case 16:
        case 17:
        case 18:
            imgName = @"storm";
            break;
        case 19:
            imgName = @"rain-8";
            break;

        case 21:
            imgName = @"snowflake-1";
            break;
        case 22:
            imgName = @"snowing-1";
            break;
        case 20:
        case 23:
            imgName = @"snowing";
            break;
        case 24:
        case 25:
            imgName = @"snowing-2";
            break;
        case 26:
        case 27:
        case 28:
        case 29:
            imgName = @"dust";
            break;
        case 30:
        case 31:
            imgName = @"wu";
            break;
        case 32:
            imgName = @"windy-1";
            break;
        case 33:
            imgName = @"windy-2";
            break;
        case 34:
        case 35:
            imgName = @"storm";
            break;
        case 36:
            imgName = @"tornado-1";
            break;
        case 37:
            imgName = @"thermometer-3";
            break;
        case 38:
            imgName = @"thermometer-4";
            break;
        default:
            break;
    }
    
    return imgName;
}

@end
