//
//  NowWeather.h
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "ModelClass.h"

@interface NowWeather : ModelClass

@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *code;
@property (nonatomic,copy) NSString *temperature;

@end
