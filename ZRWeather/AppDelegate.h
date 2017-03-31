//
//  AppDelegate.h
//  ZRWeather
//
//  Created by yijie on 2017/3/31.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

