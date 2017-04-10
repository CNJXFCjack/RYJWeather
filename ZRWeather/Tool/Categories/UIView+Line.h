//
//  UIView+Line.h
//  91Job
//
//  Created by GK-Mac on 16/8/6.
//  Copyright © 2016年 HeinQi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Line)

/**
 *  实线
 *
 *  param frame
 *
 *  return
 */
+ (instancetype)borderLineWithFrame:(CGRect)frame;

/**
 *  实线
 *
 *  param frame
 *  param color
 *
 *  return
 */
+ (instancetype)borderLineWithFrame:(CGRect)frame withcolor:(UIColor*)color;


/**
 *  画虚线
 *
 *  param lineView    需要绘制成虚线的view
 *  param lineLength  虚线的宽度
 *  param lineSpacing 虚线的间距
 *  param lineColor   虚线的颜色
 */

+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

/**
 *  对view的边框画成虚线
 *
 *  param lineView    需要绘制成虚线的view
 *  param lineLength  虚线的宽度
 *  param lineSpacing 虚线的间距
 *  param lineColor   虚线的颜色
 *
 *  return
 */

+ (void)drawBorderDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor viewBounds:(CGRect)bounds;
@end
