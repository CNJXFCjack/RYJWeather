//
//  NowWeatherView.m
//  ZRWeather
//
//  Created by yijie on 2017/6/12.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "NowWeatherView.h"
#import "NowWeather.h"

@interface NowWeatherView()

@property (strong, nonatomic) UILabel       *   locationLB;
@property (strong, nonatomic) UILabel       *   tempLB;
@property (strong, nonatomic) UILabel       *   dateLB;
@property (strong, nonatomic) UILabel       *   weatherLB;
@property (strong, nonatomic) UIImageView   *   weatherImg;

@end

@implementation NowWeatherView

- (instancetype)init {
    if (self = [super init]) {
        _locationLB = ({
            UILabel *locationLB = [[UILabel alloc] init];
            locationLB.font = [UIFont systemFontOfSize:18];
            locationLB.textColor = [UIColor whiteColor];
            [self addSubview:locationLB];
            [locationLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.mas_right).offset(-23);
                make.top.equalTo(self);
            }];
            locationLB;
        });
        
        
        _tempLB = ({
            UILabel *tempLB = [[UILabel alloc] init];
            tempLB.font = [UIFont fontWithName:@"Helvetica Bold" size:60];
            tempLB.textColor = [UIColor whiteColor];
            [self addSubview:tempLB];
            [tempLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.locationLB.mas_bottom).offset(10);
                make.right.equalTo(self.mas_right).offset(-10);
            }];
            tempLB;
        });
        
        _dateLB = ({
            UILabel *dateLB = [[UILabel alloc] init];
            dateLB.font = [UIFont systemFontOfSize:18];
            dateLB.textColor = [UIColor whiteColor];
            [self addSubview:dateLB];
            [dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.tempLB.mas_bottom).offset(10);
                make.right.equalTo(self.mas_right).offset(-10);
            }];
            dateLB;
        });
        
        
        _weatherImg = ({
            UIImageView *weatherImg = [[UIImageView alloc] init];
            [self addSubview:weatherImg];
            [weatherImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.dateLB.mas_bottom).offset(5);
                make.right.equalTo(self.mas_right).offset(-10);
                make.width.height.mas_equalTo(60);
            }];
            weatherImg;
        });
    }
    return self;
}

- (void)configureData:(NowWeather *)nowWeather location:(NSString *)location{

}

@end
