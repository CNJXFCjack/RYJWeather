//
//  CommonMacro.h
//  ZRWeather
//
//  Created by yijie on 2017/3/31.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

//颜色
#define DEF_UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBAlphaColor(r, g, b, a) \
[UIColor colorWithRed:(r/255.0)\
green:(g/255.0)\
blue:(b/255.0)\
alpha:(a)]


#define SCREEN [UIScreen mainScreen].bounds.size
#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define kCoreDataManager [CoreDataManager shareManager]
#define kDateFormatManager [DateFormatManager shareManager]

#endif /* CommonMacro_h */
