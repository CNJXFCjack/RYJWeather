//
//  LocationModel.h
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "ModelClass.h"

@interface LocationModel : ModelClass

@property (nonatomic,copy) NSString *cityId;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *country;
@property (nonatomic,copy) NSString *path;
@property (nonatomic,copy) NSString *timezone;
@property (nonatomic,copy) NSString *timezone_offset;

@end
