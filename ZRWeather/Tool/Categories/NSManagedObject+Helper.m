//
//  NSManagedObject+Helper.m
//  ZRWeather
//
//  Created by yijie on 2017/4/1.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "NSManagedObject+Helper.h"

@implementation NSManagedObject (Helper)

+ (NSString *)entityName{
    return NSStringFromClass([self class]);
}

+ (instancetype)insertNewObjectInManagedObjectContext:(NSManagedObjectContext *)moc
{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName]
                                         inManagedObjectContext:moc];
}

@end
