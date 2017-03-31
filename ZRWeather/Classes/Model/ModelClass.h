//
//  ModelClass.h
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NotNull)

- (instancetype)notNull;

@end

@implementation NSObject(NotNull)

- (instancetype)notNull{
    return self;
}
@end

@implementation NSNull(NotNull)

- (instancetype)notNull{
    return nil;
}

@end

@interface ModelClass : NSObject

- (instancetype)initWithParameters:(NSDictionary *)parameters;
+ (NSArray *)multiWithParametetsArray:(NSArray *)array;

@end
