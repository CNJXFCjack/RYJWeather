//
//  CommonHeader.h
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "CommonMacro.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "Masonry.h"
#import "SVProgressHUD.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "ModelClass.h"
#import "WeatherResponseObj.h"
#import "CoreDataManager.h"
#import "DateFormatManager.h"

//Categories
#import "NSManagedObject+Helper.h"
#import "UICollectionViewCell+Common.h"
#import "UITableViewCell+Common.h"
#import "NSString+Common.h"
#import "UIView+Line.h"

extern NSString * const kWEATHER_BASE_URL;
extern NSString * const kWEATHER_API_KEY;
extern NSString * const kWEATHER_USER_ID;

extern NSString * const kNOW_WEATHER;
extern NSString * const kDAILY_WEATHER;
