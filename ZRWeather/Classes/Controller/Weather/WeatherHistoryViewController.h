//
//  WeatherHistoryViewController.h
//  ZRWeather
//
//  Created by yijie on 2017/4/6.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "BaseViewController.h"

@interface WeatherHistoryViewController : BaseViewController

@property (nonatomic,copy) NSString *location;

@property (nonatomic,strong) RACSubject *dismissSub;

@end
