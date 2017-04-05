//
//  UICollectionViewCell+Common.m
//  91Job
//
//  Created by GK-Mac on 16/8/6.
//  Copyright © 2016年 HeinQi. All rights reserved.
//

#import "UICollectionViewCell+Common.h"

@implementation UICollectionViewCell (Common)

+ (NSString *)identifier{
    return NSStringFromClass([self class]);
}

@end
