//
//  UICollectionViewCell+Common.h
//  91Job
//
//  Created by GK-Mac on 16/8/6.
//  Copyright © 2016年 HeinQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Common)
/**
 *  返回以类名   用来当做cell的重用标识符
 *
 *  return
 */
+ (NSString *)identifier;

@end
