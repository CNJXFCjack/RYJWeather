//
//  NSManagedObject+Helper.h
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Helper)

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc;

@end
