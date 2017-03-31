//
//  ModelClass.m
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "ModelClass.h"

@implementation ModelClass

- (instancetype)initWithParameters:(NSDictionary *)parameters{
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

+ (NSArray *)multiWithParametetsArray:(NSArray *)array{
    NSMutableArray *multi = [NSMutableArray arrayWithCapacity:array.count];
    if ([array isKindOfClass:[NSNull class]]) {
        return multi;
    }
    for (NSDictionary *params in array) {
        [multi addObject:[[[self class] alloc] initWithParameters:params]];
    }
    return multi;
}

@end
