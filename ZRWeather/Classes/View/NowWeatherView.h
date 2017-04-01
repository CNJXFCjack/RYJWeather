//
//  NowWeatherView.h
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NowWeather.h"
@interface NowWeatherView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *nowImg;
@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (weak, nonatomic) IBOutlet UILabel *temperature;

- (void)configDataWithNowWeather:(NowWeather *)nowWeather;

@end
